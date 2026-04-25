# transcript_pipeline.md

## Purpose

Define the required flow for moving horror narration transcripts through the repository so they become reusable storytelling intelligence without copying or imitating source material.

---

## Core Rule

Raw transcripts are reference material only.

Claude must never generate new stories by copying, rewriting, or directly imitating transcript content.

All transcript processing must follow:

`raw → cleaned → structured → distilled → indexed`

---

## Current Status

This pipeline is semi-manual.

Claude may run the full pipeline when explicitly instructed, but must:

- follow every stage
- use the required templates
- check for duplicates before processing
- avoid automatic framework promotion
- update logs after processing

---

## Required Duplicate Guard

Before processing any raw transcript, Claude must check:

- `/transcripts/cleaned/{source_name}.md`
- `/transcripts/structured/{source_name}.md`
- `/transcripts/distilled/{source_name}.md`
- `/memory/transcript_processing_log.md`

If prior processing exists, Claude must skip the transcript unless the user explicitly requests reprocessing.

Skipped transcripts must be logged.

---

## File Format Rule

All transcript pipeline outputs must use `.md`.

No `.txt` files should be used for transcript stages.

---

## Naming Rule

Use lowercase, underscore-separated names.

Transcript-based stages:

- `/transcripts/raw/{source_name}.md`
- `/transcripts/cleaned/{source_name}.md`
- `/transcripts/structured/{source_name}.md`
- `/transcripts/distilled/{source_name}.md`

Pattern-based index stage:

- `/transcripts/indexed/{pattern_name}.md`

---

## Stage 1 — Raw

### Path

`/transcripts/raw/`

### Template

`/templates/raw_transcript_template.md`

### Purpose

Store untouched source transcripts exactly as collected.

### Rules

- preserve original text
- do not clean
- do not summarize
- do not analyze
- keep each transcript in its own file

---

## Stage 2 — Cleaned

### Path

`/transcripts/cleaned/`

### Template

`/templates/cleaned_transcript_template.md`

### Purpose

Convert raw transcript text into readable Markdown while preserving original meaning and sequence.

### Allowed Changes

- remove timestamps
- remove caption artifacts
- fix spacing
- fix obvious punctuation
- remove filler only when meaning is unaffected

### Not Allowed

- adding new meaning
- changing events
- rewriting style creatively
- summarizing aggressively
- extracting patterns

---

## Stage 3 — Structured

### Path

`/transcripts/structured/`

### Template

`/templates/structured_transcript_template.md`

### Purpose

Break the cleaned transcript into identifiable storytelling components.

### Extract

- hook
- setup
- escalation beats
- reveals
- reversals
- tension peaks
- scene transitions
- ending type
- pacing shifts
- narrator behavior
- audience retention moments

### Rule

Structured outputs must describe function, not preserve source phrasing.

---

## Stage 4 — Distilled

### Path

`/transcripts/distilled/`

### Template

`/templates/distilled_transcript_template.md`

### Purpose

Convert structured analysis into generalized principles and techniques.

### Extract

- repeatable storytelling patterns
- pacing tactics
- suspense-building methods
- framing devices
- escalation structures
- narration techniques
- visual or sensory motifs
- engagement strategies

### Not Allowed

- copying phrases
- copying scenes
- copying characters
- copying plot events
- preserving source-specific identity

---

## Stage 5 — Indexed

### Path

`/transcripts/indexed/`

### Template

`/templates/indexed_transcript_template.md`

### Purpose

Create searchable references that help Claude retrieve safe, abstract insights without relying on raw transcript text.

### Include

- pattern name
- technique tags
- tension tags
- structure type
- related distilled file
- promotion status

### Rule

Indexed entries must be short and retrieval-focused.

---

## Manual Processing Workflow

1. Save original transcript in `/transcripts/raw/`
2. Run duplicate guard
3. Create cleaned version in `/transcripts/cleaned/`
4. Analyze cleaned version into `/transcripts/structured/`
5. Convert analysis into reusable insights in `/transcripts/distilled/`
6. Create searchable index entry in `/transcripts/indexed/`
7. Update `/memory/transcript_processing_log.md`
8. Update `/logs/execution_log.md`

Do not skip stages.

---

## Promotion Rule

Transcript-derived insights must not be promoted into frameworks or generation-facing rules unless:

- the user explicitly approves promotion, or
- the pattern repeats across multiple transcripts and passes `/systems/pattern_promotion_system.md`

---

## Relationship to Other Files

Connects to:

- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_stage_executor.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_analysis_rules.md`
- `/systems/pattern_promotion_system.md`
- `/logs/execution_log.md`
- `/memory/transcript_processing_log.md`

---

## Summary Rule

Do not copy transcripts.

Study them, clean them, structure them, distill them, index them, and convert only validated abstractions into reusable production logic.
