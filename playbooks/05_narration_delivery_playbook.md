# Narration Delivery Playbook

## Metadata

**File Name:** 05_narration_delivery_playbook.md  
**Location:** /playbooks/05_narration_delivery_playbook.md  
**System Area:** Narration Formatting / Audio Preparation  
**Primary Role:** Convert approved scripts into listenable narration-ready output.

---

## Purpose

This playbook guides Claude when preparing narration text for voice generation.

It focuses on delivery mechanics, pacing clarity, and ElevenLabs readiness.

---

## Required Inputs

Before using this playbook, Claude must have:

1. Approved story or narration draft
2. Narrator identity lock
3. Final or near-final scene structure
4. Any user-specific voice direction

Do not use this playbook to rewrite the story from scratch.

---

## Delivery Pass Order

### Pass 1 — Readability

Check that the narration can be read aloud without confusion.

Fix:

- awkward sentence flow
- unclear pronoun references
- overloaded sentences
- repeated sentence openings

---

### Pass 2 — Rhythm

Apply rhythm variation.

Balance:

- short impact lines
- medium explanatory lines
- longer dread-building lines

Avoid repetitive cadence.

---

### Pass 3 — Pause Placement

Add pause guidance only where it improves delivery.

Valid pause moments:

- realization
- interruption
- dread escalation
- narrator uncertainty
- scene transition

Avoid decorative or excessive pauses.

---

### Pass 4 — Emotional Control

Match delivery intensity to escalation stage.

Early:

- restrained
- grounded
- conversational

Middle:

- focused
- uneasy
- compressed

Late:

- direct
- tense
- minimal explanation

---

### Pass 5 — ElevenLabs Readiness

Prepare narration for voice generation.

Rules:

- keep formatting simple
- avoid dense technical notation
- do not add stage directions unless explicitly required
- preserve approved story meaning
- do not introduce new events

---

## Output Requirements

Narration output should include:

- clean narration text
- optional pause markers if requested
- no analysis notes inside narration
- no source attribution or creator references

---

## Safety Boundary

This playbook may use narration mechanics learned from reference material.

It must not copy phrasing, imitate a specific creator, or reproduce source events.
