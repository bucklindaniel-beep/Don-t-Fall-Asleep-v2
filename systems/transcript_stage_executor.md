# Transcript Stage Executor

## Metadata

**File Name:** transcript_stage_executor.md  
**Location:** /systems/transcript_stage_executor.md  
**System Area:** Transcript Processing Pipeline  
**Primary Role:** Enforce stage-by-stage transcript processing.

---

## Purpose

The Transcript Stage Executor controls how Claude moves a transcript through each pipeline stage.

It prevents Claude from skipping stages, blending stages together, duplicating prior work, or promoting transcript-derived insights before they are safe for reuse.

---

## Core Execution Rule

Claude must process transcripts in this exact order:

```text
raw -> cleaned -> structured -> distilled -> indexed
```

Claude must not skip, merge, or reorder stages unless the user explicitly instructs otherwise.

Each stage must produce:

1. stage output
2. storage recommendation
3. routing reason
4. safety check
5. concise log entry

---

## Required System References

Claude must load only the references required for the current transcript stage.

Always prioritize:

- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_source_metadata_rules.md`
- active stage template from `/templates/`
- `/memory/transcript_processing_log.md`

Load these only when the stage requires them:

- `/systems/transcript_analysis_rules.md` for structured, distilled, or indexed analysis
- `/systems/pattern_promotion_system.md` for promotion review after indexing
- `/systems/system_improvement_router.md` for approved system updates
- `/logs/execution_log.md` for execution logging

If a referenced file is unavailable, Claude must continue with best effort and log the missing reference.

---

## Active Transcript Source of Truth

Use these as active transcript pipeline files:

- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_stage_executor.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_source_metadata_rules.md`

Do not use these legacy/reference files as active execution sources unless the user explicitly asks to inspect them:

- `/systems/transcript_pipeline.md`
- `/systems/transcript_pipeline_guide.md`
- `/systems/transcript_pipeline_system.md`

---

## Preflight Duplicate Check

Before processing any transcript, Claude must:

1. Determine the strongest available source identity:
   - YouTube Video ID
   - URL
   - metadata file name
   - source title as fallback only
2. Check whether later-stage files already exist in:
   - `/transcripts/cleaned/`
   - `/transcripts/structured/`
   - `/transcripts/distilled/`
   - `/transcripts/indexed/`
3. Check `/memory/transcript_processing_log.md` for a completed entry matching the source identity.
4. Skip the transcript if it was already processed.
5. Reprocess only if the user explicitly requests it.

Skipped transcripts must be logged concisely.

---

## File Format Rule

Raw ingestion may contain:

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`
- manual `.md`

Cleaned, structured, distilled, and indexed outputs must be Markdown files using `.md`.

No later transcript pipeline stage should output `.txt`.

---

## Stage 1 — Raw Intake

### Input

- pasted transcript
- YouTube subtitle export
- book/script excerpt
- rough source notes
- raw artifacts produced by yt-dlp

### Template

Manual Markdown raw intake uses:

```text
/templates/raw_transcript_template.md
```

yt-dlp raw artifacts do not need to be converted to Markdown at raw stage.

### Task

Preserve the input as source-only material.

### Storage Target

```text
/transcripts/raw/
```

### Rules

Claude must not analyze patterns, generate story ideas, promote insights, or rewrite the transcript creatively.

---

## Stage 2 — Cleaning

### Input

Raw transcript text or raw subtitle artifacts.

### Template

```text
/templates/cleaned_transcript_template.md
```

### Task

Clean the transcript for readability and future analysis.

### Allowed Cleaning

- remove timestamps
- remove subtitle numbering
- remove obvious transcription artifacts
- normalize spacing
- preserve original meaning
- preserve metadata

### Storage Target

```text
/transcripts/cleaned/{source_name}.cleaned.md
```

### Rules

Claude must not improve the source creatively, add ideas, change meaning, segment stories, or extract reusable rules yet.

---

## Stage 3 — Structuring

### Input

Cleaned transcript or structured scaffold.

### Template

```text
/templates/structured_transcript_template.md
```

### Task

Break the source into analytical structure.

### Required Output

- story or segment boundaries
- narrator / POV
- setting
- core situation
- threat type
- tension pattern
- escalation beats
- payoff / ending
- reusable observations
- notes for distillation

### Storage Target

```text
/transcripts/structured/{source_name}.structured.md
```

### Rules

Claude must determine actual story count and boundaries, summarize structure functionally, and avoid copying distinctive wording.

Claude must not treat the source as a reusable template, copy the sequence into generation logic, promote patterns, or rely on PowerShell-generated story counts as authoritative.

---

## Stage 4 — Distillation

### Input

Structured transcript analysis.

### Template

```text
/templates/distilled_transcript_template.md
```

### Task

Convert source-specific observations into generalized insights.

### Required Output

- reusable patterns
- retention lessons
- pacing lessons
- narration / POV lessons
- anti-copying check
- indexing candidates

### Storage Target

```text
/transcripts/distilled/{source_name}.distilled.md
```

### Rules

Claude must remove source-specific plot details from reusable logic, convert observations into general principles, flag risks, and avoid copying source phrasing.

Claude must not promote patterns yet.

---

## Stage 5 — Indexing

### Input

Distilled transcript insights.

### Template

```text
/templates/indexed_transcript_template.md
```

### Task

Convert distilled insights into searchable repository knowledge.

### Required Output

- pattern name
- source type
- reusable summary
- tags
- reuse guidance
- risk notes
- promotion status

### Storage Target

```text
/transcripts/indexed/{pattern_name}.indexed.md
```

---

## Logging Rule

Claude must log each stage completion concisely to:

```text
/memory/transcript_processing_log.md
/logs/execution_log.md
```

Log only:
- source identity
- stage completed
- duplicate status
- output path
- warnings
- promotion candidates

Do not log full transcript text, full generated output, or repeated system rules.

## Legacy File Handling

The following files are deprecated and must not be used for execution:

- `/systems/transcript_pipeline.md`
- `/systems/transcript_pipeline_guide.md`
- `/systems/transcript_pipeline_system.md`

These files exist for reference only and must not be loaded unless explicitly requested by the user.

## Stage Efficiency Rule

The distilled stage must:

- refine and compress structured insights
- not re-analyze the transcript from scratch

It must operate only on:

- the structured file output

Avoid duplicating extraction work already completed.
