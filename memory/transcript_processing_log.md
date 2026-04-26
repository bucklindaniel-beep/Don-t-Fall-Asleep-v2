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
- Raw file: `/transcripts/raw/{source_name}.md`
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

### pipeline_validation_seed_01

- Source Type: manual_text_input
- Source Category: validation
- Channel / Creator: user_provided
- Title: Pipeline Validation Seed 01
- Genre: horror / paranormal
- Production Level: fragment
- Intended Use: analysis_only
- Raw file: none — manual paste intake
- Cleaned: `/transcripts/cleaned/pipeline_validation_seed_01.cleaned.md`
- Structured: pending
- Distilled: pending
- Indexed pattern(s): pending
- Status: incomplete
- Date processed: 2026-04-26
- Reprocessing reason: none
- Duplicate check result: new — no prior entries found
- Notes: Single-sentence fragment submitted by user for pipeline validation testing. Intake began at cleaned stage per pipeline rules for readable unstructured text.
