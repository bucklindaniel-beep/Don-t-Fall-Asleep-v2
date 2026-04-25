# Stage Execution Map

## Metadata
- Type: System
- Domain: Pipeline Execution / Stage Control / Model Guidance
- Path: `/systems/stage_execution_map.md`
- Status: active
- Priority: critical

---

## Purpose

This file defines the standard execution order for the production pipeline.

It tells Claude:
- which stage comes next
- what each stage requires before execution
- what each stage produces
- when to stop for user review
- when to recommend a model switch
- how to keep execution structured without asking unnecessary questions

This file does NOT define creative standards.
Creative standards belong in prompts, frameworks, playbooks, wordbanks, and memory.

---

## Core Rule

Claude must follow the pipeline in order unless the user explicitly requests a specific stage.

Claude must not skip required upstream context unless the missing context can be safely inferred.

Claude should continue automatically when the next step is obvious.

Claude should stop only when:
- user approval is required
- a model switch is recommended
- a critical validation failure occurs
- required context is missing and cannot be safely inferred

---

## Standard Pipeline Order

1. User Seed Intake
2. Narrator Identity Generation
3. Story Generation
4. Scene Breakdown
5. Shotlist Generation
6. Image Prompt Generation
7. Editing Script Generation
8. Narration Formatting
9. Continuity Review
10. Memory Routing
11. Execution Logging
12. Repository Update Recommendations

---

## Stage Map

### 1. User Seed Intake

#### Purpose
Convert the user idea into a usable production seed.

#### Required Inputs
- user idea, theme, premise, or prompt seed

#### Outputs
- interpreted premise
- assumed genre direction
- default constraints if user did not specify them

#### Validation
- confirm the seed is usable
- do not ask clarification questions unless the idea is impossible to interpret

#### Stop Rule
Do not stop if reasonable defaults can be used.

#### Recommended Model
- Sonnet for basic interpretation
- Opus if the seed is complex, abstract, or highly creative

---

### 2. Narrator Identity Generation

#### Purpose
Create a grounded narrator identity that supports the story premise.

#### Required Inputs
- user seed
- genre direction
- relevant memory and style calibration

#### Outputs
- narrator identity
- perspective
- personal context
- credibility anchors
- emotional baseline

#### Validation
- narrator must support the premise
- narrator must not over-explain the horror
- narrator must be useful for voice and narration formatting later

#### Stop Rule
Continue unless narrator identity conflicts with user intent.

#### Recommended Model
- Opus preferred

---

### 3. Story Generation

#### Purpose
Generate the main horror story output.

#### Required Inputs
- user seed
- narrator identity
- applicable frameworks
- memory and style calibration

#### Outputs
- complete story draft
- clear beginning, escalation, and ending
- grounded psychological tension

#### Validation
- no major repetition
- no broken continuity
- no unsupported escalation jumps
- no direct source imitation
- narration must be suitable for spoken delivery

#### Stop Rule
Stop for user review after story generation unless the user explicitly requested the full pipeline in one pass.

#### Recommended Model
- Opus strongly preferred

---

### 4. Scene Breakdown

#### Purpose
Convert the story into structured production scenes.

#### Required Inputs
- approved or current story draft

#### Outputs
- numbered scenes
- scene purpose
- location
- character state
- escalation level
- continuity anchors

#### Validation
- scenes must preserve story order
- no redundant scenes unless intentionally used for tension
- each scene must be visually and narratively useful

#### Stop Rule
Continue if story was approved or user requested pipeline continuation.

#### Recommended Model
- Sonnet acceptable
- Opus if scene structure requires creative repair

---

### 5. Shotlist Generation

#### Purpose
Convert scenes into visual shot planning.

#### Required Inputs
- scene breakdown
- visual continuity anchors
- camera and realism systems

#### Outputs
- shot number
- scene reference
- camera framing
- subject
- action
- lighting
- continuity notes
- escalation notes

#### Validation
- visual variety must increase across shots
- continuity must remain locked
- each shot must be renderable
- no abstract or non-visual instructions

#### Stop Rule
Stop for review if shot count, visual direction, or continuity is uncertain.

#### Recommended Model
- Sonnet acceptable
- Opus if complex visual continuity is required

---

### 6. Image Prompt Generation

#### Purpose
Convert shotlist entries into GPT-image-ready prompts.

#### Required Inputs
- approved shotlist
- character identity lock
- environment lock
- visual escalation rules
- image prompt standards

#### Outputs
- one image prompt per shot
- consistent character/environment details
- camera, lighting, mood, and realism details
- negative constraints where useful

#### Validation
- prompts must be visually concrete
- prompts must preserve continuity
- prompts must avoid conflicting details
- prompts must be suitable for batch generation

#### Stop Rule
Stop for approval before API generation.

