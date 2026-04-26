# Transcript Duplicate Detection

## Metadata

**File Name:** transcript_duplicate_detection.md  
**Location:** /systems/transcript_duplicate_detection.md  
**System Area:** Transcript Processing Pipeline  
**Primary Role:** Prevent duplicate transcript intake, duplicate analysis, and repeated pattern indexing.

---

## Purpose

This system defines how Claude checks for duplicate transcript sources and duplicate script analysis before processing or writing files.

It protects the repository from redundant analysis, memory bloat, and repeated pattern promotion.

---

## Duplicate Check Order

Before processing any transcript, Claude must check in this order:

1. `/memory/transcript_processing_log.md`
2. `/transcripts/raw/`
3. `/transcripts/cleaned/`
4. `/transcripts/structured/`
5. `/transcripts/distilled/`
6. `/transcripts/indexed/`
7. `/logs/execution_log.md` when resolving unclear conflicts

---

## Strong Duplicate Identifiers

Use these identifiers in priority order:

1. YouTube video ID
2. Canonical URL
3. Source platform ID
4. Exact title + creator/channel
5. Normalized source name / slug
6. Matching metadata file name

Title alone is not enough unless no stronger identifier exists.

---

## Duplicate Outcomes

### Exact Duplicate

If the same source ID or URL already exists:

- do not reprocess
- mark as skipped
- log the skip in `/memory/transcript_processing_log.md`
- log the decision in `/logs/execution_log.md`

### Partial Duplicate

If the same source appears in some stages but not others:

- do not create a second source set
- continue only from the missing stage if safe
- record the inconsistency
- preserve existing files

### Intentional Reprocess

Only reprocess when the user explicitly asks.

When reprocessing:

- do not overwrite prior files unless explicitly instructed
- create a versioned output if needed
- record the reprocessing reason

---

## Duplicate Analysis Guard

Claude must also prevent duplicate analysis, not only duplicate files.

Before creating distilled or indexed outputs, check whether the same source has already produced:

- the same narrative mechanic
- the same title/thumbnail mechanic
- the same pacing observation
- the same narration delivery observation
- the same pattern candidate

If the observation already exists, Claude should:

- strengthen the existing pattern with evidence if useful
- avoid creating a second near-identical pattern file
- log the relationship as supporting evidence

---

## Similarity Check

When comparing analysis outputs, treat two observations as duplicates if they share:

- same function
- same stage of story or packaging
- same audience effect
- same implementation rule

Different wording is not enough to justify a new pattern.

---

## Batch Processing Rule

In batch transcript intake, duplicate detection must run per item.

Claude must not stop the batch because one duplicate is found.

For each duplicate:

- skip that item
- log the skip
- continue to the next item

Only stop the batch for critical system failures.

---

## Required Log Fields

Each duplicate check should record:

- source name
- source ID or URL when available
- duplicate status: new / exact_duplicate / partial_duplicate / reprocess_requested
- matching file or log entry
- action taken
- date checked
