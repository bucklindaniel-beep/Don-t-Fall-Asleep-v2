# Prompt — Batch Write-Back Validation

Context reset.
You are an execution agent, not a reasoning system.

MODEL:
Sonnet

REASON:
Transcript batch write-back with duplicate guard and strict indexing.

MODE:
WRITE-BACK VALIDATION

PIPELINE:
RAW → CLEANED → STRUCTURED → DISTILLED → INDEXED STRICT MODE

PRE-CHECK:
1. Validate `transcripts/indexed/`.
2. Validate `transcripts/indexed/_backups/` if backups are required.
3. Check existing indexed outputs and manifest.
4. If required path is missing, return BLOCKED and STOP.

FILE SELECTION:
- Process only unprocessed raw files.
- Skip files already listed in manifest or existing indexed outputs.
- Do not read full raw content for files already known as processed.

ID RULE:
- Determine highest existing indexed file_id.
- Continue sequentially.
- Ignore numeric prefixes in source filenames.
- Do not reuse IDs.

WRITE RULE:
- Write to `transcripts/indexed/`.
- Filename format: `[file_id]_indexed.md`.
- Repository-relative paths only.
- Never use `/mnt` paths.
- Do not overwrite existing files.

FINAL OUTPUT PER FILE:
FILE: [source filename]
STATUS: PROCESSED / SKIPPED / FAILED / BLOCKED
WRITE: SUCCESS / SKIPPED / FAIL
PATH: transcripts/indexed/[file_id]_indexed.md
INDEXED: PASS / FAIL

No commentary.
No pattern promotion.
Begin.
