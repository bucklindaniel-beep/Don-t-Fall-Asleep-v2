# write_indexed.ps1
# Purpose: Deterministically write INDEXED markdown files to transcripts/indexed/.
# Usage:
# powershell -ExecutionPolicy Bypass -NoProfile -File .\scripts\write_indexed.ps1 -SourceFilename "example.raw.md" -IndexedContentPath ".\temp\indexed.md"

param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2",
    [Parameter(Mandatory=$true)][string]$SourceFilename,
    [Parameter(Mandatory=$true)][string]$IndexedContentPath
)

$ErrorActionPreference = "Stop"

function Get-NextFileId {
    param([string]$IndexedDir)
    $max = 0
    Get-ChildItem -Path $IndexedDir -Filter "*_indexed.md" -File -ErrorAction SilentlyContinue | ForEach-Object {
        if ($_.BaseName -match '^(\d{3})_indexed$') {
            $n = [int]$Matches[1]
            if ($n -gt $max) { $max = $n }
        }
    }
    return ('{0:D3}' -f ($max + 1))
}

$IndexedDir = Join-Path $RepoRoot "transcripts\indexed"
$BackupDir = Join-Path $IndexedDir "_backups"
$ManifestPath = Join-Path $IndexedDir "manifest.md"

if (!(Test-Path $IndexedDir)) { throw "Missing indexed directory: $IndexedDir" }
if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }
if (!(Test-Path $IndexedContentPath)) { throw "Indexed content file not found: $IndexedContentPath" }

if (Test-Path $ManifestPath) {
    $manifest = Get-Content -Path $ManifestPath -Raw
    if ($manifest -like "*$SourceFilename*") {
        Write-Host "SKIP_ALREADY_PROCESSED: $SourceFilename"
        exit 0
    }
}

$fileId = Get-NextFileId -IndexedDir $IndexedDir
$outName = "$($fileId)_indexed.md"
$outPath = Join-Path $IndexedDir $outName

if (Test-Path $outPath) { throw "Output already exists: $outPath" }

Copy-Item -Path $IndexedContentPath -Destination $outPath -Force:$false

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if (!(Test-Path $ManifestPath)) {
    @("# Indexed Manifest", "", "| file_id | source_filename | indexed_filename | status | timestamp |", "|---|---|---|---|---|") | Set-Content -Path $ManifestPath -Encoding UTF8
}
Add-Content -Path $ManifestPath -Value "| $fileId | $SourceFilename | $outName | PROCESSED | $timestamp |"

Write-Host "WRITE_SUCCESS: $outPath"
