param(
    [string]$InputFolder = ".\transcripts\incoming_raw_txt",
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2",
    [switch]$Force,
    [switch]$DebugMode
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param(
        [ValidateSet("PASS", "SKIP", "FAIL")]
        [string]$Status,
        [string]$Message
    )

    Write-Host "$Status - $Message"
}

function Get-SafeFileName {
    param([string]$Name)

    $safe = $Name.ToLowerInvariant()
    $safe = $safe -replace '[^a-z0-9]+', '_'
    $safe = $safe.Trim('_')

    if ([string]::IsNullOrWhiteSpace($safe)) {
        return "transcript"
    }

    return $safe
}

function Test-RawOutputStructure {
    param([string]$Path)

    $content = Get-Content -LiteralPath $Path -Raw

    $required = @(
        "# Transcript — Raw",
        "## Metadata",
        "- Source Name:",
        "- Source Type:",
        "- Original Title:",
        "- Creator:",
        "- URL:",
        "- Date Ingested:",
        "- Story Count:",
        "- Pipeline Stage: raw",
        "---",
        "## Story 01 —"
    )

    foreach ($item in $required) {
        if ($content -notlike "*$item*") {
            throw "Missing required RAW structure item: $item"
        }
    }
}

function New-RawTranscriptContent {
    param(
        [string]$SourceName,
        [string]$OriginalText
    )

    $lines = @(
        "# Transcript — Raw",
        "",
        "## Metadata",
        "- Source Name: $SourceName",
        "- Source Type: unknown",
        "- Original Title: unknown",
        "- Creator: unknown",
        "- URL: unknown",
        "- Date Ingested: $(Get-Date -Format 'yyyy-MM-dd')",
        "- Story Count: 1",
        "- Pipeline Stage: raw",
        "",
        "---",
        "",
        "## Story 01 — $SourceName",
        "",
        $OriginalText
    )

    return ($lines -join [Environment]::NewLine)
}

try {
    $resolvedRepoRoot = Resolve-Path -LiteralPath $RepoRoot
    $rawOutputFolder = Join-Path $resolvedRepoRoot "transcripts\raw"

    if (-not (Test-Path -LiteralPath $InputFolder)) {
        throw "Input folder not found: $InputFolder"
    }

    $resolvedInputFolder = Resolve-Path -LiteralPath $InputFolder

    if ($resolvedInputFolder.Path -eq $rawOutputFolder) {
        throw "Input folder cannot be the same as output folder."
    }

    New-Item -ItemType Directory -Force -Path $rawOutputFolder | Out-Null

    $files = Get-ChildItem -LiteralPath $resolvedInputFolder -Filter "*.txt" -File | Sort-Object Name

    if ($files.Count -eq 0) {
        Write-Status "SKIP" "No .txt files found"
        exit 0
    }

    foreach ($file in $files) {
        try {
            $text = Get-Content -LiteralPath $file.FullName -Raw

            if ([string]::IsNullOrWhiteSpace($text)) {
                Write-Status "SKIP" "$($file.Name) empty input"
                continue
            }

            $safeBaseName = Get-SafeFileName -Name $file.BaseName
            $outputFile = Join-Path $rawOutputFolder "$safeBaseName.md"

            if ((Test-Path -LiteralPath $outputFile) -and (-not $Force)) {
                Write-Status "SKIP" "$($file.Name) output exists"
                continue
            }

            $rawContent = New-RawTranscriptContent -SourceName $safeBaseName -OriginalText $text

            Set-Content -LiteralPath $outputFile -Value $rawContent -Encoding UTF8 -NoNewline

            Test-RawOutputStructure -Path $outputFile

            Write-Status "PASS" "$($file.Name) -> transcripts\raw\$safeBaseName.md"
        }
        catch {
            Write-Status "FAIL" "$($file.Name) $($_.Exception.Message)"

            if ($DebugMode) {
                Write-Host $_.ScriptStackTrace
            }
        }
    }
}
catch {
    Write-Status "FAIL" $_.Exception.Message

    if ($DebugMode) {
        Write-Host $_.ScriptStackTrace
    }

    exit 1
}