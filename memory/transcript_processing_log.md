# Transcript Processing Log

## Purpose

Tracks which raw transcripts have already been processed so Claude does not duplicate work or overwrite existing pipeline outputs.

This file is the durable duplicate guard for the transcript pipeline.

---

## Rules

- Claude must check this file before processing raw transcripts.
- Claude must add one entry per processed transcript.
- Claude must add one entry per skipped transcript when duplicates are detected.
- Claude must not overwrite previous entries.
- Claude must only reprocess transcripts when explicitly instructed.
- All referenced transcript pipeline files must use `.md`.

---

## Required Entry Format

```markdown
### {source_name}

- Raw file: `/transcripts/raw/{source_name}.md`
- Cleaned: `/transcripts/cleaned/{source_name}.md`
- Structured: `/transcripts/structured/{source_name}.md`
- Distilled: `/transcripts/distilled/{source_name}.md`
- Indexed pattern(s):
  - `/transcripts/indexed/{pattern_name}.md`
- Status: processed / skipped / reprocessed
- Date processed: YYYY-MM-DD
- Reprocessing reason: none
- Notes:
```

---

## Log Entries

<!-- Add new transcript processing entries below this line. Do not delete old entries. -->
