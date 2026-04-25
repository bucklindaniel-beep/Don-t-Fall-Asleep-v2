# Transcript Storage Router

## Metadata

**File Name:** transcript_storage_router.md  
**Location:** /systems/transcript_storage_router.md  
**System Area:** Transcript Processing Pipeline  
**Primary Role:** Route transcript pipeline outputs to correct repository locations.

---

## Purpose

The Transcript Storage Router defines where Claude must place each output created during transcript processing.

It prevents transcript-derived insights from being stored randomly, duplicated across folders, or mixed into generation logic before they have been properly distilled.

---

## Core Rule

Transcript content must move through the pipeline in this order:

`raw → cleaned → structured → distilled → indexed`

Claude must not skip storage stages.

Claude must not store raw transcript wording inside generation-facing files.

Only distilled, generalized, reusable insights may be promoted into system logic.

---

## Classification Storage Rule

Each transcript must include metadata in every stage file.

Required metadata:

- Source Name
- Source Type
- Source Category
- Channel / Creator
- Title
- Genre
- Production Level
- Intended Use

Source Type controls the raw folder.

Channel / Creator must remain metadata unless a future volume threshold justifies channel-level folders.

---

## File Format Rule

All transcript pipeline outputs must use `.md`.

No transcript stage should output `.txt`.

---

## Duplicate Storage Guard

Before writing transcript pipeline outputs, Claude must check:

1. `/memory/transcript_processing_log.md`
2. Existing transcript stage files

The log is the source of truth.

Existing files are the validation layer.

Claude must not overwrite or duplicate files unless the user explicitly requests reprocessing.

Skipped transcripts must be recorded in:

- `/memory/transcript_processing_log.md`
- `/logs/execution_log.md`

---

## Storage Structure

### 1. Raw Transcript Storage

**Folder:**

`/transcripts/raw/{source_type}/`

Examples:

- `/transcripts/raw/youtube_video/`
- `/transcripts/raw/reddit_story/`
- `/transcripts/raw/movie_script/`
- `/transcripts/raw/book_excerpt/`
- `/transcripts/raw/podcast_transcript/`
- `/transcripts/raw/original_test_seed/`
- `/transcripts/raw/other/`

**File name:**

`{source_name}.md`

**Template:**

`/templates/raw_transcript_template.md`

**Stores:**

- original transcript text
- pasted source material
- unedited exports
- rough source notes
- classification metadata

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
- preserved metadata

---

### 3. Structured Transcript Storage

**Folder:**

`/transcripts/structured/`

**File name:**

`{source_name}.md`

**Template:**

`/templates/structured_transcript_template.md`

**Stores:**

- source-type context
- scene/section breakdowns
- pacing blocks
- hook/setup/payoff structure
- escalation sequence
- narrative function labels
- emotional beat mapping

---

### 4. Distilled Insight Storage

**Folder:**

`/transcripts/distilled/`

**File name:**

`{source_name}.md`

**Template:**

`/templates/distilled_transcript_template.md`

**Stores:**

- universal patterns
- source-type-specific patterns
- genre-specific patterns
- production-level observations
- reusable observations
- engagement patterns
- pacing lessons

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
- related source types
- related genres
- technique references
- routing notes for promotion

---

## Promotion Targets

Transcript-derived insights may route to:

- `/analysis/patterns/`
- `/analysis/techniques/`
- `/frameworks/`
- `/memory/patterns_and_improvements.md`

Only after pattern promotion rules are satisfied.
