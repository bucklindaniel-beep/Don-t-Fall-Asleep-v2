# Prompt — Shotlist Generation

## Metadata
- Type: Prompt
- Domain: Generation / Visual Planning
- Purpose:
  - convert scenes into cinematic shotlists
  - align visuals with entity-driven storytelling
- Dependencies:
  - /prompts/10_entity_integration_prompt.md
  - /playbooks/04_entity_application_playbook.md
  - /prompts/04_narration_voice_prompt.md

---

## Objective

Convert approved scenes into structured cinematic shotlists that support narration pacing, entity behavior, visual escalation, channel pacing tendencies, and downstream image prompt generation.

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

Before generating shotlists, Claude must have access to:

- approved story or scene text
- active entity behavior
- escalation stage
- scene purpose
- channel profile, if provided
- relevant camera and visual systems

If visual details are incomplete, infer grounded cinematic defaults from scene context without breaking continuity.

---

## System Application

This prompt is governed by the Prompt Engineering Layer.

It must reference system files instead of duplicating their full logic.

Shotlists must pull from:

- entity integration for behavior mapping
- camera language systems for framing
- channel profiles for pacing tendencies
- retention mechanics for reveal timing

---

## Role

You generate cinematic shotlists from scenes.

You do NOT describe random visuals.

Every shot must:
- reinforce entity behavior
- reflect escalation
- support narration pacing

---

## Core Directive

For each scene:

1. Identify active entity behavior  
2. Map behavior to visual language  
3. Generate structured shots  
4. Ensure progression across shots  

---

## Channel Structure Integration

When a channel profile is provided:

You MUST:

- extract visual pacing tendencies from `/analysis/channel_profiles/`
- identify:
  - how visual information is revealed
  - how quickly shots escalate
  - how much is shown vs withheld
  - whether framing is restrained, cinematic, fragmented, or observational

You MUST:

- apply those tendencies to shot construction
- ensure shot progression reflects the channel’s pacing model

---

## Shot-Level Structure Enforcement

Channel profiles define:

- shot pacing
- reveal timing
- transition rhythm
- visual restraint vs exposure

They DO NOT define:

- entity behavior
- narration tone

---

## Constraint

Channel profiles must guide:

- how shots unfold
- how visual tension is distributed
- how much the viewer sees at each stage

But MUST NOT override:

- entity behavior
- retention mechanics
- escalation logic

---

## Execution Flow

### Step 1 — Entity Context

Use:
/prompts/10_entity_integration_prompt.md

Determine:
- behavior class
- presence channel
- escalation stage

---

### Step 2 — Channel Visual Structure

If a channel profile is provided:

- extract shot pacing and reveal style from `/analysis/channel_profiles/`
- determine whether the scene should be framed as:
  - restrained
  - observational
  - cinematic
  - fragmented

---

### Step 3 — Scene Mapping

Break scene into:
- beats
- moments of tension
- escalation points

---

### Step 4 — Shot Construction

Generate shots that reflect:

- entity behavior
- channel pacing model
- progressive visual escalation

Each shot must include:

- framing (wide, medium, close, POV)
- subject (character, environment, entity presence)
- composition (foreground/background tension, negative space, occlusion)
- lighting (tone, contrast, shadows)
- implied motion (stillness, tension, movement)
- entity presence (direct or indirect)

---

## Shot Rules

- no duplicate shots  
- each shot must introduce new visual information or tension  
- visual escalation must match narrative escalation  
- entity presence must evolve across shots  
- shots must progressively reveal information to sustain curiosity and retention  
- shots must follow channel-defined reveal pacing and visual restraint when applicable  

---

## Camera Language Enforcement

You MUST apply:

/systems/camera_language_system.md

Each shot MUST define:

- shot scale
- camera position
- camera movement
- framing style

Camera MUST:

- evolve with escalation stage
- increase proximity over time
- become less stable as tension increases

Shots MUST feel like intentional cinematography, not random framing.

---

## Lens Planning

Each shot SHOULD imply:

- lens type
- focus strategy
- realism intent

Lens choices MUST support:

- spatial clarity
- emotional emphasis
- escalation stage

---

## Entity Mapping

Observer:
- distance framing
- silhouettes
- threshold positioning

Mimic:
- familiar framing with subtle errors
- incorrect posture or timing

Follower:
- over-the-shoulder
- rear framing
- implied movement behind subject

Environmental:
- warped perspective
- repetition
- spatial inconsistency

Intrusive:
- close proximity framing
- tight compositions
- obstructed views

---

## Channel Visual Pacing Reference

Use channel profiles to determine visual pacing style.

Examples:

### Restrained Narration Style
- fewer shots
- longer holds
- delayed visual confirmation
- emphasis on distance and ambiguity

### Cinematic Suspense Style
- more varied framing
- stronger progression in shot size
- more deliberate reveal timing
- visual escalation through composition

### Fragmented / Analog Style
- incomplete visual information
- abrupt or disorienting transitions
- partial views
- environmental emphasis over clear subject framing

---

## Output Format

Scene X — Shotlist

Shot 1:
[description]

Shot 2:
[description]

---

## Prompt Validation Checklist

Before execution, confirm:

- scene input is present
- entity behavior is identified or reasonably inferred
- shot progression escalates visually
- camera language is applied to every shot
- channel pacing is applied when available
- no duplicate or filler shots are included
- output format is structured and usable for downstream image prompts

If any check fails, correct the issue before finalizing the shotlist.

---

## Failure Conditions

- generic shots  
- no escalation  
- entity not represented  
- repetition without change  

---

## Compression Summary

Scene → Entity Behavior → Visual Beats → Shotlist
