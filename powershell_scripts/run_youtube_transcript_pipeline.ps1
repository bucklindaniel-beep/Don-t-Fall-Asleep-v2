param (
    [string]$Url = "PASTE_YOUTUBE_URL_HERE",
    [string]$RepositoryRoot = "C:\AI Production\Don't Fall Asleep\Dont' Fall Asleep Development\Don't Fall Asleep - Claude Repository Copy\Don-t-Fall-Asleep-v2"
)

# ===== CONFIG =====
$ytDlpPath = "C:\AI Production\Tools\yt-dlp\yt-dlp.exe"
$ffmpegPath = "C:\AI Production\Tools\ffmpeg\bin"
$postProcessScript = Join-Path $RepositoryRoot "powershell_scripts\post_process_transcript.ps1"

$RawFolder = Join-Path $RepositoryRoot "transcripts\raw"
$CleanedFolder = Join-Path $RepositoryRoot "transcripts\cleaned"

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
    Write-Host "ERROR: yt-dlp not found at: $ytDlpPath"
    exit 1
}

if (!(Test-Path -LiteralPath $ffmpegPath)) {
    Write-Host "ERROR: FFmpeg path not found: $ffmpegPath"
    exit 1
}

if (!(Test-Path -LiteralPath $postProcessScript)) {
    Write-Host "ERROR: post_process_transcript.ps1 not found at: $postProcessScript"
    exit 1
}

New-Item -ItemType Directory -Path $RawFolder -Force | Out-Null
New-Item -ItemType Directory -Path $CleanedFolder -Force | Out-Null

# ===== VIDEO ID / DUPLICATE CHECK =====
$videoId = ""

if ($Url -match "v=([A-Za-z0-9_-]{6,})") {
    $videoId = $matches[1]
}
elseif ($Url -match "youtu\.be/([A-Za-z0-9_-]{6,})") {
    $videoId = $matches[1]
}

if ($videoId -ne "") {
    $escapedVideoId = [regex]::Escape("[$videoId]")

    $existingRaw = Get-ChildItem -LiteralPath $RawFolder -File -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -match $escapedVideoId
    }

    $existingCleaned = Get-ChildItem -LiteralPath $CleanedFolder -File -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -match $escapedVideoId
    }

    if ($existingCleaned.Count -gt 0) {
        Write-Host "SKIP: Cleaned transcript already exists for video ID: $videoId"
        Write-Host "Existing cleaned file(s):"
        $existingCleaned | ForEach-Object { Write-Host " - $($_.FullName)" }
        Write-Host ""
        Write-Host "To reprocess, delete the existing cleaned file or run post_process_transcript.ps1 manually."
        exit 0
    }

    if ($existingRaw.Count -gt 0) {
        Write-Host "NOTICE: Raw file already exists for video ID: $videoId"
        Write-Host "Skipping yt-dlp download and running post-processing only."

        & $postProcessScript `
            -InputFolder $RawFolder `
            -OutputFolder $CleanedFolder

        if ($LASTEXITCODE -ne 0) {
            Write-Host "ERROR: Post-processing failed."
            exit $LASTEXITCODE
        }

        Write-Host "DONE: Existing raw file post-processed."
        exit 0
    }
}

# ===== STEP 1: INGEST =====
Write-Host "STEP 1: Ingesting YouTube transcript..."
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

# ===== STEP 2: POST PROCESS =====
Write-Host "STEP 2: Post-processing transcript..."
Write-Host "Cleaned folder: $CleanedFolder"

& $postProcessScript `
    -InputFolder $RawFolder `
    -OutputFolder $CleanedFolder

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Post-processing failed."
    exit $LASTEXITCODE
}

Write-Host "DONE: Pipeline complete."
Write-Host "Raw folder: $RawFolder"
Write-Host "Cleaned folder: $CleanedFolder"
