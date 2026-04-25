# Transcript Storage Router

## Metadata

**File Name:** transcript_storage_router.md  
**Location:** /systems/transcript_storage_router.md  
**System Area:** Transcript Processing Pipeline  
**Primary Role:** Route transcript pipeline outputs to correct repository locations.

---

## Purpose

The Transcript Storage Router defines where transcript-related files belong inside the repository.

It prevents transcript artifacts, analysis outputs, and reusable insights from being stored in inconsistent or unsafe locations.

---

## Core Routing Rule

Transcript pipeline storage must follow:

```text
/transcripts/raw/
/transcripts/cleaned/
/transcripts/structured/
/transcripts/distilled/
/transcripts/indexed/
```

Do not create source-type subfolders unless the user explicitly instructs a future storage redesign.

---

## File Format Rule

Raw may contain source-acquisition artifacts:

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`
- manual `.md` source notes

Cleaned, structured, distilled, and indexed outputs must use Markdown `.md`.

---

## Duplicate Storage Guard

Before writing transcript pipeline outputs, Claude must check:

1. `/memory/transcript_processing_log.md`
2. Existing transcript stage files
3. Source metadata where available

The strongest duplicate identifiers are:

1. YouTube Video ID
2. URL
3. Metadata file name
4. Source title as fallback only

Claude must not overwrite or duplicate files unless the user explicitly requests reprocessing.

Skipped transcripts must be recorded in:

- `/memory/transcript_processing_log.md`
- `/logs/execution_log.md`

---

## Storage Structure

### 1. Raw Transcript Storage

**Folder:**

```text
/transcripts/raw/
```

**Allowed file types:**

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`
- `.md`

**Template:**

Manual raw Markdown intake may use:

```text
/templates/raw_transcript_template.md
```

**Stores:**

- original transcript text
- unedited source artifacts
- yt-dlp subtitle files
- yt-dlp metadata JSON
- rough source notes
- classification metadata

---

### 2. Cleaned Transcript Storage

**Folder:**

```text
/transcripts/cleaned/
```

**File name:**

```text
{source_name}.cleaned.md
```

**Template:**

```text
/templates/cleaned_transcript_template.md
```

**Stores:**

- cleaned transcript text
- removed timestamps
- removed repeated subtitle artifacts
- normalized readability
- preserved metadata

---

### 3. Structured Transcript Storage

**Folder:**

```text
/transcripts/structured/
```

**File name:**

```text
{source_name}.structured.md
```

**Template:**

```text
/templates/structured_transcript_template.md
```

**Stores:**

- source metadata
- story or segment breakdowns
- narrator / POV analysis
- setting analysis
- tension patterns
- escalation sequence
- payoff analysis
- reusable pattern candidates

---

### 4. Distilled Insight Storage

**Folder:**

```text
/transcripts/distilled/
```

**File name:**

```text
{source_name}.distilled.md
```

**Template:**

```text
/templates/distilled_transcript_template.md
```

**Stores:**

- universal patterns
- source-type-specific patterns
- genre-specific observations
- production-level observations
- reusable insights
- engagement patterns
- pacing lessons
- source-dependence risks

---

### 5. Indexed Transcript Storage

**Folder:**

```text
/transcripts/indexed/
```

**File name:**

```text
{pattern_name}.indexed.md
```

**Template:**

```text
/templates/indexed_transcript_template.md
```

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

Promotion must follow:

```text
/systems/pattern_promotion_system.md
/systems/system_improvement_router.md
```

---

## Script Boundary

PowerShell scripts may write to:

- `/transcripts/raw/`
- `/transcripts/cleaned/`
- `/transcripts/structured/`

Claude handles:

- structured analysis completion
- distillation
- indexing
- pattern promotion decisions
