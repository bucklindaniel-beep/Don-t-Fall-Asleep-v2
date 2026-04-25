# Transcript Stage Executor

## Metadata

**File Name:** transcript_stage_executor.md  
**Location:** /systems/transcript_stage_executor.md  
**System Area:** Transcript Processing Pipeline  
**Primary Role:** Enforce stage-by-stage transcript processing.

---

## Purpose

The Transcript Stage Executor controls how Claude moves a transcript through each pipeline stage.

It prevents Claude from skipping stages, blending stages together, or promoting transcript-derived insights before they are safe for reuse.

This file does not define the entire transcript system. It executes the stages defined in:

`/systems/transcript_pipeline_system.md`

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

- `/systems/transcript_pipeline_system.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_analysis_rules.md`
- `/systems/execution_log.md`
- `/systems/pattern_promotion_system.md`
- `/systems/system_improvement_router.md`
- `/memory/memory_system.md`

If a referenced file is unavailable, Claude must continue with best effort and log the missing reference.

---

## Stage 1: Raw Intake

### Input

- pasted transcript
- YouTube transcript export
- book/script excerpt
- rough source notes
- other long-form source text

### Task

Claude must identify the input as raw source material and preserve it as source-only material.

### Output

A raw intake summary containing:

- source label
- approximate content type
- estimated length
- obvious formatting issues
- recommended raw storage path

### Rules

Claude must not:

- analyze patterns yet
- generate story ideas from the raw transcript
- promote any insight
- rewrite the transcript creatively

### Storage Target

`/transcripts/raw/`

### Stop Condition

Proceed to cleaning only after raw intake is identified and logged.

---

## Stage 2: Cleaning

### Input

Raw transcript text.

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

A cleaned transcript or cleaned excerpt.

### Rules

Claude must not:

- improve the source creatively
- add new ideas
- change the meaning
- convert the transcript into a story
- extract reusable system rules yet

### Storage Target

`/transcripts/cleaned/`

### Stop Condition

Proceed to structuring only after the cleaned version is safe to analyze.

---

## Stage 3: Structuring

### Input

Cleaned transcript.

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

### Rules

Claude must:

- describe what each section does
- avoid copying distinctive wording
- summarize structure instead of preserving exact phrasing

Claude must not:

- treat the source structure as a reusable template
- copy the sequence into generation logic
- promote patterns from one source without review

### Storage Target

`/transcripts/structured/`

### Stop Condition

Proceed to distillation only after source-specific structure has been converted into analytical notes.

---

## Stage 4: Distillation

### Input

Structured transcript analysis.

### Task

Convert source-specific observations into generalized insights.

### Output

Distilled insights formatted as:

```markdown
## Distilled Insight

- Insight Name:
- Description:
- Use Case:
- Source Dependence Risk:
- Promotion Candidate: Yes/No
```

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

### Storage Target

`/transcripts/distilled/`

### Stop Condition

Proceed to indexing only after insights are generalized and safety-checked.

---

## Stage 5: Indexing

### Input

Distilled transcript insights.

### Task

Create a short retrieval record that helps Claude find and compare transcript-derived insights later.

### Output

An index entry containing:

```markdown
## Transcript Index Entry

- Source Label:
- Content Type:
- Primary Techniques:
- Retention Patterns:
- Tension Patterns:
- Distilled Insight Files:
- Promotion Candidates:
- System Improvement Candidates:
- Safety Status:
```

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

### Storage Target

`/transcripts/indexed/`

### Stop Condition

The transcript processing cycle is complete after indexing and final routing review.

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

`/memory/memory_system.md`

### Route to System Improvement Router

Use when the transcript reveals a system gap, weak instruction, missing rule, or needed file update.

Reference:

`/systems/system_improvement_router.md`

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

## File Naming Rules

Use lowercase, underscore-separated file names.

Recommended format:

`source_topic_stage.md`

Examples:

- `apartment_changes_raw.md`
- `apartment_changes_cleaned.md`
- `apartment_changes_structured.md`
- `apartment_changes_distilled.md`
- `apartment_changes_index.md`

Avoid:

- spaces
- mixed casing
- vague names
- source-branded names when unnecessary
- names like `notes.md`, `final.md`, or `analysis.md`

---

## Quality Control Checklist

Before completing transcript processing, Claude must confirm:

- raw content stayed isolated
- cleaned content was not promoted
- structured analysis avoids copied phrasing
- distilled insights are generalized
- indexed output contains retrieval metadata only
- promotion candidates are routed through the correct systems
- execution log captures stage decisions

---

## Integration Summary

This executor works with:

- transcript pipeline system for stage definitions
- transcript storage router for file placement
- transcript analysis rules for safety
- execution logging for traceability
- memory system for long-term reusable behavior
- pattern promotion system for reusable pattern review
- system improvement router for repository/system gaps

---

## Final Directive

Claude must treat transcript processing as a controlled learning pipeline.

The goal is not to copy successful content.

The goal is to extract generalized production intelligence that improves future outputs while protecting originality, consistency, and system quality.
