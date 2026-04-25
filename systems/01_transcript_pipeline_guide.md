# Transcript Pipeline Guide

## Purpose

This guide defines how transcripts move through the repository from raw source material into reusable system knowledge.

The transcript pipeline helps Claude analyze high-performing horror narration content, extract reusable storytelling mechanics, and improve future outputs without copying source material.

---

## Active Source of Truth

Primary transcript pipeline files:

- `/systems/01_transcript_pipeline_guide.md` = stage overview
- `/systems/transcript_stage_executor.md` = execution rules
- `/systems/transcript_storage_router.md` = file routing
- `/systems/transcript_source_metadata_rules.md` = metadata rules

Legacy transcript files must not be treated as active execution sources unless the user explicitly asks to inspect or migrate them.

Legacy/reference files:

- `/systems/transcript_pipeline.md`
- `/systems/transcript_pipeline_guide.md`
- `/systems/transcript_pipeline_system.md`

---

## Core Flow

```text
raw -> cleaned -> structured -> distilled -> indexed
```

Each stage has a different purpose and must remain separate.

---

## Folder Structure

```text
/transcripts/
  raw/
  cleaned/
  structured/
  distilled/
  indexed/
```

---

## Stage 1: Raw

### Purpose

Store source-acquisition artifacts exactly as collected.

### Allowed Files

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`
- source notes
- metadata exports
- manual `.md` intake files

### Rules

- Do not edit source-acquisition files directly.
- Preserve metadata where available.
- Keep raw transcripts for analysis only.
- Do not use raw transcripts during story generation.

---

## Stage 2: Cleaned

### Purpose

Convert raw transcript material into readable Markdown while preserving metadata.

### Output Format

```text
/transcripts/cleaned/*.cleaned.md
```

### Required Content

- Metadata block
- Source identity fields available from raw/metadata files
- Usage rule
- Cleaned transcript body

### Rules

- Remove timestamps, subtitle numbering, and formatting artifacts.
- Preserve meaning.
- Do not analyze.
- Do not infer story segments.

---

## Stage 3: Structured

### Purpose

Prepare a Claude-readable analytical structure.

### Output Format

```text
/transcripts/structured/*.structured.md
```

### Required Analysis

- segment/story boundaries
- narrator / POV
- setting
- core situation
- threat type
- tension pattern
- escalation beats
- payoff / ending
- reusable observations
- notes for distillation

### Rules

- Preserve metadata from cleaned stage.
- Remove duplicate pipeline-stage metadata.
- Reference the cleaned transcript file.
- Claude, not PowerShell, determines final story count and boundaries.
- Do not copy distinctive source wording.

---

## Stage 4: Distilled

### Purpose

Convert structured analysis into source-safe reusable insights.

### Output Format

```text
/transcripts/distilled/*.distilled.md
```

### Required Analysis

- reusable patterns
- retention lessons
- pacing lessons
- narration / POV lessons
- anti-copying check
- indexing candidates

### Rules

- Do not copy source phrasing.
- Do not preserve plot structure as a reusable template.
- Convert observations into generalizable system logic.
- Avoid overfitting to one source.
- Do not promote patterns yet.

---

## Stage 5: Indexed

### Purpose

Store distilled knowledge in a searchable, reusable format for future review.

### Output Format

```text
/transcripts/indexed/*.indexed.md
```

### Required Analysis

- pattern name
- source type
- reusable summary
- tags
- reuse guidance
- risks
- promotion status

---

## Duplicate Processing Rule

Before processing any transcript, check whether the same source already exists in later stages.

For YouTube sources, use:

1. Video ID
2. URL
3. metadata file name
4. title as fallback only

If a later-stage file already exists for the same source identity, do not duplicate it unless the user explicitly requests reprocessing.

---

## Transcript Usage Rule

Transcripts are for analysis only.

Claude must:
- extract reusable patterns, techniques, and structures
- convert observations into generalized system knowledge
- preserve source metadata for traceability

Claude must not:
- copy source phrases or sentences
- recreate the source story
- treat transcript content as generation material
- use raw or cleaned transcript language directly in story generation

During generation, Claude may only use approved reusable knowledge from:

- `/frameworks/`
- `/analysis/`
- `/wordbanks/`
- `/memory/`

---

## Script Boundary Rule

PowerShell scripts may:
- ingest source files
- convert raw files into cleaned Markdown
- preserve metadata
- scaffold structured files
- move files between folders
- check duplicates

PowerShell scripts must not:
- analyze storytelling patterns
- determine final story boundaries
- distill insights
- promote patterns
- modify system behavior

Claude performs the reasoning layer.

---

## Logging Rule

All transcript processing must be logged concisely in:

```text
/memory/transcript_processing_log.md
```

Log only:
- source identity
- stage completed
- output path
- duplicate status
- warning or promotion candidate, if useful

---

## Promotion Rule

Distilled insights do not automatically become system behavior.

Reusable patterns must pass through:

```text
/systems/pattern_promotion_system.md
/systems/system_improvement_router.md
```

Only promoted patterns may modify or influence production behavior.

---

## Quality Standard

A processed transcript is valid only if:
- source metadata is preserved
- pipeline stage is clear
- transcript usage rule is followed
- no source language is copied into reusable logic
- Claude can trace the source without using it directly in generation

## Legacy File Handling

The following files are deprecated and must not be used for execution:

- `/systems/transcript_pipeline.md`
- `/systems/transcript_pipeline_guide.md`
- `/systems/transcript_pipeline_system.md`

These files exist for reference only and must not be loaded unless explicitly requested by the user.
