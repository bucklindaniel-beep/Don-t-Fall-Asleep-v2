# System — Batch Processing Rules

STATUS: ACTIVE AFTER PATCH
SCOPE: Transcript batch execution and write-back validation

## Purpose
Prevent duplicate processing, token waste, partial overwrite risk, and inconsistent continuation behavior.

## Required Pre-Checks
Before processing:

1. Validate input directory or attached-file source.
2. Validate output directory: `transcripts/indexed/`.
3. Validate backup directory when write-back is enabled: `transcripts/indexed/_backups/`.
4. Check existing indexed outputs and manifest before reading raw files.

## Processed-File Guard
Before reading a raw file:

- Check `transcripts/indexed/manifest.md` if present.
- Check existing indexed output filenames.
- Check `source_filename` entries in existing indexed files when manifest is unavailable.
- If already processed, skip without reading full content.

## Batch Continuation
- Determine highest existing indexed `file_id`.
- Continue sequentially from the next ID.
- Process only unprocessed raw files.
- Do not reprocess files already written unless explicitly running a reprocessing job.

## Failure Rules
- Per-file failure: mark file FAILED and continue.
- Duplicate/processed file: mark SKIPPED and continue.
- Missing required directory: BLOCKED and STOP.
- Path visibility failure: BLOCKED and STOP.
- Write failure across multiple files: STOP and report.

## Output Status Format
For each file:

```text
FILE: [source filename]
STATUS: PROCESSED / SKIPPED / FAILED / BLOCKED
WRITE: SUCCESS / SKIPPED / FAIL
PATH: transcripts/indexed/[file_id]_indexed.md
INDEXED: PASS / FAIL
```
