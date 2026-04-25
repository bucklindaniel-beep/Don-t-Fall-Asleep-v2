# Transcript Pipeline System

## Metadata
- Type: System
- Domain: Transcript Processing / Knowledge Ingestion / Pattern Extraction
- Path: `/systems/transcript_pipeline_system.md`
- Status: active
- Priority: high
- Related Files:
  - `/systems/01_transcript_pipeline_guide.md`
  - `/systems/transcript_pipeline.md`
  - `/systems/memory_logging_system.md`
  - `/systems/pattern_promotion_system.md`
  - `/systems/system_improvement_router.md`
  - `/logs/execution_log.md`
  - `/prompts/05_transcript_analysis_prompt.md`
  - `/prompts/07_technique_extraction_prompt.md`
  - `/prompts/08_pattern_extraction_prompt.md`

---

## Purpose

This system defines how Claude processes transcripts into safe, reusable production knowledge.

The pipeline converts raw source material into:

- cleaned transcript files
- structured analysis files
- distilled reusable patterns
- indexed retrieval references
- memory entries
- promotion candidates
- system improvement recommendations

This system does not replace the existing production pipeline. It supports the learning layer that improves future generation quality.

---

## Core Rule

Transcripts are analysis material only.

Claude must never use transcripts to copy, rewrite, imitate, remix, or closely reproduce source content.

Claude may only extract abstract, reusable knowledge such as:

- pacing structures
- escalation patterns
- retention mechanics
- narration techniques
- scene transition methods
- tension-building strategies
- audience engagement patterns
- structural strengths and weaknesses

Claude must not preserve or reuse:

- exact phrases
- sentence structures unique to the source
- characters
- plot events
- scene sequences
- recognizable source identity
- creator-specific wording
- jokes, dialogue, or narration lines

---

## Pipeline Flow

```text
/transcripts/raw/
  ↓
/transcripts/cleaned/
  ↓
/transcripts/structured/
  ↓
/transcripts/distilled/
  ↓
/transcripts/indexed/
```

Claude must process transcripts in order. Do not skip stages.

---

## Storage Structure

```text
/transcripts/
  raw/
  cleaned/
  structured/
  distilled/
  indexed/

/analysis/
  techniques/
  patterns/
  channel_profiles/
  style_profiles/
  entity_inspiration/

/frameworks/
/memory/
/logs/
```

Use transcript folders for transcript-stage outputs.

Use `/analysis/` only when the insight has been abstracted away from the source.

Use `/frameworks/` only when the insight is durable and broadly reusable.

Use `/memory/` for provisional lessons, failures, current state, and improvement candidates.

Use `/logs/execution_log.md` for processing decisions, exceptions, routing decisions, and validation notes.

---

## Naming Convention

Use lowercase, underscore-separated names.

Recommended format:

```text
/source_or_channel/topic_or_batch_stage.md
```

Examples:

```text
/transcripts/raw/mr_nightmare_batch_01.md
/transcripts/cleaned/mr_nightmare_batch_01_cleaned.md
/transcripts/structured/mr_nightmare_batch_01_structured.md
/transcripts/distilled/mr_nightmare_batch_01_distilled.md
/transcripts/indexed/mr_nightmare_batch_01_index.md
```

If the source is copyrighted or sensitive, use an internal ID instead of a public title.

---

## Stage 1 — Raw

### Path

`/transcripts/raw/`

### Input

Unmodified transcript text from a source such as:

- YouTube narration
- book excerpt
- screenplay excerpt
- script
- user-provided story
- audio transcription

### Output

A raw transcript file that preserves the original text as collected.

### Rules

Claude must:

- preserve the source text
- keep original order
- avoid editing content
- avoid summarizing
- avoid analysis in the raw file
- keep source metadata separate from source text

Claude may add a small metadata block above the raw text if needed:

```markdown
## Metadata
- Source Type:
- Internal Source ID:
- Date Added:
- Processing Status: raw
```