#### Recommended Model
- Sonnet acceptable for formatting
- Opus if prompt quality or continuity is weak

---

### 7. Editing Script Generation

#### Purpose
Create production guidance for assembling the video.

#### Required Inputs
- story
- scene breakdown
- shotlist
- image prompts or final visual plan

#### Outputs
- edit sequence
- pacing notes
- sound design notes
- transition notes
- music/ambience direction

#### Validation
- editing notes must support story tension
- pacing must match escalation
- sound design must not overpower narration

#### Stop Rule
Continue unless required visual or narration context is missing.

#### Recommended Model
- Sonnet acceptable

---

### 8. Narration Formatting

#### Purpose
Prepare the story for voice generation and spoken delivery.

#### Required Inputs
- final or current story
- narration style calibration
- voice delivery rules

#### Outputs
- narration-ready text
- pacing breaks
- delivery notes if needed

#### Validation
- must preserve story meaning
- must improve spoken flow
- must remove awkward phrasing
- must not over-edit the story voice

#### Stop Rule
Stop for approval before voice generation.

#### Recommended Model
- Sonnet acceptable
- Opus if narration quality needs creative refinement

---

### 9. Continuity Review

#### Purpose
Review all production outputs for consistency.

#### Required Inputs
- story
- scenes
- shotlist
- image prompts
- editing script
- narration format

#### Outputs
- continuity issues
- correction recommendations
- approval status

#### Validation
- character continuity
- environment continuity
- escalation continuity
- object continuity
- narration-to-visual alignment

#### Stop Rule
Stop if continuity issues affect production quality.

#### Recommended Model
- Opus preferred for deep review
- Sonnet acceptable for checklist review

---

### 10. Memory Routing

#### Purpose
Decide whether any output, issue, preference, or improvement should be stored in memory.

#### Required Inputs
- stage output
- user feedback
- execution log notes
- validation results

#### Outputs
- memory update recommendation
- memory destination
- no-update decision if nothing durable was learned

#### Validation
- memory must not become noisy
- do not store routine outputs
- route only reusable project intelligence

#### Stop Rule
Do not stop unless memory update requires user approval.

#### Recommended Model
- Sonnet acceptable

---

### 11. Execution Logging

#### Purpose
Record diagnostic notes for debugging and system improvement.

#### Required Inputs
- completed stage
- validation result
- major decisions
- roadblocks or corrections

#### Outputs
- structured log entry in `/logs/execution_log.md`

#### Validation
- log must be concise
- log must not duplicate full creative output
- log must record memory routing result

#### Stop Rule
Do not stop unless logging reveals a critical system issue.

#### Recommended Model
- Sonnet acceptable

---

### 12. Repository Update Recommendations

#### Purpose
Identify whether any system file should be updated.

#### Required Inputs
- execution log
- memory updates
- repeated issues
- user feedback
- pattern promotion rules

#### Outputs
- recommended file path
- change needed
- reason
- priority

#### Validation
- do not recommend new files if an existing file can be refined
- do not promote one-off issues into hard rules
- use `/systems/system_improvement_router.md`

#### Stop Rule
Stop and ask for approval before modifying repository files.

#### Recommended Model
- Sonnet acceptable
- Opus if change affects core architecture

---

## Model Boundary Rules

Claude should recommend a model switch only at meaningful boundaries.

Recommended Opus stages:
- narrator identity generation
- story generation
- creative repair
- continuity review
- major architecture changes

Recommended Sonnet stages:
- scene breakdown
- shotlist generation
- image prompt formatting
- editing script generation
- narration formatting
- logging
- memory routing
- repository cleanup

Do not stop after every minor step just to recommend a model switch.

Stop at model boundaries when quality would benefit from switching.

---

## Autonomy Rules

Claude should use reasonable defaults when:
- the user seed is clear enough
- missing details are low-risk
- the next pipeline stage is obvious
- the repository contains enough guidance

Claude should ask a clarification question only when:
- required context is missing
- multiple valid interpretations would produce very different outputs
- execution could violate system rules
- a critical validation failure occurs

---

## Integration Points

This file connects to:

- `/systems/prompt_engineering_layer.md`
- `/systems/prompt_validation_logging.md`
- `/systems/system_improvement_router.md`
- `/logs/execution_log.md`
- `/memory/README.md`
- stage-specific prompt templates
- relevant frameworks, playbooks, and wordbanks

---

## Completion Rule

A stage is not complete until:
- the requested output is produced
- prompt validation has been considered
- continuity has been preserved
- memory routing has been considered
- execution logging has been completed or recommended
- next action is clear

---

## Summary

This map keeps Claude's execution structured, stage-aware, and quality-focused.

It prevents unnecessary stopping while still preserving review points, model-switch boundaries, logging discipline, and repository improvement flow.
