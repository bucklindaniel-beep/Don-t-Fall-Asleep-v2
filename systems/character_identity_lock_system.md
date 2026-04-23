# System — Character Identity Lock

## Purpose

Defines and enforces consistent character identity across all shots.

Prevents:

- facial drift
- body type inconsistency
- clothing changes
- loss of character continuity across prompts

---

## Core Principle

A character MUST be treated as a fixed visual entity.

Identity is NOT reinterpreted per shot.

It is:

- defined once
- reused exactly
- only modified if explicitly required by the story

---

## Identity Definition

Each character MUST be defined using a baseline identity block.

Example:

Male, mid-20s, lean build, pale skin, short messy dark brown hair, faint stubble, wearing a loose gray t-shirt and dark sweatpants

This definition MUST include:

- age range
- body type
- skin tone
- hair (color + style)
- distinguishing features (if any)
- clothing baseline

---

## Identity Persistence

Once defined:

- the identity MUST be reused exactly across all prompts
- wording SHOULD remain consistent
- no new traits may be introduced

---

## Allowed Changes

Characters may change ONLY in:

- posture
- position
- facial expression
- minor clothing state (e.g., slightly wrinkled, damp, dirt)

These changes MUST:

- be explicitly described
- not alter the core identity

---

## Disallowed Changes

The following MUST NOT change:

- age
- build
- facial structure
- hair color or style
- core clothing identity

---

## Prompt Integration

Each prompt MUST:

- explicitly reference the same character identity
- reuse the baseline identity description
- include any minor changes separately

Example:

same male, mid-20s, lean build, pale skin, short messy dark brown hair, faint stubble, wearing a loose gray t-shirt and dark sweatpants

---

## Continuity Rule

Character identity MUST be treated as:

IMMUTABLE BASELINE + MINOR STATE CHANGES

---

## Failure Conditions

Continuity FAILS if:

- character appearance changes between shots
- clothing changes unexpectedly
- new traits appear
- identity description drifts or varies

---

## Compression Summary

Define Once → Reuse Exactly → Modify Minimally
