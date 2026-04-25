# Transcript Pipeline Guide

## Purpose

This guide defines how transcripts move through the repository from raw source material into reusable system knowledge.

The transcript pipeline exists to help Claude analyze high-performing horror narration content, extract reusable storytelling mechanics, and improve future outputs without copying source material.

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

Raw may contain:

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`
- source notes
- metadata exports

This stage does not need to be Markdown-only.

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

Cleaned transcript files must include:

- Metadata block.
- Source Type.
- Source File.
- Metadata File when available.
- Title when available.
- Channel or author when available.
- URL when available.
- Video ID when available.
- Pipeline Stage.
- Next Stage.
- Usage Rule.
- Cleaned transcript body.

### Rules

- Remove timestamps, subtitle numbering, and formatting artifacts.
- Preserve the cleaned transcript content for analysis.
- Do not analyze at this stage.
- Do not infer story segments at this stage.

---

## Stage 3: Structured

### Purpose

Prepare a Claude-readable scaffold for analysis.

### Output Format

```text
/transcripts/structured/*.structured.md
```

### Rules

- Preserve metadata from the cleaned stage.
- Remove duplicate pipeline-stage metadata.
- Include the full cleaned transcript reference.
- Provide scaffold sections for Claude analysis.
- Claude, not PowerShell, determines the actual story count and story boundaries.

### Claude Responsibilities

Claude must determine:

- Number of stories or source segments.
- Story boundaries.
- Narrator / POV.
- Setting.
- Core situation.
- Threat type.
- Tension pattern.
- Escalation beats.
- Payoff / ending.
- Reusable patterns.
- Notes for distillation.

---

## Stage 4: Distilled

### Purpose

Convert structured transcript analysis into source-safe reusable insights.

### Output Format

```text
/transcripts/distilled/*.distilled.md
```

### Distilled Outputs Should Include

- Reusable storytelling patterns.
- Tension mechanics.
- Escalation structures.
- Narrator behavior patterns.
- Environment usage patterns.
- Threat or entity behavior patterns.
- Pacing observations.
- Avoidance notes.

### Rules

- Do not copy source phrasing.
- Do not preserve plot structure as a reusable template.
- Convert observations into generalizable system logic.
- Avoid overfitting to one source.

---

## Stage 5: Indexed

### Purpose

Store distilled knowledge in a searchable, reusable format for future system use.

### Output Format

```text
/transcripts/indexed/*.indexed.md
```

### Indexed Outputs Should Include

- Pattern name.
- Pattern category.
- Source type.
- Applicable use cases.
- Reuse guidance.
- Risks or misuse cases.
- Promotion recommendation.

---

## Duplicate Processing Rule

Before processing any transcript, check whether the same source already exists in later stages.

For YouTube sources, use:

- Video ID
- URL
- Metadata File
- Title as fallback only

If a cleaned, structured, distilled, or indexed file already exists for the same Video ID, do not duplicate it unless the user explicitly requests reprocessing.

---

## Transcript Usage Rule

Transcripts are for analysis only.

Claude must:
- Extract reusable patterns, techniques, and structures.
- Convert useful observations into generalized system knowledge.
- Preserve source metadata for traceability.

Claude must not:
- Copy source phrases.
- Copy sentences.
- Recreate the source story.
- Treat transcript content as generation material.
- Use raw or cleaned transcript language directly in story generation.

During generation, Claude may only use approved reusable knowledge from:

- `/frameworks/`
- `/analysis/`
- `/wordbanks/`
- `/memory/`

---

## Script Boundary Rule

PowerShell scripts may:

- Ingest source files.
- Convert raw files into cleaned Markdown.
- Preserve metadata.
- Scaffold structured files.
- Move files between folders.
- Check for duplicates.

PowerShell scripts must not:

- Analyze storytelling patterns.
- Determine final story boundaries.
- Distill insights.
- Promote patterns.
- Modify system behavior.

Claude performs the reasoning layer.

---

## Logging Rule

All transcript processing must be logged in:

```text
/memory/transcript_processing_log.md
```

Log:

- Source title.
- Source type.
- URL or source ID.
- Stage completed.
- Output file path.
- Duplicate checks.
- Notes or warnings.

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

- Source metadata is preserved.
- Pipeline stage is clear.
- Transcript usage rule is followed.
- No source language is copied into reusable logic.
- Claude can trace the source without using it directly in generation.
