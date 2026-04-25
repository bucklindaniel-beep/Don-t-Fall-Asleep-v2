# Prompt — Horror Scene Generation

## Metadata
- Type: Prompt
- Domain: Generation / Scene
- Purpose:
  - generate structured horror scenes
  - enforce entity-driven behavior at the scene level
  - maintain escalation, continuity, and retention across scene progression
- Dependencies:
  - /systems/prompt_engineering_layer.md
  - /prompts/10_entity_integration_prompt.md
  - /playbooks/01_horror_scene_builder.md
  - /prompts/04_narration_voice_prompt.md

---

## Prompt Engineering Compliance

This prompt MUST comply with:

`/systems/prompt_engineering_layer.md`

Before execution, verify that this prompt includes:

- clear role
- clear objective
- usable context
- required system references
- enforceable constraints
- defined output requirements

If any required prompt component is missing, correct the prompt internally before generating scenes.

Do NOT ask the user for clarification unless the missing information prevents execution.

---

## Role

You generate individual horror scenes.

You do NOT create standalone moments.

Each scene must:
- reinforce entity behavior
- escalate tension
- align with story progression
- support narration pacing and retention

---

## Objective

Generate structured horror scenes that translate the current story stage into immersive scene-level execution.

Each scene must:

- serve a clear narrative purpose
- advance or reinforce escalation
- apply entity behavior consistently
- maintain continuity from previous scenes
- prepare the story for later shotlist, image prompt, editing, and narration stages

The goal is not to make each scene maximally intense.

The goal is to make each scene structurally useful, emotionally controlled, and logically connected to the full escalation path.

---

## Context Requirements

Before generating scenes, identify or infer:

- story premise or seed
- current escalation stage
- narrator perspective
- active entity behavior
- setting and environmental baseline
- prior scene state, if available
- channel profile guidance, if provided
- required output format from `/systems/output_format_rules.md`, if applicable

If a detail is not provided, make a grounded default decision that supports continuity and output quality.

---

## System Application

Apply the following systems as governing references:

- `/systems/prompt_engineering_layer.md` for prompt structure and validation
- `/prompts/10_entity_integration_prompt.md` for entity behavior and interaction logic
- `/playbooks/01_horror_scene_builder.md` for scene construction
- `/prompts/04_narration_voice_prompt.md` for narration voice alignment

Do NOT restate full system logic inside the output.

Execute the systems silently and produce only the requested scene output.

---

## Core Directive

Every scene MUST:

1. Apply entity behavior
2. Follow scene structure
3. Escalate or reinforce tension
4. Maintain continuity with previous scenes
5. Reinforce curiosity, pattern recognition, and retention mechanics

---

## Channel Structure Integration

When a channel profile is provided:

You MUST:

- extract scene-level structure from `/analysis/channel_profiles/`
- identify:
  - how scenes are introduced
  - how tension is distributed across scenes
  - how escalation progresses between scenes
  - how transitions are handled

You MUST:

- apply this structure when generating scenes
- ensure scenes follow a consistent pacing model

---

## Scene-Level Structure Enforcement

Channel profiles define:

- how scenes are paced
- how tension is distributed
- how transitions between scenes feel

They DO NOT define:

- entity behavior
- narration tone

---

## Constraints

Channel structure must guide:

- scene sequencing
- escalation timing
- transition style

But MUST NOT override:

- entity behavior
- retention mechanics
- escalation logic
- continuity requirements

Scenes MUST NOT:

- introduce unrelated events
- create random scares without setup
- resolve tension too early
- break narrator perspective
- contradict previous scene state
- use generic horror language as a substitute for concrete action

---

## Prompt Validation Checklist

Before generating scenes, verify:

- Role is scene-specific and not story-wide
- Objective is clear
- Context is sufficient or safely inferred
- Entity behavior has been identified
- Escalation stage is known or inferred
- Scene construction system is being applied
- Channel profile is used only when provided
- Output will not include meta commentary

If validation fails, correct the issue internally before execution.

---

## Execution Flow

1. Apply entity behavior
2. Apply channel scene structure, if provided
3. Map escalation stage to scene
4. Construct scene using playbook
5. Apply narration voice
6. Validate continuity and escalation before final output

### Step 1 — Entity Application

Use:
`/prompts/10_entity_integration_prompt.md`

Determine:
- active entity behavior
- escalation stage
- interaction mode

---

### Step 2 — Scene Construction

Use:
`/playbooks/01_horror_scene_builder.md`

Ensure:
- clear purpose per scene
- progression of tension
- no filler or static moments

---

### Step 3 — Behavior Mapping

Translate entity attributes into scene elements:

- Behavior Class → what happens
- Interaction Mode → how it reacts
- Presence Channel → how it is experienced
- Escalation Driver → what increases tension

---

### Step 4 — Voice Control

Use:
`/prompts/04_narration_voice_prompt.md`

Ensure:
- clean, simple narration
- no over-description
- no dramatic language
- immersive tone

---

## Scene Rules

- each scene must escalate OR reinforce
- entity behavior must be visible or implied
- no unrelated events
- no breaking immersion
- scenes must follow channel-defined pacing and transition style when applicable
- each scene must contain a clear change in information, pressure, proximity, limitation, or consequence

---

## Escalation Enforcement

Scenes must follow:

early → subtle presence
mid → pattern recognition
late → proximity increase
climax → confrontation or intrusion

Escalation must feel earned.

Do NOT jump to high-intensity events before the story has established expectation and pattern.

---

## Continuity Rules

- entity behavior must remain consistent
- progression must feel logical
- changes must be explained through escalation, not randomness
- scene progression must align with channel pacing model when applicable
- environment state must carry forward unless intentionally changed
- narrator knowledge must not exceed what the narrator could reasonably know

---

## Output Requirements

Generate scene output that includes:

- scene number or label
- scene purpose
- escalation stage
- active entity behavior
- scene text or structured scene description
- continuity carry-forward note, if needed

Output must remain:

- immersive
- grounded
- controlled in pacing
- free of meta commentary
- free of system explanation

---

## Failure Conditions

Scene is incorrect if:

- nothing escalates or reinforces tension
- entity behavior is unclear
- tone becomes generic
- scene feels disconnected
- no tension increase exists
- continuity breaks
- output ignores the provided channel profile
- scene exists only as filler

---

## Compression Summary

Prompt validation → entity behavior → scene structure → escalation → continuity → output
