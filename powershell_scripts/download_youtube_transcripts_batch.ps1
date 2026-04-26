param(
    [string]$InputFile = ".\inputs\youtube_video_urls.txt",
    [string]$OutputRoot = ".\transcripts\raw"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path ".\yt-dlp.exe")) {
    throw "yt-dlp.exe not found in repo root. Place yt-dlp.exe in the repo root or update the script path."
}

if (-not (Test-Path $InputFile)) {
    throw "Input file not found: $InputFile"
}

New-Item -ItemType Directory -Force -Path $OutputRoot | Out-Null

$urls = Get-Content $InputFile | Where-Object {
    $_.Trim() -and -not $_.Trim().StartsWith("#")
}

if ($urls.Count -eq 0) {
    throw "No valid YouTube URLs found in $InputFile"
}

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

Write-Host "Download complete. Converting SRT transcripts to MD..."

$srtFiles = Get-ChildItem $OutputRoot -Filter "*.srt"

if ($srtFiles.Count -eq 0) {
    throw "No .srt transcript files found in $OutputRoot. The video may not have English captions."
}

foreach ($file in $srtFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $outputPath = Join-Path $OutputRoot "$baseName.md"

    if (Test-Path $outputPath) {
        Write-Host "Skipping existing MD: $outputPath"
        continue
    }

    Write-Host "Cleaning: $($file.Name)"

    Get-Content $file.FullName |
        Where-Object {
            $_ -notmatch '^\d+$' -and
            $_ -notmatch '-->' -and
            $_.Trim() -ne ''
        } |
        ForEach-Object {
            $_.Trim()
        } |
        Set-Content $outputPath -Encoding UTF8

    Write-Host "Created: $outputPath"
}

Write-Host "Transcript intake complete."
Write-Host "Ready for Claude upload/testing: $OutputRoot\*.md"
