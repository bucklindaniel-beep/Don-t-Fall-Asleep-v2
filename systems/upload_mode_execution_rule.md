# Upload Mode Execution Rule

## Purpose

Claude does not automatically access local repository files or locally generated transcript files during chat execution.

For upload-mode tests, the user must upload transcript files directly into the Claude chat.

## Rule

If a transcript pipeline run is in upload mode:

- Use only files uploaded into the current chat
- Treat uploaded `.md` files as simulated `/transcripts/raw/`
- Do not attempt to access local paths
- Do not attempt to access GitHub paths
- Do not attempt to access `/mnt/`, `/uploads/`, or `/user-data/`

## Hard Block

If no `.md` transcript files are uploaded:

- Stop immediately
- Return: `BLOCKED — No transcript files uploaded`
- Do not proceed to cleaning, structuring, distillation, narration extraction, indexing, or memory updates

## Future Replacement

This rule can be relaxed only after the Local Repository Execution Bridge is implemented and validated.
