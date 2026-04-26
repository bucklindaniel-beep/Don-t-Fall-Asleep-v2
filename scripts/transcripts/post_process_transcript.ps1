param (
    [string]$InputFolder = "",
    [string]$OutputFolder = "",
    [string]$RepositoryRoot = "C:\AI Production\Don't Fall Asleep\Dont' Fall Asleep Development\Don't Fall Asleep - Claude Repository Copy\Don-t-Fall-Asleep-v2"
)

# ===== PURPOSE =====
# Cleans raw transcript files and creates metadata-rich .md files.
# Adds Source Type metadata during post-processing.
# Uses safe regex matching for YouTube video IDs wrapped in brackets.
# Uses repo-relative defaults so this script can run from any directory.

# ===== DEFAULT PATHS =====
if ([string]::IsNullOrWhiteSpace($InputFolder)) {
    $InputFolder = Join-Path $RepositoryRoot "transcripts\raw"
}

if ([string]::IsNullOrWhiteSpace($OutputFolder)) {
    $OutputFolder = Join-Path $RepositoryRoot "transcripts\cleaned"
}

$SourceType = "youtube_video"

# ===== VALIDATION =====
if (!(Test-Path -LiteralPath $RepositoryRoot)) {
    Write-Host "ERROR: Repository root not found: $RepositoryRoot"
    exit 1
}

if (!(Test-Path -LiteralPath $InputFolder)) {
    Write-Host "ERROR: Input folder not found: $InputFolder"
    exit 1
}

New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null

# ===== FILE DISCOVERY =====
$files = Get-ChildItem -LiteralPath $InputFolder -File | Where-Object {
    $_.Extension -in ".srt", ".vtt", ".txt"
}

if ($files.Count -eq 0) {
    Write-Host "No .srt, .vtt, or .txt transcript files found in: $InputFolder"
    exit 0
}

function Get-NearestInfoJson {
    param (
        [string]$Folder,
        [string]$TranscriptBaseName
    )

    $jsonFiles = Get-ChildItem -LiteralPath $Folder -File -Filter "*.info.json"

    if ($jsonFiles.Count -eq 0) {
        return $null
    }

    $videoIdMatch = [regex]::Match($TranscriptBaseName, '\[([A-Za-z0-9_-]{6,})\]')

    if ($videoIdMatch.Success) {
        $videoId = $videoIdMatch.Groups[1].Value
        $escapedBracketedVideoId = [regex]::Escape("[$videoId]")

        $match = $jsonFiles | Where-Object {
            $_.Name -match $escapedBracketedVideoId
        } | Select-Object -First 1

        if ($match) {
            return $match.FullName
        }
    }

    $looseBase = $TranscriptBaseName -replace '\.en$', ''
    $escapedLooseBase = [regex]::Escape($looseBase)

    $match = $jsonFiles | Where-Object {
        $_.BaseName -match "^$escapedLooseBase"
    } | Select-Object -First 1

    if ($match) {
        return $match.FullName
    }

    return $null
}

function Get-SafeMetadataValue {
    param (
        $Object,
        [string]$Name,
        [string]$Fallback = ""
    )

    if ($null -ne $Object -and $Object.PSObject.Properties.Name -contains $Name) {
        $value = $Object.$Name

        if ($null -ne $value -and "$value".Trim() -ne "") {
            return "$value"
        }
    }

    return $Fallback
}

foreach ($file in $files) {
    Write-Host "Processing: $($file.Name)"

    $raw = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $clean = $raw

    $clean = $clean -replace 'WEBVTT[\s\S]*?\r?\n\r?\n', ''
    $clean = $clean -replace '(?m)^\d+\s*$', ''
    $clean = $clean -replace '(?m)^\d{2}:\d{2}:\d{2}[\.,]\d{3}\s+-->\s+\d{2}:\d{2}:\d{2}[\.,]\d{3}.*$', ''
    $clean = $clean -replace '<\d{2}:\d{2}:\d{2}\.\d{3}>', ''
    $clean = $clean -replace '</?c[^>]*>', ''
    $clean = $clean -replace '</?v[^>]*>', ''
    $clean = $clean -replace '</?i>', ''
    $clean = $clean -replace '&amp;', '&'
    $clean = $clean -replace '&quot;', '"'
    $clean = $clean -replace '&#39;', "'"
    $clean = $clean -replace '&lt;', '<'
    $clean = $clean -replace '&gt;', '>'

    $lines = $clean -split '\r?\n' |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -ne '' }

    $deduped = New-Object System.Collections.Generic.List[string]
    $previous = $null

    foreach ($line in $lines) {
        if ($line -ne $previous) {
            $deduped.Add($line)
        }

        $previous = $line
    }

    $body = ($deduped -join ' ')
    $body = $body -replace '\s{2,}', ' '
    $body = $body.Trim()

    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $jsonPath = Get-NearestInfoJson -Folder $InputFolder -TranscriptBaseName $baseName
    $metadata = $null

    if ($jsonPath) {
        try {
            $metadata = Get-Content -LiteralPath $jsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
        }
        catch {
            Write-Host "WARNING: Could not parse metadata JSON: $jsonPath"
        }
    }

    $title = Get-SafeMetadataValue -Object $metadata -Name "title" -Fallback $baseName
    $channel = Get-SafeMetadataValue -Object $metadata -Name "uploader" -Fallback ""
    $videoId = Get-SafeMetadataValue -Object $metadata -Name "id" -Fallback ""
    $webpageUrl = Get-SafeMetadataValue -Object $metadata -Name "webpage_url" -Fallback ""
    $uploadDate = Get-SafeMetadataValue -Object $metadata -Name "upload_date" -Fallback ""
    $duration = Get-SafeMetadataValue -Object $metadata -Name "duration" -Fallback ""

    $processedAt = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $outputFile = Join-Path $OutputFolder "$baseName.cleaned.md"
    $metadataFileName = ""

    if ($jsonPath) {
        $metadataFileName = [System.IO.Path]::GetFileName($jsonPath)
    }

    $markdown = @"
# Cleaned Transcript

## Metadata

- Source Type: $SourceType
- Source File: $($file.Name)
- Metadata File: $metadataFileName
- Title: $title
- Channel: $channel
- URL: $webpageUrl
- Video ID: $videoId
- Upload Date: $uploadDate
- Duration Seconds: $duration
- Processed At: $processedAt
- Pipeline Stage: cleaned
- Next Stage: structured
- Usage Rule: Analysis only. Do not copy source language directly into generation.

## Cleaned Transcript

$body
"@

    Set-Content -LiteralPath $outputFile -Value $markdown -Encoding UTF8
    Write-Host "Saved: $outputFile"
}

Write-Host ""
Write-Host "Post-processing complete."
Write-Host "Output folder: $OutputFolder"
exit 0
