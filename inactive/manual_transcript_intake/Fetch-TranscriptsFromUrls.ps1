param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2",
    [string]$UrlFile = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\youtube_urls.txt",
    [string]$OutputFolder = ".\transcripts\incoming_raw_txt",
    [string]$YtDlpPath = ".\tools\yt-dlp.exe",
    [string]$FfmpegBinPath = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\tools\ffmpeg\ffmpeg-8.1-essentials_build\bin",
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

if (-not (Test-Path $RepoRoot)) { throw "RepoRoot not found: $RepoRoot" }
Set-Location $RepoRoot

if (Test-Path $FfmpegBinPath) {
    $env:PATH = $FfmpegBinPath + ";" + $env:PATH
    Write-Status "PASS" "FFmpeg path injected"
} else {
    Write-Status "WARN" "FFmpeg path not found: $FfmpegBinPath"
}

$resolvedYtDlp = Resolve-RepoPath $YtDlpPath
$resolvedOutput = Resolve-RepoPath $OutputFolder

if (-not (Test-Path $resolvedYtDlp)) { throw "yt-dlp not found: $resolvedYtDlp" }
if (-not (Test-Path $UrlFile)) { throw "URL file not found: $UrlFile" }
New-Item -ItemType Directory -Force -Path $resolvedOutput | Out-Null

$urls = Get-Content -Path $UrlFile | Where-Object {
    $line = $_.Trim()
    $line.Length -gt 0 -and -not $line.StartsWith("#")
}

if ($urls.Count -eq 0) {
    Write-Status "SKIP" "No URLs found in $UrlFile"
    exit 0
}

$template = Join-Path $resolvedOutput "%(upload_date>%Y%m%d)s_%(id)s_%(title).80B.%(ext)s"

foreach ($url in $urls) {
    try {
        Write-Status "PASS" "Fetching transcript: $url"

        $args = @(
            "--write-subs",
            "--write-auto-subs",
            "--sub-langs", "en.*",
            "--sub-format", "vtt/best",
            "--skip-download",
            "--convert-subs", "srt",
            "--no-playlist",
            "--restrict-filenames",
            "--output", $template,
            $url
        )

        if ($Force) {
            $args = @("--force-overwrites") + $args
        } else {
            $args = @("--no-overwrites") + $args
        }

        if ($DebugMode) {
            Write-Status "DEBUG" ($resolvedYtDlp + " " + ($args -join " "))
        }

        & $resolvedYtDlp @args
        if ($LASTEXITCODE -ne 0) { throw "yt-dlp exited with code $LASTEXITCODE" }

        Write-Status "PASS" "Transcript fetch complete"
    }
    catch {
        Write-Status "FAIL" $_.Exception.Message
    }
}
