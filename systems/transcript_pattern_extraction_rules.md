# Transcript Pattern Extraction Rules

## Metadata

- Type: System
- Domain: Transcript Analysis / Pattern Extraction
- Status: active
- Priority: high

---

## Purpose

Define what mechanics to extract after transcripts reach distilled and indexed analysis.

This file controls extraction criteria only. It does not replace the transcript pipeline or canonical pattern library.

---

## Extract Mechanics, Not Content

Extract:

- opening mechanics
- curiosity loops
- pacing shifts
- escalation functions
- pattern breaks
- setup/payoff mechanics
- ending mechanics
- sentence rhythm tendencies
- emotional beat placement
- packaging-relevant signals when available

Do not copy:

- premises
- phrasing
- scenes
- characters
- unique events
- creator-specific voice

---

## Required Pattern Record

Each extracted pattern must include:

- pattern name
- canonical library match
- mechanic description
- reusable structure
- usage context
- copying risk
- score recommendation
- promotion recommendation

---

## Canonical Check

Before classifying any pattern, compare against:

```text
/analysis/pattern_library.md
```

Use one status:

- MERGE_WITH_EXISTING
- SUBTYPE_OF_EXISTING
- NEW_CANONICAL
- HOLD_FOR_COMPARISON
- REJECT_REDUNDANT

Prefer merge or subtype unless the mechanic is structurally distinct.

---

## Candidate Control

During training batches:

- max 12 total extracted patterns
- target 1-3 NEW_CANONICAL candidates
- reject generic genre observations
- hold narrow or single-instance mechanics
- avoid subtype sprawl

---

## Routing

Transcript mechanics are scored through:

```text
/frameworks/13_pattern_scoring_framework.md
```

Canonical memory is stored only in:

```text
/analysis/pattern_library.md
```

Do not route transcript-derived canonicals into standalone pattern or technique folders.

---

## Summary

Extraction identifies candidate mechanics.
Scoring evaluates usefulness.
Canonical comparison decides merge, subtype, hold, reject, or new candidate.
Pattern library update requires curator approval until write-back mode is active.
