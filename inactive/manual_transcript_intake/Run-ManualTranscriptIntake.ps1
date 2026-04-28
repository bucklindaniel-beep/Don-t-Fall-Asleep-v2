param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2",
    [string]$UrlFile = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\youtube_urls.txt",
    [string]$InputFolder = ".\transcripts\incoming_raw_txt",
    [string]$OutputFolder = ".\transcripts\raw",
    [switch]$Fetch,
    [switch]$Prepare,
    [switch]$Force,
    [switch]$DebugMode
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Status, [string]$Message)
    Write-Host ($Status + " - " + $Message)
}

if (-not $Fetch -and -not $Prepare) {
    Write-Status "SKIP" "No action selected. Use -Fetch, -Prepare, or both."
    exit 0
}

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

if ($Fetch) {
    $fetchScript = Join-Path $scriptRoot "Fetch-TranscriptsFromUrls.ps1"
    Write-Status "PASS" "Starting fetch step"
    & $fetchScript -RepoRoot $RepoRoot -UrlFile $UrlFile -InputFolder $InputFolder -Force:$Force -DebugMode:$DebugMode
    if ($LASTEXITCODE -ne 0) { Write-Status "WARN" "Fetch step returned code $LASTEXITCODE" }
}

if ($Prepare) {
    $prepScript = Join-Path $scriptRoot "Prepare-RawTranscripts.ps1"
    Write-Status "PASS" "Starting RAW prep step"
    & $prepScript -RepoRoot $RepoRoot -InputFolder $InputFolder -OutputFolder $OutputFolder -Force:$Force -DebugMode:$DebugMode
    if ($LASTEXITCODE -ne 0) { Write-Status "WARN" "Prepare step returned code $LASTEXITCODE" }
}

Write-Status "PASS" "Manual transcript intake runner complete"
