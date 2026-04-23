# System — Continuity Review Pass

## Purpose

Performs a final continuity audit across a sequence of shots or image prompts before generation.

Ensures:
- character identity remains stable
- environment baseline remains consistent
- escalation progresses correctly
- camera logic remains coherent
- prompt-to-prompt drift is caught before rendering

---

## Core Principle

Before image generation, the full prompt sequence MUST be reviewed as a connected chain.

No prompt should be evaluated in isolation.

---

## Review Scope

The continuity review pass MUST check:

- character identity continuity
- environment baseline continuity
- object persistence
- lighting continuity
- escalation continuity
- camera progression
- prompt structure consistency

---

## Character Review

Verify:

- same age range
- same build
- same facial features
- same hair color and style
- same clothing baseline

Allowed changes:
- posture
- facial expression
- minor clothing state
- visible wear or damage caused by prior events

Fail if:
- identity wording drifts
- new features appear
- clothing changes without cause
- the subject feels like a different person

---

## Environment Review

Verify:

- same location baseline
- same room layout
- same door/window placement
- same major furniture placement
- same fixed light source positions

Allowed changes:
- object displacement
- clutter increase
- damage progression
- door state changes
- lighting intensity changes
- shadow growth

Fail if:
- room layout changes
- architecture shifts
- furniture teleports
- the setting appears to become a different space

---

## Object Persistence Review

Verify:

- introduced objects remain present unless explicitly removed
- moved objects remain in updated positions
- important props persist across relevant shots

Fail if:
- objects disappear without cause
- object state resets
- the sequence ignores previously introduced visual details

---

## Lighting Review

Verify:

- same light source logic persists
- lighting intensity evolves gradually
- shadow behavior remains plausible
- escalation affects lighting progressively

Fail if:
- light source changes unexpectedly
- brightness resets between shots
- shadows behave inconsistently
- lighting ignores escalation stage

---

## Escalation Review

Verify:

- each shot visibly progresses from the previous one
- escalation aligns with:
/frameworks/01_horror_escalation_model.md

Check for:
- stronger instability
- increased pressure
- more visible disturbance
- greater proximity or obstruction

Fail if:
- escalation is flat
- escalation jumps too abruptly
- prompts repeat the same visual state without progression
- climax-level visuals appear too early

---

## Camera Review

Verify:

- framing evolves logically
- shot scale progression makes sense
- camera instability increases gradually
- perspective changes feel intentional

Fail if:
- camera framing repeats too often
- shots feel visually interchangeable
- perspective shifts randomly
- escalation is not reflected in camera behavior

---

## Prompt Structure Review

Verify every prompt includes:

- visual style anchor
- subject
- environment
- continuity reference
- change from previous shot
- camera framing
- lighting
- realism cues

Fail if:
- required sections are missing
- prompts vary too much in structure
- continuity or change is not explicitly described

---

## Review Output Format

For each sequence, return:

### Continuity Pass Result
- PASS / FAIL

### Issues Found
- [issue list]

### Required Fixes
- [specific corrections]

### Approved Sequence
- yes / no

---

## Review Rule

If any critical continuity issue is found:

- the sequence MUST be corrected before generation

Do NOT approve a sequence that contains unresolved drift.

---

## Compression Summary

Review Sequence → Detect Drift → Fix Issues → Approve Generation
