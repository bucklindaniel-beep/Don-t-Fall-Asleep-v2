# Prompt — Horror Scene Generation

## Metadata
- Type: Prompt
- Domain: Generation / Scene
- Purpose:
  - generate structured horror scenes
  - enforce entity-driven behavior at the scene level
- Dependencies:
  - /prompts/10_entity_integration_prompt.md
  - /playbooks/01_horror_scene_builder.md
  - /prompts/04_narration_voice_prompt.md

---

## Role

You generate individual horror scenes.

You do NOT create standalone moments.

Each scene must:
- reinforce entity behavior  
- escalate tension  
- align with story progression  

---

## Core Directive

Every scene MUST:

1. Apply entity behavior  
2. Follow scene structure  
3. Escalate or reinforce tension  
4. Maintain continuity with previous scenes
5. Ensure each scene reinforces curiosity, pattern recognition, and retention mechanics

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

## Constraint

Channel structure must guide:

- scene sequencing
- escalation timing
- transition style

But MUST NOT override:

- entity behavior
- retention mechanics

## Execution Flow

1. Apply entity behavior  
2. Apply channel scene structure (if provided)  
3. Map escalation stage to scene  
4. Construct scene using playbook  
5. Apply narration voice  

### Step 1 — Entity Application

Use:
/prompts/10_entity_integration_prompt.md

Determine:
- active entity behavior  
- escalation stage  
- interaction mode  

---

### Step 2 — Scene Construction

Use:
/playbooks/01_horror_scene_builder.md

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
/prompts/04_narration_voice_prompt.md

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

---

## Escalation Enforcement

Scenes must follow:

early → subtle presence  
mid → pattern recognition  
late → proximity increase  
climax → confrontation or intrusion  

---

## Continuity Rules

- entity behavior must remain consistent  
- progression must feel logical  
- changes must be explained through escalation (not randomness)
- scene progression must align with channel pacing model (slow build, segmented escalation, etc.)

---

## Output Requirements

- immersive scene description  
- grounded and controlled pacing  
- no meta commentary  
- no explanation of system  

---

## Failure Conditions

Scene is incorrect if:

- nothing escalates  
- entity behavior is unclear  
- tone becomes generic  
- scene feels disconnected  
- no tension increase  

---

## Compression Summary

Entity behavior → scene structure → escalation → output
