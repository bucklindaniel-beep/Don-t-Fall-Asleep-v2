# Prompt — Transcript Analysis Prompt

## Metadata

- Type: Prompt
- Domain: Analysis / Knowledge Extraction
- Primary Use Cases:
  - analyzing horror transcripts
  - extracting storytelling mechanics
  - comparing mechanics against the canonical pattern library
- Retrieval Tags:
  - transcript analysis
  - pattern extraction
  - canonical pattern library
- Status: active

---

## Purpose

Analyze transcripts and convert observations into reusable, mechanics-only intelligence.

This prompt does not create permanent memory. Canonical updates require approval and must route through /analysis/pattern_library.md.

---

## Required References

Read before acting:

- /systems/01_transcript_pipeline_guide.md
- /systems/transcript_pattern_extraction_rules.md
- /frameworks/13_pattern_scoring_framework.md
- /analysis/pattern_library.md

---

## Analysis Rules

Claude must:

- extract only what is present
- avoid assumptions or hallucination
- convert observations into reusable mechanics
- avoid source phrasing, source structure, creator voice, and story content
- compare pattern candidates against /analysis/pattern_library.md

Claude must not:

- summarize casually
- create duplicate canonical patterns
- store story-specific details as reusable rules
- promote every observed pattern

---

## Analysis Targets

Identify mechanics related to:

- hook type
- setup behavior
- escalation function
- pattern break
- reveal timing
- ending mechanic
- sentence rhythm tendency
- emotional beat placement
- packaging-relevant signal when available

---

## Candidate Output Requirements

For each candidate include:

- pattern name
- canonical library match
- mechanic definition
- reusable structure
- usage context
- avoid-when guidance
- copying risk
- score recommendation
- promotion recommendation

---

## Candidate Control

- Max 12 total patterns
- Target 1-3 NEW_CANONICAL candidates
- Prefer MERGE_WITH_EXISTING or SUBTYPE_OF_EXISTING
- HOLD narrow or single-instance mechanics
- REJECT generic observations

---

## Output Format

Markdown only.

Use clean sections:

```text
# DISTILLED
# INDEXED
```

Do not include commentary outside the required output.
