# Reference — Repository Cleanup Plan

STATUS: FUTURE / INACTIVE

## Purpose
Document cleanup work discovered during validation without activating restructuring during the current phase.

## Known Issues
- `Claude_Repo/` parent folder contains some ingestion scripts and transcript assets.
- `Claude_Repo/v2/` is the active repository target.
- `transcripts/raw/` and `transcripts/raw-2/` have both been used.
- Some PowerShell scripts may reference parent-level paths or legacy transcript folders.

## Future Cleanup Goals
- Choose one canonical active repository root.
- Consolidate transcript folders under active root.
- Standardize active input folder: `transcripts/raw/`.
- Treat `raw-2/` as legacy/staging unless explicitly needed.
- Update PowerShell scripts after validation, not mid-run.
- Preserve compatibility aliases during transition.

## Do Not Do Yet
- Do not delete legacy folders.
- Do not mass rename raw files.
- Do not activate pattern promotion.
- Do not restructure while execution validation is still being reviewed.
