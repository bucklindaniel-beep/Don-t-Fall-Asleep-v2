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

---

## Core Rule

Transcript content must move through the pipeline in this order:

`raw → cleaned → structured → distilled → indexed`

Claude must not skip storage stages.

Claude must not store raw transcript wording inside generation-facing files.

Only distilled, generalized, reusable insights may be promoted into system logic.

---

## File Format Rule

All transcript pipeline outputs must use `.md`.

No transcript stage should output `.txt`.

---

## Duplicate Storage Guard

Before writing transcript pipeline outputs, Claude must check whether the same `source_name` already exists in:

- `/transcripts/cleaned/`
- `/transcripts/structured/`
- `/transcripts/distilled/`
- `/memory/transcript_processing_log.md`

If a processed record exists, Claude must not overwrite or duplicate files unless the user explicitly requests reprocessing.

Skipped transcripts must be recorded in:

- `/memory/transcript_processing_log.md`
- `/logs/execution_log.md`

---

## Storage Structure

### 1. Raw Transcript Storage

**Folder:**

`/transcripts/raw/`

**File name:**

`{source_name}.md`

**Template:**

`/templates/raw_transcript_template.md`

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

**File name:**

`{source_name}.md`

**Template:**

`/templates/cleaned_transcript_template.md`

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

**File name:**

`{source_name}.md`

**Template:**

`/templates/structured_transcript_template.md`

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

**File name:**

`{source_name}.md`

**Template:**

`/templates/distilled_transcript_template.md`

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

**File name:**

`{pattern_name}.md`

**Template:**

`/templates/indexed_transcript_template.md`

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
- Identify whether insights should route to transcript-only storage, pattern promotion, memory, or system improvement.

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
- the idea belongs in transcript storage or analysis first

---

### Memory System

**Folder:**

`/memory/`

**Use when:**

- the insight affects long-term system behavior
- Claude should remember a recurring production preference
- the insight changes future execution behavior

---

## Required Log Targets

### Transcript Processing Log

`/memory/transcript_processing_log.md`

Use for:

- processed transcripts
- skipped duplicates
- reprocessed transcripts
- output file paths
- indexed pattern paths

### Execution Log

`/logs/execution_log.md`

Use for:

- stage decisions
- missing references
- skipped files
- exceptions
- promotion blockers

---

## Final Directive

Route transcript outputs conservatively.

Raw and cleaned material stay isolated.

Structured material supports analysis.

Distilled and indexed material support safe retrieval.

Framework promotion requires validation.
