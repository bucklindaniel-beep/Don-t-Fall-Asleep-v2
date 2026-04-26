# Pattern Promotion Bridge

## Metadata
- Type: System Bridge
- Domain: Transcript Intelligence / Pattern Promotion
- Status: active
- Authority: reference bridge only
- Canonical Destination: `/analysis/pattern_library.md`

---

## Purpose

Defines how transcript-derived pattern candidates move into the canonical pattern library.

This file does not create a second pattern system.
It only routes validated mechanics into `/analysis/pattern_library.md`.

---

## Flow

raw → cleaned → structured → distilled → indexed → scored candidate → canonical library review → `/analysis/pattern_library.md`

---

## Promotion Rule

Promote a pattern only when it:

- is a reusable mechanic, not story content
- improves narration quality, pacing, tension, structure, realism, or uniqueness control
- is supported by transcript analysis
- scores high enough under `/frameworks/13_pattern_scoring_framework.md`
- does not duplicate an existing canonical pattern
- can be merged cleanly into an existing canonical when appropriate

---

## Canonical Library Rule

Before creating a new pattern entry:

1. Check `/analysis/pattern_library.md`
2. Compare against existing ACTIVE, CORE, HOLD, and ARCHIVED patterns
3. Merge variants under existing canonicals when possible
4. Create a new pattern only when the mechanic is functionally distinct

---

## Output Destination

Validated patterns must be stored in:

`/analysis/pattern_library.md`

Do not route promoted transcript patterns to `/frameworks/` as standalone files.
Framework files may reference canonical patterns, but they are not the pattern library.

---

## Prohibited

- copying transcript phrasing
- storing story-specific content
- creating duplicate pattern files
- promoting low-confidence observations
- treating prompt output as canonical without library review

---

## Compression Summary

Transcript mechanics are scored, deduplicated, and merged into `/analysis/pattern_library.md` only.
