# Transcript Processing Log

## Purpose

Tracks which raw transcripts have already been processed so Claude does not duplicate work or overwrite existing pipeline outputs.

This file is the durable duplicate guard for the transcript pipeline.

---

## Source of Truth Rule

This log is the source of truth.

Existing files are the validation layer.

If this log and repository files disagree, Claude must record the inconsistency before continuing.

---

## Rules

- Claude must check this file before processing raw transcripts.
- Claude must add one entry per processed transcript.
- Claude must add one entry per skipped transcript when duplicates are detected.
- Claude must not overwrite previous entries.
- Claude must only reprocess transcripts when explicitly instructed.
- All referenced transcript pipeline files must use `.md`.
- Each completed transcript must include required metadata.

---

## Required Entry Format

```markdown
### {source_name}

- Source Type:
- Source Category:
- Channel / Creator:
- Title:
- Genre:
- Production Level:
- Intended Use: analysis_only
- Raw file: `/transcripts/raw/{source_type}/{source_name}.md`
- Cleaned: `/transcripts/cleaned/{source_name}.md`
- Structured: `/transcripts/structured/{source_name}.md`
- Distilled: `/transcripts/distilled/{source_name}.md`
- Indexed pattern(s):
  - `/transcripts/indexed/{pattern_name}.md`
- Status: pending / completed / skipped / reprocessed / incomplete
- Date processed: YYYY-MM-DD
- Reprocessing reason: none
- Duplicate check result:
- Notes:
```

---

## Log Entries

<!-- Add new transcript processing entries below this line. Do not delete old entries. -->
