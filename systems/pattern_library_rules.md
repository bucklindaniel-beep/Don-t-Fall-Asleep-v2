# Pattern Library Rules

## Purpose

These rules govern how transcript-derived patterns become permanent system memory.

The goal is a compact, high-signal pattern library.

---

## Authority

- Project Instructions control execution behavior.
- This file controls pattern library governance.
- pattern_library.md is the canonical memory store.
- New transcript outputs must be checked against existing canonicals before new patterns are added.

---

## Canonical Naming Rules

Canonical pattern names must be:

- clear
- compact
- reusable
- generation-friendly
- usually 2–5 words

Avoid:

- slashes
- parentheses
- overly academic phrasing
- source-specific language
- clever but unclear labels

Preferred examples:

- Mundane-to-Catastrophic Escalation
- False-Lead Suspect Ladder
- Trusted-Figure Betrayal
- Authentic Artifact Embedding

---

## Promotion Rules

A pattern may become canonical if:

- it scores 10+
- it is content-agnostic
- it is reusable across stories
- it improves downstream generation
- it is distinct from existing canonicals

A pattern should become CORE only if:

- it appears across multiple transcripts
- it drives story structure
- it improves output quality consistently

---

## Merge Rules

Merge when two patterns serve the same function.

Use:

- MERGE_WITH_EXISTING when the candidate duplicates an existing canonical
- SUBTYPE_OF_EXISTING when it is a useful variant
- HOLD_FOR_COMPARISON when more examples are needed
- REJECT_REDUNDANT when it adds no useful distinction

Prefer merge over creation.

---

## Frequency Rules

When a pattern repeats:

- increment frequency
- add a short confirmation note
- do not create a new canonical
- evaluate whether it should move to CORE

Frequency is evidence, not automatic promotion.

---

## Subtype Rules

Subtypes belong under parent patterns unless:

- repeated independently
- functionally distinct
- useful enough to guide generation separately

Do not allow subtype sprawl.

---

## Hold Rules

Use HOLD when:

- pattern is interesting but unconfirmed
- pattern may merge later
- pattern is genre-specific
- pattern is too narrow for permanent memory

Held patterns are not active generation rules.

---

## Archive Rules

Archive when:

- merged into a stronger parent
- proven too generic
- not useful downstream
- outdated by better system logic

Archived patterns should not be used unless explicitly revived.

---

## Anti-Bloat Rules

Do not preserve every good observation.

Before adding a pattern, ask:

- Is this already represented?
- Is it useful downstream?
- Is it distinct enough?
- Will this improve output quality?
- Is it worth long-term memory?

If unclear, HOLD.
