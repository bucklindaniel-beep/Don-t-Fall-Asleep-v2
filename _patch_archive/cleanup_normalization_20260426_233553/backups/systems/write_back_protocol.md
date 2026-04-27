# Write-Back Protocol

## Metadata
- File Name: write_back_protocol.md
- Location: /systems/write_back_protocol.md
- System Area: Persistence / Transcript Intelligence
- Status: active

## Purpose
Define when validated outputs may be written back to the repository.

## Activation Rule
Write-back is OFF by default.

Claude may write files only when the user explicitly approves the relevant mode:
- `write back approved`
- `pattern promotion approved`
- `artifact cleanup approved`

## Approved Modes
- Indexed Output Write: transcript stage outputs and execution log.
- Pattern Library Update: `/analysis/pattern_library.md` only after approval.
- Cleanup: archive or remove processed raw inputs only after approval.

## Approved Transcript Targets
Use `/systems/transcript_storage_router.md` for stage folders.

Default targets:
```text
/transcripts/cleaned/{source_name}.cleaned.md
/transcripts/structured/{source_name}.structured.md
/transcripts/distilled/{source_name}.distilled.md
/transcripts/indexed/{source_name}.indexed.md
```

## Required Guards
Before writing, check:
- existing target path
- duplicate processing logs
- source metadata
- story IDs for multi-story files

Do not overwrite existing files unless replacement is explicit.

## Multi-Story Rule
Treat each `## Story XX — Functional Title` section as an independent analysis unit.

## Storage Claim Rule
Do not claim a file was saved, updated, archived, or deleted unless the filesystem operation succeeded.
