# Transcript Storage Router

## Metadata

**File Name:** transcript_storage_router.md  
**Location:** /systems/transcript_storage_router.md  
**System Area:** Transcript Processing Pipeline  
**Primary Role:** Route transcript pipeline outputs to the correct repository locations.

---

## Purpose

The Transcript Storage Router defines where Claude must place each output created during transcript processing.

This file prevents transcript-derived insights from being stored randomly, duplicated across folders, or mixed into generation logic before they have been properly distilled.

Claude must use this router after each transcript pipeline stage.

---

## Core Rule

Transcript content must move through the pipeline in this order:

`raw → cleaned → structured → distilled → indexed`

Claude must not skip storage stages.

Claude must not store raw transcript wording inside generation-facing files.

Only distilled, generalized, reusable insights may be promoted into system logic.

---

## Storage Structure

### 1. Raw Transcript Storage

**Folder:**

`/transcripts/raw/`

**Stores:**

- original transcript text
- pasted source material
- unedited exports
- rough source notes

**Rules:**

- Preserve source material as-is.
- Do not rewrite for style.
- Do not extract generation rules here.
- Do not use raw transcript text during story generation.

---

### 2. Cleaned Transcript Storage

**Folder:**

`/transcripts/cleaned/`

**Stores:**

- cleaned grammar
- removed timestamps
- removed repeated filler
- normalized speaker labels
- readable source text

**Rules:**

- Preserve meaning.
- Do not add new ideas.
- Do not improve the source creatively.
- Do not copy cleaned phrasing into future generated content.

---

### 3. Structured Transcript Storage

**Folder:**

`/transcripts/structured/`

**Stores:**

- scene/section breakdowns
- pacing blocks
- hook/setup/payoff structure
- escalation sequence
- narrative function labels
- emotional beat mapping

**Rules:**

- Focus on structure, not wording.
- Summarize sections instead of quoting them.
- Identify what each section does.
- Do not preserve distinctive source phrasing.

---

### 4. Distilled Insight Storage

**Folder:**

`/transcripts/distilled/`

**Stores:**

- reusable observations
- engagement patterns
- pacing lessons
- tension mechanics
- narrative techniques
- structure notes

**Rules:**

- Convert source-specific observations into generalized insights.
- Remove source names unless needed for internal traceability.
- Do not include copied sentences.
- Do not preserve the exact sequence of a single source as a reusable template.

---

### 5. Indexed Transcript Storage

**Folder:**

`/transcripts/indexed/`

**Stores:**

- short metadata records
- searchable summaries
- tags
- technique references
- links to distilled insights
- routing notes for promotion

**Rules:**

- Keep entries short.
- Focus on retrieval.
- Do not store source content.
- Identify whether insights should route to analysis, frameworks, memory, or pattern promotion.

---

## Promotion Targets

### Patterns

**Folder:**

`/analysis/patterns/`

**Use when:**

- a technique appears repeatedly across multiple sources
- a structure improves retention
- a pacing method is reusable
- a suspense pattern can guide future generation

**Do not use when:**

- the insight is from only one source
- the pattern is too source-specific
- the idea risks copying a source structure too closely

---

### Frameworks

**Folder:**

`/frameworks/`

**Use when:**

- the insight becomes reusable execution logic
- Claude needs a repeatable decision model
- the concept affects how stories, scenes, tension, or visuals are generated

**Do not use when:**

- the insight is only an observation
- the rule has not been validated
- the idea belongs in analysis first

---

### Memory System

**Folder:**

`/memory/`

**Use when:**

- the insight affects long-term system behavior
- Claude should remember a recurring production preference
- user feedback changes how future outputs should be handled
- a transcript-derived insight becomes a stable operating rule

**Do not use when:**

- the insight is untested
- the information is source-specific
- the note belongs in transcript analysis only

---

### Pattern Promotion System

**Related File:**

`/systems/pattern_promotion_system.md`

**Use when:**

