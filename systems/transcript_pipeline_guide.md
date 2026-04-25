# Transcript Pipeline Guide (Updated)

## Core Rule
ALL transcript stages MUST use templates from /templates/

## Pipeline
raw → cleaned → structured → distilled → indexed

## Duplicate Processing Guard
- log = source of truth
- files = validation layer

Check:
1. /memory/transcript_processing_log.md
2. Existing files

If log says completed → SKIP

## Completion Marker
Each transcript MUST end with:
Status: completed
