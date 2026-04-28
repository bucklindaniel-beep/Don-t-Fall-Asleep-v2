# Patch v1 — Transcript Ingestion Validation Lock

## Purpose
Locks the validated RAW → CLEANED → STRUCTURED → DISTILLED transcript ingestion pipeline.

## Includes
- Locked prompts
- Stage definitions
- Stage boundaries
- STRUCTURED schema
- DISTILLED schema
- Pipeline rules
- Validation checklists
- Inactive pattern library scaffold
- PowerShell installer

## Does Not Enable
- Write-back
- Pattern promotion
- Memory persistence
- Automation bridges

## Install Target
Default:
`C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2`

Run from extracted patch folder:
```powershell
powershell -ExecutionPolicy Bypass -NoProfile -File .\Apply-RepoPatch.ps1
```
