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

`raw → cleaned → structured → distilled → indexed`

Claude must not skip, merge, or reorder stages unless the user explicitly instructs otherwise.

Each stage must produce:

1. a stage output
2. a storage recommendation
3. a routing reason
4. a safety check
5. an execution log entry

---

## Required System References

Before processing transcripts, Claude must reference:

- `/systems/transcript_pipeline.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_analysis_rules.md`
- `/systems/pattern_promotion_system.md`
- `/systems/system_improvement_router.md`
- `/logs/execution_log.md`
- `/memory/transcript_processing_log.md`

If a referenced file is unavailable, Claude must continue with best effort and log the missing reference.

---

## Preflight Duplicate Check

Before processing any raw transcript, Claude must:

1. determine `source_name`
2. check whether these files already exist:
   - `/transcripts/cleaned/{source_name}.md`
   - `/transcripts/structured/{source_name}.md`
   - `/transcripts/distilled/{source_name}.md`
3. check `/memory/transcript_processing_log.md` for a completed entry matching `source_name`
4. skip the transcript if it was already processed
5. only reprocess if the user explicitly requests reprocessing

Skipped transcripts must be logged in:

- `/memory/transcript_processing_log.md`
- `/logs/execution_log.md`

---

## File Format Rule

All transcript stage outputs must be Markdown files using `.md`.

No transcript pipeline stage should output `.txt`.

---

## Stage 1 — Raw Intake

### Input

- pasted transcript
- YouTube transcript export
- book/script excerpt
- rough source notes
- other long-form source text

### Template

`/templates/raw_transcript_template.md`

### Task

Preserve the input as source-only material.

### Output

A raw transcript file with:

- source label
- source type
- raw content
- intake notes

### Storage Target

`/transcripts/raw/{source_name}.md`

### Rules

Claude must not:

- analyze patterns yet
- generate story ideas from the raw transcript
- promote any insight
- rewrite the transcript creatively

---

## Stage 2 — Cleaning

### Input

Raw transcript text.

### Template

`/templates/cleaned_transcript_template.md`

### Task

Clean the transcript for readability and future analysis.

### Allowed Cleaning

- remove timestamps
- remove filler
- normalize spacing
- fix obvious transcription errors
- normalize speaker labels
- preserve original meaning

### Output

A cleaned transcript.

### Storage Target

`/transcripts/cleaned/{source_name}.md`

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

Cleaned transcript.

### Template

`/templates/structured_transcript_template.md`

### Task

Break the source into analytical structure.

### Output

A structured analysis containing:

- sections or narrative blocks
- hook/setup/escalation/payoff notes
- pacing shifts
- tension changes
- emotional beats
- narrative function labels
- retention mechanics

### Storage Target

`/transcripts/structured/{source_name}.md`

### Rules

Claude must:

- describe what each section does
- avoid copying distinctive wording
- summarize structure instead of preserving exact phrasing

Claude must not:

- treat the source structure as a reusable template
- copy the sequence into generation logic
- promote patterns from one source without review

---

## Stage 4 — Distillation

### Input

Structured transcript analysis.

### Template

`/templates/distilled_transcript_template.md`

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

`/transcripts/distilled/{source_name}.md`

### Rules

Claude must:

- remove source-specific details
- remove unique phrasing
- generalize the function of the technique
- separate weak observations from reusable insights

Claude must not:

- preserve a source's exact story sequence
- promote a pattern simply because it is interesting
- treat a single transcript as proof of a rule

---

## Stage 5 — Indexing

### Input

Distilled transcript insights.

### Template

`/templates/indexed_transcript_template.md`

### Task

Create a short retrieval record that helps Claude find and compare transcript-derived insights later.

### Output

An index entry containing:

- pattern name
- related source
- distilled file path
- primary techniques
- retention patterns
- tension patterns
- promotion status

### Storage Target

`/transcripts/indexed/{pattern_name}.md`

### Rules

Claude must:

- keep index entries short
- use tags where useful
- link to distilled insights
- identify possible promotion targets

Claude must not:

- include source text
- include copied phrasing
- store raw or cleaned transcript material in the index

---

## Final Routing Review

After indexing, Claude must classify outputs into one of the following categories:

### Keep in Transcript Pipeline

Use when the insight is useful but not ready for system-wide reuse.

Storage:

- `/transcripts/distilled/`
- `/transcripts/indexed/`

### Route to Pattern Promotion

Use when the insight appears reusable and may become a production pattern.

Reference:

`/systems/pattern_promotion_system.md`

### Route to Memory

Use when the insight affects long-term operating behavior or user preference.

Reference:

`/memory/`

### Route to System Improvement Router

Use when the transcript reveals a system gap, weak instruction, missing rule, or needed file update.

Reference:

`/systems/system_improvement_router.md`

---

## Required Processing Log Entry

After each completed or skipped transcript, Claude must update:

`/memory/transcript_processing_log.md`

Required fields:

- source name
- raw file path
- output file paths
- indexed pattern files
- status
- date processed
- reprocessing reason, if applicable
- notes

---

## Required Execution Log Entry

At each stage, Claude must log:

```markdown
## Transcript Stage Log

- Stage:
- Input Used:
- Output Created:
- Storage Target:
- Routing Reason:
- Safety Check:
- Issues Detected:
- Next Stage:
```

If no issue is detected, write:

`Issues Detected: None`

---

## Safety Enforcement

Claude must apply `/systems/transcript_analysis_rules.md` before any insight is promoted.

Promotion is blocked if:

- copied wording remains
- source structure is too closely preserved
- the insight depends on one source's unique premise
- the output could encourage imitation instead of generalized learning
- the insight has not been properly distilled

When blocked, Claude must keep the insight in:

`/transcripts/distilled/`

and log the reason.

---

## Autonomy Rules

Claude should not ask unnecessary clarification questions during transcript processing.

Claude should make reasonable assumptions about:

- source label
- file naming
- stage routing
- transcript type
- likely storage path

Claude may ask for clarification only when:

- the user gives multiple conflicting transcript sources
- the source is incomplete and cannot be processed meaningfully
- the user requests promotion but the safety check fails
- repository location is ambiguous

---

## Quality Control Checklist

Before completing transcript processing, Claude must confirm:

- duplicate check completed
- raw content stayed isolated
- cleaned content was not promoted
- structured analysis avoids copied phrasing
- distilled insights are generalized
- indexed output contains retrieval metadata only
- promotion candidates are routed through the correct systems
- processing log captures processed or skipped status
- execution log captures stage decisions

---

## Final Directive

Claude must treat transcript processing as a controlled learning pipeline.

The goal is not to copy successful content.

The goal is to extract generalized production intelligence that improves future outputs while protecting originality, consistency, and system quality.