### Completion Standard

This stage is complete when the original transcript is saved and ready for cleaning.

---

## Stage 2 — Cleaned

### Path

`/transcripts/cleaned/`

### Input

A raw transcript from `/transcripts/raw/`.

### Output

A readable transcript that preserves meaning but removes obvious transcription noise.

### Allowed Changes

Claude may:

- fix punctuation
- correct spacing
- break text into paragraphs
- remove obvious filler created by transcription
- repair obvious transcription artifacts
- label unclear sections as `[unclear]`

### Not Allowed

Claude must not:

- rewrite the style
- add meaning
- remove important story details
- summarize aggressively
- make the transcript sound like Claude
- improve the original writing creatively

### Completion Standard

This stage is complete when the transcript is readable, meaning-preserving, and ready for structural analysis.

---

## Stage 3 — Structured

### Path

`/transcripts/structured/`

### Input

A cleaned transcript from `/transcripts/cleaned/`.

### Output

A structured analysis file that explains how the transcript works.

### Required Sections

```markdown
# Structured Transcript Analysis

## Metadata
- Source ID:
- Source Type:
- Stage: structured
- Related Cleaned File:

## High-Level Summary

## Structure Breakdown
- Hook:
- Setup:
- Escalation Beats:
- Reversal / Shift:
- Peak Tension:
- Ending Type:

## Pacing Notes

## Retention Mechanics

## Narration Behavior

## Tension Techniques

## Scene / Beat Transitions

## Safe Reusable Observations

## Source-Specific Details To Exclude
```

### Rules

Claude must:

- describe structure, not imitate prose
- identify mechanics, not copy language
- separate reusable observations from source-specific details
- flag anything that must not influence future generation

Claude must not:

- store long excerpts
- copy memorable phrases
- treat one transcript as a universal rule
- use structure analysis as a story template

### Completion Standard

This stage is complete when the transcript has been converted into a source-safe structural analysis.

---

## Stage 4 — Distilled

### Path

`/transcripts/distilled/`

### Input

A structured analysis file from `/transcripts/structured/`.

### Output

A distilled knowledge file containing abstract, reusable patterns.

### Required Sections

```markdown
# Distilled Transcript Learnings

## Metadata
- Source ID:
- Source Type:
- Stage: distilled
- Related Structured File:

## Reusable Patterns

## Reusable Techniques

## Retention Lessons

## Pacing Lessons

## Narration Lessons

## Escalation Lessons

## Anti-Copying Safeguards

## Candidate Repository Updates
```

### Rules

Claude must:

- convert observations into general principles
- remove source-specific names, events, scenes, and phrasing
- write patterns in reusable language
- include when the pattern should and should not be used
- identify whether each lesson is provisional or promotion-ready

Claude must not:

- preserve the source's plot
- imitate the source's sentence rhythm too closely
- turn one transcript into a global rule
- create framework updates without sufficient support

### Completion Standard

This stage is complete when source material has been converted into safe, reusable, abstract knowledge.

---

## Stage 5 — Indexed

### Path

`/transcripts/indexed/`

### Input

A distilled file from `/transcripts/distilled/`.

### Output

A retrieval-safe index record that points Claude to distilled knowledge instead of raw transcript text.

### Required Sections

```markdown
# Transcript Insight Index

## Metadata
- Source ID:
- Source Type:
- Stage: indexed
- Related Distilled File:

## Tags
- Genre:
- Structure Type:
- Pacing Type:
- Tension Type:
- Ending Type:
- Technique Tags:

## Safe Retrieval Summary

## Reusable Pattern References

## Related Analysis Files

## Do Not Retrieve For
```

### Rules

Claude must:

- index distilled insights only
- point to safe files, not raw transcripts
- use tags that support retrieval
- include exclusion guidance

Claude must not:

