param(
    [string]$RepoRoot = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo",
    [switch]$Apply
)

$ErrorActionPreference = "Stop"

function Write-Step {
    param([string]$Status, [string]$Message)
    Write-Host ("[{0}] {1}" -f $Status, $Message)
}

if (!(Test-Path $RepoRoot)) {
    Write-Step "FAIL" ("Repo root not found: {0}" -f $RepoRoot)
    exit 1
}

$TranscriptsRoot = Join-Path $RepoRoot "transcripts"
$ArchiveRoot = Join-Path $TranscriptsRoot "archive"

$dirs = @(
    "raw_legacy",
    "cleaned_legacy",
    "structured_cache",
    "distilled_cache",
    "validation_runs",
    "debug",
    "failed_outputs",
    "pre_patch_snapshots",
    "misc"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path (Join-Path $ArchiveRoot $dir) | Out-Null
}

$rules = @(
    @{
        ActiveDir = "cleaned"
        ArchiveDir = "cleaned_legacy"
        ValidPattern = "*.cleaned.md"
        Reason = "Non-standard cleaned filename or extension"
    },
    @{
        ActiveDir = "structured"
        ArchiveDir = "structured_cache"
        ValidPattern = "*.structured.md"
        Reason = "Non-standard structured filename or extension"
    },
    @{
        ActiveDir = "distilled"
        ArchiveDir = "distilled_cache"
        ValidPattern = "*.distilled.md"
        Reason = "Non-standard distilled filename or extension"
    }
)

foreach ($rule in $rules) {
    $activePath = Join-Path $TranscriptsRoot $rule.ActiveDir
    if (!(Test-Path $activePath)) { continue }

    Get-ChildItem $activePath -File | ForEach-Object {
        $isValid = $_.Name -like $rule.ValidPattern

        if (-not $isValid) {
            $dest = Join-Path (Join-Path $ArchiveRoot $rule.ArchiveDir) $_.Name

            if ($Apply) {
                Move-Item $_.FullName $dest -Force
                Write-Step "PASS" ("Moved: {0} -> {1} ({2})" -f $_.Name, $rule.ArchiveDir, $rule.Reason)
            }
            else {
                Write-Step "INFO" ("Would move: {0} -> {1} ({2})" -f $_.Name, $rule.ArchiveDir, $rule.Reason)
            }
        }
    }
}

# Archive old script artifacts if present.
$artifactDirs = @(
    "raw\_logs",
    "raw\_source_files",
    "cleaned\_logs",
    "cleaned\_source_files"
)

foreach ($rel in $artifactDirs) {
    $path = Join-Path $TranscriptsRoot $rel
    if (Test-Path $path) {
        $dest = Join-Path $ArchiveRoot ("debug\" + ($rel -replace "\\", "_"))
        if ($Apply) {
            Move-Item $path $dest -Force
            Write-Step "PASS" ("Moved artifact dir: {0} -> archive\debug" -f $rel)
        }
        else {
            Write-Step "INFO" ("Would move artifact dir: {0} -> archive\debug" -f $rel)
        }
    }
}

if ($Apply) {
    Write-Step "PASS" "Archive cleanup applied"
}
else {
    Write-Step "INFO" "Dry run complete. Re-run with -Apply to move files."
}
