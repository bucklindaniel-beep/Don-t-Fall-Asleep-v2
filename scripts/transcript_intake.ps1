# transcript_intake.ps1
# Usage:
# .\transcript_intake.ps1 "YOUTUBE_VIDEO_URL"

param(
    [Parameter(Mandatory=$true)]
    [string]$VideoUrl
)

$RawDir = ".\transcripts\raw"
New-Item -ItemType Directory -Force -Path $RawDir | Out-Null

Write-Host "Downloading transcript..."

.\yt-dlp.exe `
  --write-auto-sub `
  --write-sub `
  --sub-lang en `
  --skip-download `
  --convert-subs srt `
  -o "$RawDir\%(title)s.%(ext)s" `
  $VideoUrl

Write-Host "Converting SRT to clean TXT/MD..."

$srtFiles = Get-ChildItem $RawDir -Filter "*.srt"

foreach ($file in $srtFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $outputPath = Join-Path $RawDir "$baseName.md"

    Get-Content $file.FullName |
        Where-Object {
            $_ -notmatch '^\d+$' -and
            $_ -notmatch '-->' -and
            $_.Trim() -ne ''
        } |
        Set-Content $outputPath

    Write-Host "Created: $outputPath"
}

Write-Host "Transcript intake complete."
