# Pipeline Rules — v1 Validated

## Validated Stages
- RAW
- CLEANED
- STRUCTURED
- DISTILLED

## Locked / Inactive
- INDEXED
- Write-back
- Pattern promotion
- Memory persistence
- Automation bridges

## Rules
- Repository files are canonical once patched.
- Each stage must operate only on the approved input from the previous stage.
- No write-back before validation.
- No cross-story contamination.
- No interpretation before DISTILLED.
- DISTILLED is not pattern promotion.
- Prompt changes after lock require version bump and validation.
- Patch only repeated failures unless critical.
