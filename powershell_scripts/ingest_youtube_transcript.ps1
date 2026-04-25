param (
    [string]$InputFolder = "C:\Users\bigpa\Videos\Don't Fall Asleep\transcripts\raw",
    [string]$OutputFolder = "C:\Users\bigpa\Videos\Don't Fall Asleep\transcripts\cleaned"
)

# ===== CONFIG =====
# Cleans raw .srt, .vtt, and .txt transcript files into .md files.
# Uses single-quoted regex strings to avoid PowerShell parsing issues.

# ===== VALIDATION =====
if (!(Test-Path -LiteralPath $InputFolder)) {
    Write-Host "Input folder not found: $InputFolder"
    exit 1
}

if (!(Test-Path -LiteralPath $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
    Write-Host "Created output folder: $OutputFolder"
}

# ===== FILE DISCOVERY =====
$files = Get-ChildItem -LiteralPath $InputFolder -File | Where-Object {
    $_.Extension -in ".srt", ".vtt", ".txt"
}

if ($files.Count -eq 0) {
    Write-Host "No .srt, .vtt, or .txt transcript files found in: $InputFolder"
    exit 0
}

# ===== PROCESS FILES =====
foreach ($file in $files) {
    Write-Host "Processing: $($file.Name)"

    $raw = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $clean = $raw

    # Remove WEBVTT header
    $clean = $clean -replace 'WEBVTT[\s\S]*?\r?\n\r?\n', ''

    # Remove SRT numbering lines
    $clean = $clean -replace '(?m)^\d+\s*$', ''

    # Remove SRT/VTT timestamp lines
    $clean = $clean -replace '(?m)^\d{2}:\d{2}:\d{2}[\.,]\d{3}\s+-->\s+\d{2}:\d{2}:\d{2}[\.,]\d{3}.*$', ''

    # Remove VTT inline timestamp tags
    $clean = $clean -replace '<\d{2}:\d{2}:\d{2}\.\d{3}>', ''

    # Remove common subtitle tags
    $clean = $clean -replace '</?c[^>]*>', ''
    $clean = $clean -replace '</?v[^>]*>', ''
    $clean = $clean -replace '</?i>', ''

    # Normalize common HTML entities
    $clean = $clean -replace '&amp;', '&'
    $clean = $clean -replace '&quot;', '"'
    $clean = $clean -replace '&#39;', "'"
    $clean = $clean -replace '&lt;', '<'
    $clean = $clean -replace '&gt;', '>'

    # Trim each line and remove blanks
    $lines = $clean -split '\r?\n' |
        ForEach-Object { $_.Trim() } |
        Where-Object { $_ -ne '' }

    # Remove consecutive duplicate subtitle lines
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

    # Build output markdown
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $outputFile = Join-Path $OutputFolder "$baseName.cleaned.md"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $markdown = @"
# Cleaned Transcript

## Metadata

- Source File: $($file.Name)
- Processed At: $timestamp
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
