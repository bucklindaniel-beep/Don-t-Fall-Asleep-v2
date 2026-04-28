param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2",
    [string]$InputFolder = ".\transcripts\incoming_raw_txt",
    [string]$OutputFolder = ".\transcripts\raw",
    [switch]$Force,
    [switch]$DebugMode
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Status, [string]$Message)
    Write-Host ($Status + " - " + $Message)
}

function Resolve-RepoPath {
    param([string]$PathValue)
    if ([System.IO.Path]::IsPathRooted($PathValue)) { return $PathValue }
    return (Join-Path $RepoRoot $PathValue)
}

function Get-SafeFileName {
    param([string]$Name)
    $safe = $Name.ToLowerInvariant()
    $safe = $safe -replace '[^a-z0-9]+', '_'
    $safe = $safe.Trim('_')
    if ([string]::IsNullOrWhiteSpace($safe)) { $safe = "transcript" }
    return $safe
}

function Escape-MarkdownValue {
    param([string]$Value)
    if ([string]::IsNullOrWhiteSpace($Value)) { return "unknown" }
    return ($Value.Trim() -replace "`r", "" -replace "`n", " ")
}

if (-not (Test-Path $RepoRoot)) { throw "RepoRoot not found: $RepoRoot" }
Set-Location $RepoRoot

$resolvedInput = Resolve-RepoPath $InputFolder
$resolvedOutput = Resolve-RepoPath $OutputFolder

if (-not (Test-Path $resolvedInput)) {
    Write-Status "SKIP" "Input folder not found: $resolvedInput"
    exit 0
}

New-Item -ItemType Directory -Force -Path $resolvedOutput | Out-Null

$files = Get-ChildItem -Path $resolvedInput -File | Where-Object {
    $_.Extension.ToLowerInvariant() -in @(".txt", ".md", ".srt", ".vtt")
}

if ($files.Count -eq 0) {
    Write-Status "SKIP" "No supported transcript files found"
    exit 0
}

foreach ($file in $files) {
    try {
        $raw = Get-Content -Path $file.FullName -Raw
        if ([string]::IsNullOrWhiteSpace($raw)) {
            Write-Status "SKIP" "Empty file: $($file.Name)"
            continue
        }

        $sourceName = Get-SafeFileName $file.BaseName
        $outPath = Join-Path $resolvedOutput ($sourceName + ".md")

        if ((Test-Path $outPath) -and -not $Force) {
            Write-Status "SKIP" "Output exists: $($sourceName).md"
            continue
        }

        $title = Escape-MarkdownValue $file.BaseName
        $dateIngested = Get-Date -Format "yyyy-MM-dd"

        $lines = @(
            "# Transcript — Raw",
            "",
            "## Metadata",
            "- Source Name: $sourceName",
            "- Source Type: youtube_transcript",
            "- Original Title: $title",
            "- Creator: unknown",
            "- URL: unknown",
            "- Date Ingested: $dateIngested",
            "- Story Count: 1",
            "- Pipeline Stage: raw",
            "",
            "---",
            "",
            "## Story 01 — $title",
            "",
            $raw.TrimEnd()
        )

        Set-Content -Path $outPath -Value ($lines -join "`r`n") -Encoding UTF8
        Write-Status "PASS" "Prepared RAW transcript: $($sourceName).md"
    }
    catch {
        Write-Status "FAIL" ($file.Name + ": " + $_.Exception.Message)
    }
}