- index raw phrases
- use source text as examples
- create searchable access to copied content
- route future generation directly to raw transcripts

### Completion Standard

This stage is complete when Claude can retrieve the insight without relying on the source transcript.

---

## Integration Points

### Memory System

Use `/systems/memory_logging_system.md` after each meaningful transcript processing task.

Route findings as follows:

- `/memory/current_state.md` for active transcript stage and next action
- `/memory/failure_log.md` for processing errors or unsafe source-use risks
- `/memory/patterns_and_improvements.md` for useful provisional patterns
- `/memory/project_learnings.md` for durable transcript-processing lessons
- `/memory/style_calibration.md` only when repeated style preferences are confirmed

Do not save raw transcript content in memory.

---

### Pattern Promotion System

Use `/systems/pattern_promotion_system.md` when a distilled insight appears across multiple transcripts, runs, or user-approved outputs.

Promotion candidates may move to:

- `/analysis/patterns/`
- `/analysis/techniques/`
- `/analysis/channel_profiles/`
- `/analysis/style_profiles/`
- `/analysis/entity_inspiration/`
- `/frameworks/`
- `/prompts/`
- `/systems/`

Promotion requires repeated evidence unless the user explicitly approves a one-off rule.

Do not promote source-specific story details.

---

### System Improvement Router

Use `/systems/system_improvement_router.md` when transcript processing reveals a system gap.

Examples:

- unclear cleaning rules
- weak extraction prompts
- duplicate pattern files
- missing transcript templates
- unsafe raw transcript retrieval risk
- indexing inconsistency
- repeated failure to separate source-specific and reusable content

System improvement recommendations must include:

```markdown
### System Improvement Candidate
- Issue:
- Evidence:
- Recommended destination:
- File to modify or create:
- Why it matters:
- Risk if ignored:
- Priority:
```

---

### Execution Logging

Log transcript processing decisions in `/logs/execution_log.md` when useful.

Log:

- transcript stage completed
- files created or modified
- skipped stages and reason
- uncertainty or source-quality issues
- unsafe-use risks detected
- promotion candidates identified
- system improvement candidates identified

Do not log raw transcript content.

---

## Validation Checklist

Before moving a transcript to the next stage, Claude must confirm:

- the correct source file was used
- the output belongs in the correct folder
- the file name follows repository naming rules
- the stage output does not copy protected wording
- source-specific details are separated from reusable insights
- future generation will retrieve distilled/indexed knowledge, not raw transcripts
- memory/log updates are made only when useful
- promotion candidates are marked as provisional unless supported by repeated evidence

---

## Manual Processing Workflow

Until automation exists, process one transcript or batch at a time.

1. Save source text in `/transcripts/raw/`.
2. Create cleaned file in `/transcripts/cleaned/`.
3. Create structured analysis in `/transcripts/structured/`.
4. Create distilled learnings in `/transcripts/distilled/`.
5. Create retrieval index in `/transcripts/indexed/`.
6. Route reusable insights to memory if useful.
7. Flag promotion candidates only when evidence supports them.
8. Log key processing decisions if they affect future debugging.

---

## Stop Rules

Claude must stop or ask for user approval before:

- rewriting repository frameworks based on a single transcript
- deleting or overwriting existing transcript files
- promoting source-derived insight into global system rules without repeated support
- using raw transcripts as direct generation references
- changing the folder structure
- creating a new abstraction layer beyond this pipeline

---

## Non-Goals

This system does not:

- automate transcript ingestion
- scrape YouTube
- manage copyright permissions
- generate stories directly
- replace the prompt engineering layer
- replace memory routing
- replace pattern promotion
- create a new repository architecture

---

## Core Operating Principle

Raw transcripts are evidence.

Cleaned transcripts are readable evidence.

Structured transcripts are analysis.

Distilled transcripts are reusable knowledge.

Indexed transcripts are safe retrieval points.

Only distilled and indexed knowledge may influence future generation.
