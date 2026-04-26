param(
    [string]$InputFile = ".\inputs\youtube_video_urls.txt",
    [string]$OutputRoot = ".\transcripts\raw"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path ".\yt-dlp.exe")) {
    throw "yt-dlp.exe not found in repo root. Place yt-dlp.exe in the repo root."
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
        --write-sub `
        --sub-langs "en" `
        --write-info-json `
        --write-thumbnail `
        --ignore-errors `
        --no-overwrites `
        --output "$OutputRoot\%(uploader)s__%(id)s__%(title).80s.%(ext)s" `
        $url
}

Write-Host "Download complete. Converting subtitle transcripts to MD..."

$subtitleFiles = Get-ChildItem $OutputRoot -File | Where-Object {
    $_.Extension -in ".vtt", ".srt"
}

if ($subtitleFiles.Count -eq 0) {
    throw "No .vtt or .srt transcript files found in $OutputRoot. Run: .\yt-dlp.exe --list-subs <URL> and confirm English captions exist."
}

foreach ($file in $subtitleFiles) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $outputPath = Join-Path $OutputRoot "$baseName.md"

    Write-Host "Cleaning: $($file.Name)"

    $cleanLines = Get-Content $file.FullName |
        Where-Object {
            $_ -notmatch '^\d+$' -and
            $_ -notmatch '-->' -and
            $_ -notmatch '^WEBVTT' -and
            $_ -notmatch '^Kind:' -and
            $_ -notmatch '^Language:' -and
            $_.Trim() -ne ''
        } |
        ForEach-Object {
            $_ -replace '<[^>]+>', '' `
               -replace '&amp;', '&' `
               -replace '&quot;', '"' `
               -replace '&#39;', "'" `
               -replace '&lt;', '<' `
               -replace '&gt;', '>'
        } |
        ForEach-Object {
            $_.Trim()
        }

    [System.IO.File]::WriteAllLines($outputPath, $cleanLines, [System.Text.UTF8Encoding]::new($false))

    Write-Host "Created: $outputPath"
}

Write-Host "Transcript intake complete."
Write-Host "Ready for Claude upload/testing: $OutputRoot\*.md"
