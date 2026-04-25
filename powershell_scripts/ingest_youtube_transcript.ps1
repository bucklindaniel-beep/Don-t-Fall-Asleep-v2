param (
    [string]$Url = "PASTE_YOUTUBE_URL_HERE",
    [string]$RepositoryRoot = "C:\AI Production\Don't Fall Asleep\Dont' Fall Asleep Development\Don't Fall Asleep - Claude Repository Copy\Don-t-Fall-Asleep-v2"
)

# ===== PURPOSE =====
# Ingests YouTube transcript/subtitle files and metadata into /transcripts/raw.
# Uses absolute tool paths so this script can run from any directory.

# ===== TOOL PATHS =====
$ytDlpPath = "C:\AI Production\Tools\yt-dlp\yt-dlp.exe"
$ffmpegPath = "C:\AI Production\Tools\ffmpeg\bin"

# ===== OUTPUT PATHS =====
$RawFolder = Join-Path $RepositoryRoot "transcripts\raw"

# ===== VALIDATION =====
if ($Url -eq "PASTE_YOUTUBE_URL_HERE" -or [string]::IsNullOrWhiteSpace($Url)) {
    Write-Host "ERROR: Please provide a valid YouTube URL."
    exit 1
}

if (!(Test-Path -LiteralPath $RepositoryRoot)) {
    Write-Host "ERROR: Repository root not found: $RepositoryRoot"
    exit 1
}

if (!(Test-Path -LiteralPath $ytDlpPath)) {
    Write-Host "ERROR: yt-dlp.exe not found at: $ytDlpPath"
    exit 1
}

if (!(Test-Path -LiteralPath $ffmpegPath)) {
    Write-Host "ERROR: FFmpeg bin folder not found at: $ffmpegPath"
    exit 1
}

New-Item -ItemType Directory -Path $RawFolder -Force | Out-Null

# ===== EXECUTION =====
Write-Host "STEP: Ingesting YouTube transcript..."
Write-Host "URL: $Url"
Write-Host "Raw folder: $RawFolder"

& $ytDlpPath `
    --ffmpeg-location $ffmpegPath `
    --write-auto-subs `
    --skip-download `
    --convert-subs srt `
    --write-info-json `
    -P $RawFolder `
    $Url

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: yt-dlp ingestion failed."
    exit $LASTEXITCODE
}

Write-Host "DONE: Raw transcript and metadata saved."
exit 0
