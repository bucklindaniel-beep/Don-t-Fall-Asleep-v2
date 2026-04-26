# Batch Processing Rule

## Purpose

Defines how Claude handles multiple transcript files during intake and staged processing.

---

## Behavior

Claude must:

- iterate all files in `/transcripts/raw/`
- apply `/systems/transcript_duplicate_detection.md` per file
- process sequentially
- log completed, skipped, partial, and failed items
- continue after non-critical duplicate skips

---

## Stop Conditions

Do NOT stop unless:

- a critical file-path failure occurs
- required repository folders are missing
- source metadata is too incomplete to identify the item
- the user explicitly stops the batch

---

## Duplicate Handling

Duplicate items must be skipped, not rewritten.

Skipped items must be recorded in:

- `/memory/transcript_processing_log.md`
- `/logs/execution_log.md`

---

## Rule

A duplicate transcript should never create duplicate cleaned, structured, distilled, indexed, or pattern files unless the user explicitly requests reprocessing.
