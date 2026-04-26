param (
    [string]$Url = "PASTE_YOUTUBE_URL_HERE",
    [string]$RepositoryRoot = "C:\AI Production\Don't Fall Asleep\Dont' Fall Asleep Development\Don't Fall Asleep - Claude Repository Copy\Don-t-Fall-Asleep-v2",
    [switch]$ForceReprocess
)

# ===== PURPOSE =====
# Full YouTube transcript pipeline kickoff:
# yt-dlp ingest -> cleaned transcript -> structured scaffold.
# Uses absolute paths for yt-dlp and FFmpeg so this can run from anywhere.
# Supports targeted cleanup with -ForceReprocess.

# ===== TOOL PATHS =====
$ytDlpPath = "C:\AI Production\Tools\yt-dlp\yt-dlp.exe"
$ffmpegPath = "C:\AI Production\Tools\ffmpeg\bin"

# ===== SCRIPT PATHS =====
$postProcessScript = Join-Path $RepositoryRoot "powershell_scripts\post_process_transcript.ps1"
$structureScript = Join-Path $RepositoryRoot "powershell_scripts\structure_cleaned_transcript.ps1"

# ===== OUTPUT PATHS =====
$RawFolder = Join-Path $RepositoryRoot "transcripts\raw"
$CleanedFolder = Join-Path $RepositoryRoot "transcripts\cleaned"
$StructuredFolder = Join-Path $RepositoryRoot "transcripts\structured"

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

if (!(Test-Path -LiteralPath $postProcessScript)) {
    Write-Host "ERROR: post_process_transcript.ps1 not found at: $postProcessScript"
    exit 1
}

if (!(Test-Path -LiteralPath $structureScript)) {
    Write-Host "ERROR: structure_cleaned_transcript.ps1 not found at: $structureScript"
    exit 1
}

New-Item -ItemType Directory -Path $RawFolder -Force | Out-Null
New-Item -ItemType Directory -Path $CleanedFolder -Force | Out-Null
New-Item -ItemType Directory -Path $StructuredFolder -Force | Out-Null

# ===== VIDEO ID DETECTION =====
$videoId = ""

if ($Url -match "v=([A-Za-z0-9_-]{6,})") {
    $videoId = $matches[1]
}
elseif ($Url -match "youtu\.be/([A-Za-z0-9_-]{6,})") {
    $videoId = $matches[1]
}

# ===== TARGETED CLEANUP / DUPLICATE CHECK =====
if ($videoId -ne "") {
    $escapedVideoId = [regex]::Escape("[$videoId]")

    $matchingFiles = Get-ChildItem -LiteralPath (Join-Path $RepositoryRoot "transcripts") -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
        $_.Name -match $escapedVideoId
    }

    if ($ForceReprocess) {
        if ($matchingFiles.Count -gt 0) {
            Write-Host "FORCE REPROCESS ENABLED"
            Write-Host "Deleting existing files for video ID: $videoId"

            $matchingFiles | ForEach-Object {
                Write-Host "Deleting: $($_.FullName)"
                Remove-Item -LiteralPath $_.FullName -Force
            }
        }
        else {
            Write-Host "FORCE REPROCESS ENABLED"
            Write-Host "No existing files found for video ID: $videoId"
        }
    }
    else {
        $existingStructured = $matchingFiles | Where-Object {
            $_.FullName -like "*\transcripts\structured\*"
        }

        if ($existingStructured.Count -gt 0) {
            Write-Host "SKIP: Structured transcript already exists for video ID: $videoId"
            $existingStructured | ForEach-Object { Write-Host " - $($_.FullName)" }
            Write-Host ""
            Write-Host "To reprocess, rerun with -ForceReprocess"
            exit 0
        }
    }
}
else {
    Write-Host "WARNING: Could not detect YouTube video ID from URL."
    Write-Host "Duplicate cleanup/check will be skipped."
}

# ===== STEP 1: INGEST =====
Write-Host ""
Write-Host "STEP 1: Ingesting YouTube transcript..."
Write-Host "URL: $Url"

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

# ===== STEP 2: CLEAN =====
Write-Host ""
Write-Host "STEP 2: Cleaning transcript..."

& $postProcessScript `
    -InputFolder $RawFolder `
    -OutputFolder $CleanedFolder `
    -RepositoryRoot $RepositoryRoot

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Post-processing failed."
    exit $LASTEXITCODE
}

# ===== STEP 3: STRUCTURE SCAFFOLD =====
Write-Host ""
Write-Host "STEP 3: Creating structured scaffold..."

& $structureScript `
    -InputFolder $CleanedFolder `
    -OutputFolder $StructuredFolder `
    -RepositoryRoot $RepositoryRoot

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Structuring failed."
    exit $LASTEXITCODE
}

Write-Host ""
Write-Host "DONE: Transcript pipeline complete."
Write-Host "Raw folder: $RawFolder"
Write-Host "Cleaned folder: $CleanedFolder"
Write-Host "Structured folder: $StructuredFolder"
exit 0
