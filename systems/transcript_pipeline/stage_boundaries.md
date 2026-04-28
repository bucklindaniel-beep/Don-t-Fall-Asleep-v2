# Transcript Pipeline — Stage Boundaries

## RAW → CLEANED
CLEANED may only lightly clean RAW. It must not restructure story boundaries.

## CLEANED → STRUCTURED
STRUCTURED may extract facts. It must not summarize or interpret.

## STRUCTURED → DISTILLED
DISTILLED may abstract patterns only from explicit structured data. It must not introduce framework logic or memory candidates.

## DISTILLED → INDEXED
INDEXED is not active in v1_validated.

## Global Stop Rule
If a stage produces output outside its boundary, stop and patch prompt before scaling.
