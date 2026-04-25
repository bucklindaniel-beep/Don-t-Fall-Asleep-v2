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

1. A stage output.
2. A storage recommendation.
3. A routing reason.
4. A safety check.
5. An execution log entry.

---

## Required System References

Before processing transcripts, Claude must reference:

- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_analysis_rules.md`
- `/systems/transcript_source_metadata_rules.md`
- `/systems/pattern_promotion_system.md`
- `/systems/system_improvement_router.md`
- `/logs/execution_log.md`
- `/memory/transcript_processing_log.md`

If a referenced file is unavailable, Claude must continue with best effort and log the missing reference.

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
5. Only reprocess if the user explicitly requests reprocessing.

Skipped transcripts must be logged in:

- `/memory/transcript_processing_log.md`
- `/logs/execution_log.md`

---

## File Format Rule

Raw ingestion may contain source-acquisition formats:

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`

Cleaned, structured, distilled, and indexed stage outputs must be Markdown files using `.md`.

No later transcript pipeline stage should output `.txt`.

---

## Stage 1 — Raw Intake

### Input

- pasted transcript
- YouTube subtitle export
- book/script excerpt
- rough source notes
- other long-form source text
- raw artifacts produced by yt-dlp

### Template

Manual Markdown raw intake uses:

```text
/templates/raw_transcript_template.md
```

yt-dlp raw artifacts do not need to be converted to Markdown at raw stage.

### Task

Preserve the input as source-only material.

### Output

Raw may include:

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`
- manual raw `.md`

### Storage Target

```text
/transcripts/raw/
```

### Rules

Claude must not:

- analyze patterns yet
- generate story ideas from the raw transcript
- promote any insight
- rewrite the transcript creatively

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

### Output

A cleaned Markdown transcript.

### Storage Target

```text
/transcripts/cleaned/{source_name}.cleaned.md
```

### Rules

Claude must not:

- improve the source creatively
- add new ideas
- change the meaning
- convert the transcript into a story
- extract reusable system rules yet

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

### Output

A structured analysis containing:

- story or segment boundaries
- narrator / POV
- setting
- core situation
- threat type
- tension pattern
- escalation beats
- payoff / ending
- reusable patterns
- notes for distillation

### Storage Target

```text
/transcripts/structured/{source_name}.structured.md
```

### Rules

Claude must:

- determine actual story count and boundaries
- describe what each section does
- avoid copying distinctive wording
- summarize structure instead of preserving exact phrasing

Claude must not:

- treat the source structure as a reusable template
- copy the sequence into generation logic
- promote patterns from one source without review
- rely on PowerShell-generated story counts as authoritative

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

### Output

Distilled insights containing:

- insight name
- generalized description
- use case
- source dependence risk
- promotion candidate status
- safety notes

### Storage Target

```text
/transcripts/distilled/{source_name}.distilled.md
```

### Rules

Claude must:

- remove source-specific plot details from reusable logic
- convert observations into general principles
- flag risks and overfitting concerns
- avoid copying source phrasing

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

### Output

An indexed pattern record containing:

- pattern name
- pattern category
- source type
- reuse guidance
- risk notes
- promotion status

### Storage Target

```text
/transcripts/indexed/{pattern_name}.indexed.md
```

---

## Logging Rule

Claude must log each stage completion to:

```text
/memory/transcript_processing_log.md
/logs/execution_log.md
```

Log only meaningful updates:
- source identity
- stage completed
- duplicate status
- output path
- warnings
- promotion candidates
