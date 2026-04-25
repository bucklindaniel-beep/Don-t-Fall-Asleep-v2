param (
    [string]$InputFolder = "",
    [string]$OutputFolder = "",
    [string]$FileName = "",
    [string]$RepositoryRoot = "C:\AI Production\Don't Fall Asleep\Dont' Fall Asleep Development\Don't Fall Asleep - Claude Repository Copy\Don-t-Fall-Asleep-v2"
)

# ===== PURPOSE =====
# Creates a structured transcript scaffold from cleaned transcript files.
# Does NOT perform analysis or segmentation logic.
# Normalizes metadata to prevent duplicate/conflicting stage fields.
# Uses repo-relative defaults so this script can run from any directory.

if ([string]::IsNullOrWhiteSpace($InputFolder)) {
    $InputFolder = Join-Path $RepositoryRoot "transcripts\cleaned"
}

if ([string]::IsNullOrWhiteSpace($OutputFolder)) {
    $OutputFolder = Join-Path $RepositoryRoot "transcripts\structured"
}

if (!(Test-Path -LiteralPath $RepositoryRoot)) {
    Write-Host "ERROR: Repository root not found: $RepositoryRoot"
    exit 1
}

if (!(Test-Path -LiteralPath $InputFolder)) {
    Write-Host "ERROR: Input folder not found: $InputFolder"
    exit 1
}

New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null

if ([string]::IsNullOrWhiteSpace($FileName)) {
    $files = Get-ChildItem -LiteralPath $InputFolder -File -Filter "*.cleaned.md"
} else {
    $targetPath = Join-Path $InputFolder $FileName
    if (!(Test-Path -LiteralPath $targetPath)) {
        Write-Host "ERROR: File not found: $targetPath"
        exit 1
    }
    $files = @(Get-Item -LiteralPath $targetPath)
}

if ($files.Count -eq 0) {
    Write-Host "No cleaned transcript files found."
    exit 0
}

function Normalize-MetadataForStructuredStage {
    param (
        [string]$MetadataText
    )

    $lines = $MetadataText -split "`r?`n"

    $filtered = $lines | ForEach-Object { $_.Trim() } | Where-Object {
        $_ -ne "" -and
        $_ -notmatch '^- Pipeline Stage:' -and
        $_ -notmatch '^- Previous Stage:' -and
        $_ -notmatch '^- Next Stage:' -and
        $_ -notmatch '^- Structured At:' -and
        $_ -notmatch '^- Usage Rule:'
    }

    return ($filtered -join "`r`n")
}

foreach ($file in $files) {
    Write-Host "Structuring: $($file.Name)"

    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8

    $metadataMatch = [regex]::Match($content, '(?s)## Metadata\s*(.*?)## Cleaned Transcript')
    $metadata = ""
    if ($metadataMatch.Success) {
        $metadata = $metadataMatch.Groups[1].Value.Trim()
    }

    $metadata = Normalize-MetadataForStructuredStage -MetadataText $metadata

    $bodyMatch = [regex]::Match($content, '(?s)## Cleaned Transcript\s*(.*)$')
    $body = ""
    if ($bodyMatch.Success) {
        $body = $bodyMatch.Groups[1].Value.Trim()
    }

    $baseName = $file.BaseName -replace '\.cleaned$', ''
    $outputFile = Join-Path $OutputFolder "$baseName.structured.md"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    $output = @"
# Structured Transcript

## Metadata

$metadata
- Pipeline Stage: structured
- Previous Stage: cleaned
- Next Stage: distilled
- Structured At: $timestamp
- Usage Rule: Analysis only. Do not copy source language directly into generation.

## Structuring Instructions

Claude must:
- determine how many stories exist
- identify boundaries between stories
- segment the transcript accordingly
- populate each section below
- extract reusable storytelling patterns

Claude must NOT:
- copy source text verbatim
- assume story count from scaffold
- generate new fiction

## Full Cleaned Transcript Reference

$body

---

## Story 1

### Raw Segment
TBD

### Premise
TBD

### Narrator / POV
TBD

### Setting
TBD

### Core Situation
TBD

### Threat Type
TBD

### Tension Pattern
TBD

### Escalation Beats
1. TBD
2. TBD
3. TBD

### Payoff / Ending
TBD

### Reusable Patterns
- TBD

---

## Story 2

### Raw Segment
TBD

### Premise
TBD

### Narrator / POV
TBD

### Setting
TBD

### Core Situation
TBD

### Threat Type
TBD

### Tension Pattern
TBD

### Escalation Beats
1. TBD
2. TBD
3. TBD

### Payoff / Ending
TBD

### Reusable Patterns
- TBD

---

## Story 3

### Raw Segment
TBD

### Premise
TBD

### Narrator / POV
TBD

### Setting
TBD

### Core Situation
TBD

### Threat Type
TBD

### Tension Pattern
TBD

### Escalation Beats
1. TBD
2. TBD
3. TBD

### Payoff / Ending
TBD

### Reusable Patterns
- TBD

"@

    Set-Content -LiteralPath $outputFile -Value $output -Encoding UTF8
    Write-Host "Saved: $outputFile"
}

Write-Host "Done."
exit 0
