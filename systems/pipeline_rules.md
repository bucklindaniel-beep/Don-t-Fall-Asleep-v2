# Pipeline Rules — v1 Validated

## Metadata
- File Name: pipeline_rules.md
- Location: v2/systems/pipeline_rules.md
- Last Patched: 2026-04-29 (continuity patch — INDEXED, write-back, manifest update, and memory persistence reclassified to active-with-authorization)

## Validated Stages
- RAW
- CLEANED
- STRUCTURED
- DISTILLED
- INDEXED

## Active With Authorization
The following stages and operations are ACTIVE but require explicit user authorization per run, batch, or session, as specified in their controlling system files:

- Manifest update (write a row to `v2/transcripts/indexed/manifest.md` only after all four stage outputs are verified for that file)
- Write-back of transcript stage outputs to `v2/transcripts/{cleaned,structured,distilled,indexed}/` (per `v2/systems/writeback_protocol.md`)
- Memory persistence — narrative entries to `v2/memory/transcript_processing_log.md` and diagnostic entries to `v2/logs/execution_log.md` (these files are SECONDARY records; the manifest is the primary source of truth)

## Locked / Inactive
The following remain LOCKED and require separate explicit approval before activation:

- Pattern Promotion (no canonical writes to `v2/analysis/pattern_library.md` without `pattern promotion approved`)
- Automation bridges (no API, dashboard, scheduler, or webhook activation)
- Codex implementation logic
- Creative Orchestration
- Pattern Extraction promotion (extraction observations may be drafted as part of distilled/indexed outputs but must not be promoted to canonical pattern files)

## Rules
- Repository files are canonical once patched.
- `v2/transcripts/indexed/manifest.md` is the primary source of truth for processed transcript state.
- Each stage must operate only on the approved input from the previous stage.
- Write-back occurs only after the prior stage's output is verified.
- No cross-story contamination.
- No interpretation before DISTILLED.
- DISTILLED is not pattern promotion.
- INDEXED stores retrieval-ready metadata only; no inferred fields, no tone/style labels.
- Manifest rows are appended only after all four stage outputs (cleaned, structured, distilled, indexed) for that file are verified.
- Prompt changes after lock require version bump and validation.
- Patch only repeated failures unless critical.
