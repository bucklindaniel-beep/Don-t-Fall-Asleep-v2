param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2"
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PatchRoot = Split-Path -Parent $ScriptDir
$BackupRoot = Join-Path $RepoRoot "patch_backups\instruction_guardrail_patch_v1_$(Get-Date -Format 'yyyyMMdd_HHmmss')"

$Files = @(
    "systems\02_claude_project_instructions.md",
    "systems\claude_desktop_project_instructions_update.md"
)

$Updated = 0
$Added = 0
$Skipped = 0

foreach ($RelativePath in $Files) {
    $Source = Join-Path $PatchRoot $RelativePath
    $Target = Join-Path $RepoRoot $RelativePath

    if (!(Test-Path $Source)) {
        Write-Host "SKIP missing patch source: $RelativePath"
        $Skipped++
        continue
    }

    $TargetDir = Split-Path -Parent $Target
    if (!(Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    if (Test-Path $Target) {
        $BackupPath = Join-Path $BackupRoot $RelativePath
        $BackupDir = Split-Path -Parent $BackupPath
        if (!(Test-Path $BackupDir)) {
            New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
        }
        Copy-Item $Target $BackupPath -Force
        Copy-Item $Source $Target -Force
        Write-Host "UPDATED: $RelativePath"
        $Updated++
    } else {
        Copy-Item $Source $Target -Force
        Write-Host "ADDED: $RelativePath"
        $Added++
    }
}

Write-Host ""
Write-Host "Patch complete."
Write-Host "Updated: $Updated"
Write-Host "Added: $Added"
Write-Host "Skipped: $Skipped"
Write-Host "Backups: $BackupRoot"
