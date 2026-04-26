param(
    [string]$InputFile = ".\inputs\youtube_video_urls.txt",
    [string]$OutputRoot = ".\transcripts\raw"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $InputFile)) {
    throw "Input file not found: $InputFile"
}

New-Item -ItemType Directory -Force -Path $OutputRoot | Out-Null

$urls = Get-Content $InputFile | Where-Object { $_.Trim() -and -not $_.Trim().StartsWith("#") }

foreach ($url in $urls) {
    Write-Host "Processing: $url"

    .\yt-dlp.exe `
        --skip-download `
        --write-auto-subs `
        --write-subs `
        --sub-langs "en.*,en" `
        --convert-subs srt `
        --write-info-json `
        --write-thumbnail `
        --ignore-errors `
        --no-overwrites `
        --output "$OutputRoot\%(uploader)s__%(id)s__%(title).80s.%(ext)s" `
        $url
}

Write-Host "Batch transcript intake complete."
