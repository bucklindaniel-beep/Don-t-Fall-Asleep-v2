param (
    [string]$InputFolder = "",
    [string]$OutputFolder = "",
    [string]$FileName = ""
)

# ===== PURPOSE =====
# Creates a structured transcript scaffold from cleaned transcript files.
# Does NOT perform analysis or segmentation logic.

# ===== DEFAULT PATHS =====
$RepositoryRoot = "C:\AI Production\Don't Fall Asleep\Dont' Fall Asleep Development\Don't Fall Asleep - Claude Repository Copy\Don-t-Fall-Asleep-v2"

if ([string]::IsNullOrWhiteSpace($InputFolder)) {
    $InputFolder = Join-Path $RepositoryRoot "transcripts\cleaned"
}

if ([string]::IsNullOrWhiteSpace($OutputFolder)) {
    $OutputFolder = Join-Path $RepositoryRoot "transcripts\structured"
}

# ===== VALIDATION =====
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

foreach ($file in $files) {
    Write-Host "Structuring: $($file.Name)"

    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8

    # Extract metadata
    $metadataMatch = [regex]::Match($content, '(?s)## Metadata\s*(.*?)## Cleaned Transcript')
    $metadata = ""
    if ($metadataMatch.Success) {
        $metadata = $metadataMatch.Groups[1].Value.Trim()
    }

    # Remove any existing pipeline stage lines to avoid duplication
    $metadata = ($metadata -split "`r?`n") | Where-Object {
        $_ -notmatch "Pipeline Stage"
    } | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" } | Out-String

    # Extract cleaned transcript
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
