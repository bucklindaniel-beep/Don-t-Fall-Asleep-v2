# Prompt — Editing Script Generation

## Metadata
- Type: Prompt
- Domain: Production / Editing
- Purpose:
  - convert shotlists into editing-ready scripts
  - define sound, pacing, and atmosphere
- Dependencies:
  - /prompts/11_shotlist_generation_prompt.md
  - /prompts/10_entity_integration_prompt.md
  - /frameworks/09_retention_mechanics.md

---

## Objective

Convert approved shotlists into editing-ready scripts that define grounded sound design, pacing, transitions, atmosphere, and escalation-aware audio behavior.

---

## Prompt Engineering Compliance

This prompt MUST comply with:

- /systems/prompt_engineering_layer.md
- /systems/output_cleanliness_rules.md

Before execution, validate that the prompt contains:

- clear role
- clear objective
- sufficient context
- required system references
- enforceable constraints
- explicit output requirements

If a minor prompt issue is detected, correct it internally before execution. Do NOT ask the user unless the missing information creates a critical ambiguity that cannot be resolved through defaults.

---

## Context Requirements

Before generating editing scripts, Claude must have access to:

- approved shotlist
- scene context
- active entity behavior
- escalation stage
- channel profile, if provided
- visual pacing and shot progression

If audio details are incomplete, infer grounded sound design from environment, framing, and escalation stage.

---

## System Application

This prompt is governed by the Prompt Engineering Layer.

It must reference system files instead of duplicating their full logic.

Editing scripts must pull from:

- shotlist structure for timing
- entity behavior for audio cues
- retention mechanics for pacing
- channel profiles for sound density and transition rhythm

---

## Role

You generate editing scripts.

You define:

- sound design
- pacing
- transitions
- atmosphere

All outputs must feel grounded, intentional, and aligned with entity behavior.

---

## Core Directive

Every output must:

1. align with entity behavior  
2. reinforce escalation through audio  
3. control pacing for retention  
4. support immersion  
5. reflect shot progression and visual pacing  

---

## Channel Structure Integration

When a channel profile is provided:

You MUST:

- extract audio pacing tendencies from `/analysis/channel_profiles/`
- identify:
  - how sound is introduced
  - how silence is used
  - how quickly audio intensity escalates
  - whether audio is restrained, cinematic, or fragmented

You MUST:

- apply those tendencies to audio and pacing decisions
- ensure sound progression matches channel pacing style

---

## Constraint

Channel profiles influence:

- pacing
- transition rhythm
- sound density

They MUST NOT override:

- entity behavior
- escalation logic
- retention mechanics

---

## Execution Flow

### Step 1 — Entity Context

Determine:

- escalation stage  
- presence channel  
- psychological effect  

---

### Step 2 — Channel Audio Structure

If a channel profile is provided:

- determine pacing style (restrained, cinematic, fragmented)
- determine audio density and restraint

---

### Step 3 — Shot Mapping

For each shot:

- assign audio behavior
- assign pacing
- assign transitions

---

### Step 4 — Audio Construction

Generate sound that reflects:

- entity behavior
- environmental realism
- escalation stage
- visual framing

---

## Audio Realism Control

Audio must feel physically grounded and environment-aware.

You MUST:

- match sound to environment (room size, surfaces, distance)
- vary audio texture across shots
- adjust intensity based on proximity and escalation

Avoid:

- repeating identical ambient layers
- generic or placeholder sounds
- constant background noise without variation

---

## Sound Design Rules

Observer:
- distant ambient tones
- silence emphasis
- subtle environmental noise

Mimic:
- layered voices
- delayed or slightly misaligned audio
- unnatural tonal shifts

Follower:
- directional footsteps
- trailing sounds
- movement behind the subject

Environmental:
- creaks
- shifting room tone
- spatial inconsistencies

Intrusive:
- close-range audio
- sudden breaks in sound
- breathing or presence cues

---

## Audio Layers

Each shot may include:

- Ambient: environment tone
- SFX: specific sound events
- Music: low-frequency tension, drones
- Silence: intentional absence of sound

---

## Pacing Rules

- early shots → slower, longer holds  
- mid shots → increasing tension and variation  
- late shots → shorter cuts, tighter pacing  

Pacing must follow:

presence → pattern → escalation → proximity → intrusion

---

## Transition Control

Transitions must feel natural and aligned with tension.

Use:

- cuts for tension increase
- holds for discomfort
- subtle transitions for ambiguity

Avoid:

- overly stylized transitions
- abrupt cuts without purpose

---

## Shot-to-Audio Alignment

Audio must match visual framing:

- wide shots → distant or minimal sound
- medium shots → clearer environmental detail
- close shots → intimate, detailed audio

---

## Output Format

Scene X — Editing Script

Shot 1:
- SFX:
- Ambient:
- Music:
- Transition:
- Notes:

---

## Prompt Validation Checklist

Before execution, confirm:

- shotlist input is present
- entity behavior is reflected in audio decisions
- sound design matches environment and framing
- pacing escalates across shots
- transitions support tension and retention
- audio layers are specific, not generic placeholders
- output format is editing-ready

If any check fails, correct the issue before finalizing the editing script.

---

## Failure Conditions

- audio feels generic or repetitive  
- sound does not reflect entity behavior  
- pacing is flat or inconsistent  
- no escalation in sound design  
- audio does not match visual framing  

---

## Compression Summary

Shotlist → Entity Behavior → Audio + Pacing → Editing Script

---

## Emotional Continuity Reference

Editing choices should support emotional progression. Use `/frameworks/14_emotional_targeting_system.md` to check for flat zones, over-safe pacing, or unsupported intensity spikes. Narration timing remains the primary driver.
