# manifest_manager.ps1
# Purpose: Inspect or initialize transcripts/indexed/manifest.md.
# Usage:
# powershell -ExecutionPolicy Bypass -NoProfile -File .\scripts\manifest_manager.ps1 -Action init
# powershell -ExecutionPolicy Bypass -NoProfile -File .\scripts\manifest_manager.ps1 -Action list

param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2",
    [ValidateSet("init","list")][string]$Action = "list"
)

$ErrorActionPreference = "Stop"
$IndexedDir = Join-Path $RepoRoot "transcripts\indexed"
$ManifestPath = Join-Path $IndexedDir "manifest.md"

if (!(Test-Path $IndexedDir)) { throw "Missing indexed directory: $IndexedDir" }

if ($Action -eq "init") {
    if (!(Test-Path $ManifestPath)) {
        @("# Indexed Manifest", "", "| file_id | source_filename | indexed_filename | status | timestamp |", "|---|---|---|---|---|") | Set-Content -Path $ManifestPath -Encoding UTF8
        Write-Host "MANIFEST_CREATED: $ManifestPath"
    } else {
        Write-Host "MANIFEST_EXISTS: $ManifestPath"
    }
}

if ($Action -eq "list") {
    if (Test-Path $ManifestPath) {
        Get-Content -Path $ManifestPath
    } else {
        Write-Host "MANIFEST_NOT_FOUND: $ManifestPath"
    }
}
