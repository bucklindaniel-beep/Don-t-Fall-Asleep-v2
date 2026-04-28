---
STATUS: LOCKED
VERSION: v1_validated
MODIFICATION: PROHIBITED WITHOUT VERSION BUMP
STAGE: CLEANED
---

# Prompt — Transcript Ingestion CLEANED

CONTINUE EXECUTION.

Use the RAW output from Stage 1 as the only input.

Do not re-run RAW.
Do not ask for files again.
Do not use outside memory.

STAGE:
Transcript Ingestion — CLEANED

TASK:
Convert the Stage 1 RAW output into CLEANED format.

CLEANED RULES:
- Preserve 100% of wording unless fixing obvious transcription artifacts
- Do not rewrite
- Do not summarize
- Do not polish
- Do not improve style
- Do not change tone
- Do not remove meaningful content

Allowed only:
- spacing fixes
- obvious casing fixes
- obvious transcription artifact removal
- redundant filler removal only when clearly noise

STRUCTURE:
- Change title from: # Transcript — Raw
- To: # Transcript — Cleaned
- Change Pipeline Stage from raw to cleaned
- Keep metadata unchanged
- Keep story segmentation unchanged
- Keep story titles unchanged

OUTPUT:
- Output the full CLEANED transcript
- Do not truncate
- Do not explain
- Stop after CLEANED