- a distilled insight may become a reusable pattern
- the same technique appears across multiple transcript analyses
- Claude identifies a repeatable structure that improves output quality

**Required action:**

Claude must route candidate patterns through the Pattern Promotion System before treating them as generation rules.

---

### System Improvement Router

**Related File:**

`/systems/system_improvement_router.md`

**Use when transcript analysis reveals:**

- missing system logic
- weak prompt instructions
- gaps in memory routing
- unclear stage rules
- repeated quality failures
- needed repository improvements

**Required action:**

Claude must log the improvement candidate instead of silently changing unrelated files.

---

## Routing Decision Rules

Claude must classify each transcript output before storage.

### Store in `/transcripts/cleaned/` when:

- the output is a cleaned version of the source
- the source wording is still present
- the file is not safe for generation use

### Store in `/transcripts/structured/` when:

- the output describes source structure
- the content is organized by sections, beats, or pacing
- the file is analytical but not yet generalized

### Store in `/transcripts/distilled/` when:

- source-specific details have been removed
- the output is expressed as reusable insight
- the lesson can inform future production without copying

### Store in `/transcripts/indexed/` when:

- the output is a retrieval summary
- the file points to related analysis or promotion targets
- the entry is short and tag-based

### Store in `/analysis/` when:

- the insight is useful but not yet system logic
- it describes a recurring creative or retention pattern
- it supports future comparison across sources

### Store in `/frameworks/` when:

- the insight becomes a repeatable decision model
- it changes how Claude should construct outputs
- it has been validated or promoted

### Store in `/memory/` when:

- the insight changes persistent operating behavior
- it reflects user feedback or long-term preference
- it must influence future runs

---

## File Naming Rules

Use lowercase, underscore-separated names.

Preferred format:

`source_topic_stage.md`

Examples:

- `apartment_horror_cleaned.md`
- `apartment_horror_structured.md`
- `apartment_horror_distilled.md`
- `apartment_horror_index.md`

Do not use:

- spaces
- vague names
- mixed casing
- source titles that expose copyrighted source branding unnecessarily
- names like `notes.md`, `analysis.md`, or `final.md`

---

## Required Routing Log

Whenever Claude stores or recommends storing a transcript output, it must log:

```markdown
## Transcript Routing Log

- Source/Input:
- Current Stage:
- Output File:
- Storage Location:
- Reason:
- Promotion Candidate: Yes/No
- Routed To Pattern Promotion: Yes/No
- Routed To System Improvement Router: Yes/No
- Safety Check: Confirmed analysis-only; no copied source wording promoted.
```

This log may be placed in the execution log or appended to the relevant transcript processing output.

---

## Safety Rules

Claude must not:

- copy source phrasing into generation-facing files
- treat one transcript as a template
- store raw transcript text in `/frameworks/`, `/analysis/patterns/`, or `/memory/`
- promote source-specific beats as universal rules
- generate stories directly from raw transcript files
- bypass distilled and indexed stages

Claude may:

- extract pacing principles
- summarize structure
- identify retention mechanics
- generalize reusable creative techniques
- recommend system improvements based on recurring transcript findings

---

## Integration Points

### Transcript Pipeline System

Use this router after each stage defined in:

`/systems/transcript_pipeline_system.md`

### Transcript Stage Executor

Use this router when a stage output is complete and needs placement.

`/systems/transcript_stage_executor.md`

### Memory System

Route only stable, reusable, long-term operating insights into memory.

### Pattern Promotion System

Route candidate recurring patterns into promotion review before they become generation rules.

### System Improvement Router

Route system gaps or repository issues into improvement tracking.

### Execution Logging

Log all routing decisions that affect storage, promotion, or system behavior.

---

## Final Directive

Claude must treat transcript storage as part of the production pipeline, not as casual note-taking.

Every transcript-derived output must have:

1. a stage
2. a storage location
3. a routing reason
4. an analysis-only safety check
5. a promotion decision
