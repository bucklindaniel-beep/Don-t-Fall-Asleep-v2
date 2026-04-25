# System — Transcript Pipeline Guide

## Metadata
- Type: System
- Domain: Transcript Processing / Knowledge Ingestion
- Primary Use Cases:
  - process source transcripts safely
  - convert source material into reusable abstract knowledge
  - prevent duplicate transcript processing
  - prepare validated insights for pattern promotion
- Status: active
- Confidence: high

---

## Core Rule

Transcript processing must follow this exact stage order:

`raw → cleaned → structured → distilled → indexed`

Claude must not skip, merge, rename, or reorder stages unless the user explicitly instructs otherwise.

---

## Purpose

This pipeline converts raw transcripts into structured, reusable production knowledge without copying source material.

Raw and cleaned transcript content must remain source-only material.

Only distilled and indexed abstractions may inform future system logic, and framework promotion requires separate approval or repeated pattern evidence.

---

## Required References

Before running the transcript pipeline, Claude must reference:

- `/systems/transcript_pipeline.md`
- `/systems/transcript_stage_executor.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_analysis_rules.md`
- `/systems/pattern_promotion_system.md`
- `/logs/execution_log.md`
- `/memory/transcript_processing_log.md`

If a file is missing, Claude must continue with best effort and record the missing reference in the execution log.

---

## Duplicate Processing Guard

Before processing any transcript in `/transcripts/raw/`, Claude must check whether the transcript has already been processed.

Claude must compare the raw transcript filename stem against:

- `/transcripts/cleaned/`
- `/transcripts/structured/`
- `/transcripts/distilled/`
- `/transcripts/indexed/`
- `/memory/transcript_processing_log.md`

If matching processed files or a completed log entry already exist, Claude must skip the transcript unless the user explicitly requests reprocessing.

### Required Duplicate Check

For each raw transcript:

1. Extract `source_name` from the raw filename.
2. Check for:
   - `/transcripts/cleaned/{source_name}.md`
   - `/transcripts/structured/{source_name}.md`
   - `/transcripts/distilled/{source_name}.md`
3. Check `/memory/transcript_processing_log.md` for prior processing.
4. If already processed:
   - do not rewrite output files
   - do not create duplicate indexed entries
   - log the transcript as skipped
5. If not processed:
   - continue through the full pipeline.

### Reprocessing Rule

Claude may only reprocess an existing transcript when the user explicitly says:

- reprocess
- rerun
- overwrite
- regenerate
- update this transcript
- process again

When reprocessing, Claude must record the reason in `/memory/transcript_processing_log.md`.

---

## File Format Rule

All transcript pipeline files must use `.md`.

This applies to:

- `/transcripts/raw/`
- `/transcripts/cleaned/`
- `/transcripts/structured/`
- `/transcripts/distilled/`
- `/transcripts/indexed/`

Rationale:

- improves Claude retrieval
- supports metadata
- preserves consistent structure
- supports future automation

---

## Naming Rule

Use lowercase, underscore-separated names.

### Transcript-Based Stages

Use the transcript source name:

- `/transcripts/raw/{source_name}.md`
- `/transcripts/cleaned/{source_name}.md`
- `/transcripts/structured/{source_name}.md`
- `/transcripts/distilled/{source_name}.md`

### Pattern-Based Index Stage

Use the pattern name when the indexed output represents a reusable pattern:

- `/transcripts/indexed/{pattern_name}.md`

Example:

- `/transcripts/cleaned/cabinet_shift.md`
- `/transcripts/structured/cabinet_shift.md`
- `/transcripts/distilled/cabinet_shift.md`
- `/transcripts/indexed/environmental_desynchronization.md`

---

## Stage Overview

### Stage 1 — Raw

Path:

`/transcripts/raw/`

Purpose:

Preserve the original source transcript without edits.

Template:

`/templates/raw_transcript_template.md`

Rules:

- do not clean
- do not summarize
- do not analyze
- do not extract patterns

---

### Stage 2 — Cleaned

Path:

`/transcripts/cleaned/`

Purpose:

Convert raw transcript text into readable Markdown while preserving meaning and sequence.

Template:

`/templates/cleaned_transcript_template.md`

Allowed:

- remove timestamps
- remove transcription noise
- fix spacing
- fix obvious punctuation
- remove filler only when meaning is unaffected

Not allowed:

- changing events
- improving story quality creatively
- adding details
- extracting patterns

---

### Stage 3 — Structured

Path:

`/transcripts/structured/`

Purpose:

Break the cleaned transcript into analytical structure.

Template:

`/templates/structured_transcript_template.md`

Output should identify:

- hook
- setup
- escalation
- peak
- ending
- pacing shifts
- tension mechanics
- narrator behavior
- retention mechanics

---

### Stage 4 — Distilled

Path:

`/transcripts/distilled/`

Purpose:

Convert source-specific analysis into generalized, reusable insights.

Template:

`/templates/distilled_transcript_template.md`

Rules:

- remove source-specific phrasing
- remove source-specific plot identity
- generalize techniques
- mark promotion candidates without promoting them automatically

---

### Stage 5 — Indexed

Path:

`/transcripts/indexed/`

Purpose:

Create a short retrieval record for safe, abstract insights.

Template:

`/templates/indexed_transcript_template.md`

Rules:

- keep entries short
- use tags
- link to distilled file paths
- do not include raw or cleaned transcript text

---

## Promotion Rule

Claude must not promote transcript insights into `/frameworks/`, `/analysis/patterns/`, or generation-facing systems unless:

1. the user explicitly approves promotion, or
2. the same pattern appears across multiple transcripts and passes the pattern promotion system.

Single-transcript findings must remain in:

- `/transcripts/distilled/`
- `/transcripts/indexed/`

---

## Logging Rule

Every transcript run must update:

- `/logs/execution_log.md`
- `/memory/transcript_processing_log.md`

The processing log is the durable duplicate guard.

The execution log is the debugging record.

---

## Completion Checklist

Before finishing a transcript run, Claude must confirm:

- duplicate check completed
- all stage outputs are `.md`
- transcript-based stages use the same `source_name`
- indexed entries are pattern-based when appropriate
- raw and cleaned text were not used as generation material
- distilled insights are abstracted
- promotion candidates were not promoted without approval
- processing log was updated
- execution log was updated

---

## Final Directive

The transcript pipeline is a controlled learning system.

Its purpose is not to copy successful horror content.

Its purpose is to convert source material into safe, abstract, reusable production intelligence.
