# Prompt — Entity Integration

## Metadata
- Type: Prompt
- Domain: Execution / Integration
- Purpose:
  - enforce entity-driven generation
  - connect selection logic to output generation
  - ensure all horror content follows behavior-based systems
- Dependencies:
  - /analysis/entities/entity_selection_logic.md
  - /analysis/entities/
  - /playbooks/04_entity_application_playbook.md
- Used By:
  - /prompts/01_horror_script_master_prompt.md
  - /prompts/02_horror_scene_generation_prompt.md
- Priority: critical

---

## Role

You are responsible for ensuring that **all generated horror content is driven by entity behavior systems**, not generic storytelling.

You do NOT invent random threats.

You SELECT and APPLY entities.

---

## Core Directive

Every generation must follow:

1. Select entity using selection logic  
2. Apply entity using application playbook  
3. Generate output based on behavior  

Failure to do this = incorrect output.

---

## Step 1 — Entity Selection

Use:
/analysis/entities/entity_selection_logic.md

Determine:

- primary entity  
- optional secondary entity (only if escalation requires it)

Selection must be based on:
- environment  
- narrative phase  
- psychological goal  

---

## Step 2 — Extract Entity Attributes

From the selected entity file(s), extract:

- Behavior Class  
- Interaction Mode  
- Presence Channel  
- Perceptual Reliability  
- Escalation Driver  
- Boundary Relationship  

Do NOT skip this step.

---

## Step 3 — Apply Entity Behavior

Use:
/playbooks/04_entity_application_playbook.md

Translate entity attributes into:

- scene behavior  
- pacing  
- escalation  
- interaction patterns  

---

## Step 4 — Enforce Behavior-Based Output

All output must:

- reflect entity behavior  
- maintain consistency  
- escalate according to the defined driver  
- align with boundary progression  

---

## Step 5 — Maintain Constraints

DO NOT:

- invent behavior outside entity rules  
- mix incompatible entity types  
- introduce intrusive entities too early  
- break escalation structure  

---

## Step 6 — Output Execution

Generate content based on:

- entity-driven tension  
- progressive escalation  
- controlled perception  

NOT:
- random horror elements  
- generic tropes  
- unstructured scenes  

---

## Behavior Mapping Reference

---

### Behavior Class → Output Style

| Behavior | Output Focus |
|--------|-------------|
| observer | positioning, stillness, distance |
| mimic | familiarity, subtle errors, delay |
| follower | movement, tracking, proximity |
| environmental | spatial distortion, layout changes |
| intrusive | boundary violation, proximity, confinement |

---

### Interaction Mode → Scene Control

| Mode | Implementation |
|------|--------------|
| passive | background presence |
| reactive | responds to protagonist |
| adaptive | evolves behavior |
| aggressive | initiates action |

---

### Presence Channel → Sensory Output

| Channel | Usage |
|--------|------|
| visual | silhouettes, positioning |
| auditory | voices, sounds |
| spatial | movement, direction |
| environmental | lighting, layout, objects |

---

## Escalation Enforcement

Progress must follow:

presence → pattern → escalation → proximity → confrontation

Do NOT:
- jump stages  
- skip reinforcement  
- collapse escalation too quickly  

---

## Boundary Progression Enforcement

Track entity position relative to safety:

external → threshold → internal

Ensure progression aligns with narrative phase.

---

## Multi-Entity Rules

If using a secondary entity:

- it must reinforce the primary  
- it must not override behavior  
- it must follow escalation logic  

---

## Failure Conditions

Output is incorrect if:

- entity is not clearly applied  
- behavior is inconsistent  
- escalation is missing  
- tone becomes generic  
- structure is ignored  

---

## Compression Summary

Select entity → extract attributes → apply behavior → enforce escalation → generate output
