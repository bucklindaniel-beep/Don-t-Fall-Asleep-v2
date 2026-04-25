# System — Transcript Pipeline Guide

## Metadata
- Type: System
- Domain: Transcript Processing / Knowledge Ingestion
- Primary Use Cases:
  - process source transcripts safely
  - classify transcript source type and production context
  - convert source material into reusable abstract knowledge
  - prevent duplicate transcript processing
  - prepare validated insights for pattern promotion
- Status: active
- Confidence: high

---

## Core Rule

Transcript processing must follow this exact stage order:

`raw → cleaned → structured → distilled → indexed`

Claude must not skip, merge, rename, or reorder stages unless the user explicitly instructs otherwise.

All transcript stages must use the matching template from `/templates/`.

---

## Transcript Classification Rule

Every transcript must include metadata before processing.

Required metadata:

- Source Name
- Source Type
- Source Category
- Channel / Creator
- Title
- Genre
- Production Level
- Intended Use

Claude must use this metadata to compare transcripts correctly.

Claude must not compare YouTube narration, Reddit stories, movie scripts, book excerpts, or other source types as if they use the same structure.

---

## Source Type Values

Use one of:

- `youtube_video`
- `reddit_story`
- `movie_script`
- `book_excerpt`
- `podcast_transcript`
- `original_test_seed`
- `other`

---

## Source Category Values

Use one of:

- `horror_narration`
- `psychological_horror`
- `paranormal_horror`
- `true_story_style`
- `analog_horror`
- `thriller`
- `screenwriting`
- `general_storytelling`
- `other`

---

## Production Level Values

Use one of:

- `amateur`
- `semi_professional`
- `professional`
- `unknown`

---

## Folder Grouping Rule

Primary grouping should be by Source Type, not by channel or creator.

Recommended raw transcript structure:

```text
/transcripts/raw/youtube_video/
/transcripts/raw/reddit_story/
/transcripts/raw/movie_script/
/transcripts/raw/book_excerpt/
/transcripts/raw/podcast_transcript/
/transcripts/raw/original_test_seed/
/transcripts/raw/other/
```

Do not create a folder for every YouTube channel unless the repository later contains enough volume to justify it.

Channel / Creator must be stored in metadata, not used as the primary folder structure.

---

## Duplicate Processing Guard

Before processing any transcript in `/transcripts/raw/`, Claude must check whether the transcript has already been processed.

The processing log is the source of truth.

Existing files are the validation layer.

Claude must check:

1. `/memory/transcript_processing_log.md`
2. Existing files in:
   - `/transcripts/cleaned/`
   - `/transcripts/structured/`
   - `/transcripts/distilled/`
   - `/transcripts/indexed/`

If the log shows `Status: completed`, Claude must skip the transcript unless the user explicitly requests reprocessing.

If files exist but the log is missing, Claude must pause promotion, log the inconsistency, and ask whether to repair the log or reprocess.

If the log exists but expected files are missing, Claude must log the inconsistency and regenerate only the missing stage files when safe.

---

## Reprocessing Rule

Claude may only reprocess an existing transcript when the user explicitly says:

- reprocess
- rerun
- overwrite
- regenerate
- update this transcript
- process again

When reprocessing, Claude must record the reason in `/memory/transcript_processing_log.md`.

---

## File Format Rule

All transcript pipeline files must use `.md`.

This applies to:

- `/transcripts/raw/`
- `/transcripts/cleaned/`
- `/transcripts/structured/`
- `/transcripts/distilled/`
- `/transcripts/indexed/`

---

## Naming Rule

Use lowercase, underscore-separated names.

Transcript-based stages:

- `/transcripts/raw/{source_type}/{source_name}.md`
- `/transcripts/cleaned/{source_name}.md`
- `/transcripts/structured/{source_name}.md`
- `/transcripts/distilled/{source_name}.md`

Pattern-based index stage:

- `/transcripts/indexed/{pattern_name}.md`

---

## Stage Overview

### Stage 1 — Raw

Path:

`/transcripts/raw/{source_type}/`

Template:

`/templates/raw_transcript_template.md`

Purpose:

Preserve the original source transcript without edits.

Rules:

- preserve source material as-is
- include required metadata
- do not clean
- do not summarize
- do not analyze
- do not extract patterns

---

### Stage 2 — Cleaned

Path:

`/transcripts/cleaned/`

Template:

`/templates/cleaned_transcript_template.md`

Purpose:

Convert raw transcript text into readable Markdown while preserving meaning and sequence.

Allowed:

- remove timestamps
- remove caption artifacts
- fix spacing
- fix obvious punctuation
- remove filler only when meaning is unaffected

Not allowed:

- changing events
- improving story quality creatively
- adding details
- extracting patterns

---

### Stage 3 — Structured

Path:

`/transcripts/structured/`

Template:

`/templates/structured_transcript_template.md`

Purpose:

Break the cleaned transcript into analytical structure.

Output should identify:

- hook
- setup
- escalation beats
- reveal timing
- tension peaks
- pacing shifts
- narrator behavior
- retention mechanics
- source-type-specific structure

Rules:

- describe function, not phrasing
- do not quote distinctive source language
- classify patterns in context of source type and production level

---

### Stage 4 — Distilled

Path:

`/transcripts/distilled/`

Template:

`/templates/distilled_transcript_template.md`

Purpose:

Convert structured analysis into generalized principles and techniques.

Output should extract:

- reusable storytelling patterns
- pacing tactics
- suspense-building methods
- escalation structures
- narration techniques
- source-type-specific lessons

Rules:

- remove source-specific details
- do not copy source language
- separate universal patterns from source-type-specific patterns

---

### Stage 5 — Indexed

Path:

`/transcripts/indexed/`

Template:

`/templates/indexed_transcript_template.md`

Purpose:

Create searchable references that help Claude retrieve safe, abstract insights.

Output should include:

- pattern name
- tags
- related source types
- related genres
- related production levels
- related distilled file
- promotion readiness

Rules:

- keep entries short
- index patterns, not transcript content
- do not store source wording

---

## Batch Processing Mode

When multiple transcripts exist in `/transcripts/raw/`, Claude must:

1. Process files sequentially.
2. Apply the duplicate guard per transcript.
3. Preserve source metadata per transcript.
4. Use templates for every stage.
5. Add or update one log entry per transcript.
6. Report skipped transcripts separately from processed transcripts.

---

## Completion Rule

A transcript is fully processed only when:

- cleaned file exists
- structured file exists
- distilled file exists
- at least one indexed entry exists or `No indexable pattern` is recorded
- `/memory/transcript_processing_log.md` contains `Status: completed`

---

## Promotion Rule

Transcript processing does not automatically create or modify framework files.

Pattern promotion must route through:

- `/systems/pattern_promotion_system.md`
- `/systems/system_improvement_router.md`

Patterns should only be promoted when they repeat across sources or are explicitly approved by the user.
