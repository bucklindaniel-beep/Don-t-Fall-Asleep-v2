# Narration Pacing System

## Metadata

**File Name:** 15_narration_pacing_system.md  
**Location:** /frameworks/15_narration_pacing_system.md  
**System Area:** Narration Quality / Voice Delivery  
**Primary Role:** Define reusable pacing mechanics for script narration and ElevenLabs formatting.

---

## Purpose

This framework improves narration quality by controlling sentence rhythm, pause placement, escalation timing, and conversational flow.

It is designed for downstream narration formatting and voice generation.

It does not generate story concepts or copy source narration styles.

---

## Core Principle

Narration should feel intentional, human, and listenable.

The system should vary rhythm naturally while preserving clarity and suspense.

---

## Allowed Inputs

This framework may use:

- approved story output
- narration review notes
- source-safe mechanics from `/analysis/narration_patterns/`
- user feedback on pacing or delivery
- ElevenLabs output review notes

This framework must not use raw transcript phrasing during generation.

---

## Narration Mechanics

### 1. Conversational Grounding

Use natural orientation before escalation.

Good mechanics:

- short context setup
- clear speaker perspective
- grounded cause-and-effect
- plainspoken transitions

Avoid:

- over-explaining
- theatrical exposition
- repeated hedging
- forced catchphrases

---

### 2. Rhythm Variation

Alternate sentence lengths to avoid monotony.

Use:

- short sentences for impact
- medium sentences for clarity
- longer sentences only when building dread or context

Avoid stacking too many sentences with the same structure.

---

### 3. Pause Logic

Pauses should support meaning, not decorate the script.

Use pauses when:

- a realization lands
- the narrator changes certainty level
- a sensory detail reframes the scene
- the next sentence escalates risk

Avoid excessive pause tags that slow momentum.

---

### 4. Escalation Timing

Narration should narrow the listener's attention as tension rises.

Early stage:

- more context
- more uncertainty
- more observational language

Middle stage:

- tighter sentences
- fewer explanations
- sharper sensory focus

Late stage:

- minimal hedging
- direct perception
- compressed timing

---

### 5. Breath Cue Readiness

For ElevenLabs formatting, breath cues should be applied only after story approval.

Breath cues belong in narration formatting, not the story draft.

Use them to guide:

- pacing
- intensity shifts
- quiet emphasis
- momentary hesitation

Do not overload narration with technical marks.

---

## Creator Reference Boundary

High-performing narrators may be studied for mechanics only.

Example use:

- pacing rhythm
- listener orientation
- conversational transitions
- suspense timing

Forbidden use:

- copying phrases
- imitating personal voice
- recreating story structure from one creator
- using source events as story inputs

---

## Output Checks

Before final narration formatting, verify:

- sentence rhythm varies naturally
- pauses support meaning
- escalation tightens over time
- narration is clear when read aloud
- no creator-specific imitation is present
- no source phrasing is reused
