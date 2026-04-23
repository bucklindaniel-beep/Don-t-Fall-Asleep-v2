# System Summary — Horror Visual Generation Pipeline

I am building a structured, system-driven pipeline to generate cinematic horror stories and convert them into GPT-image-2-ready image prompts for batch generation.

## Core Goal

Generate:

Story → Scenes → Shotlist → Image Prompts → (Batch Image Generation via OpenAI API)

All outputs must maintain:

- strict continuity
- controlled escalation
- visual consistency across shots
- GPT-image-2 compatibility

---

## Pipeline Stages

1. Scene Breakdown  
2. Shotlist Generation  
3. Image Prompt Generation  
4. Continuity Review Pass  

---

## Key Systems

### Core Visual Systems
- continuity_lock_system
- visual_escalation_system
- camera_language_system
- lens_and_realism_system

### Translation Layer
- shot_to_prompt_translation_system

### Continuity Enforcement
- character_identity_lock_system
- environment_baseline_lock_system
- continuity_review_pass_system

### Narration Layer
- narrator_identity_system
- narration_review_pass_system

---

## Frameworks

- horror_escalation_model
- scene_construction_system
- tension_pacing_system

---

## Wordbanks

Used for controlled, reusable visual language:

- lighting_bank
- environment_bank
- presence_bank
- narration_vocabulary_filter

Visual wordbanks are the PRIMARY source of image prompt descriptors.
Narration vocabulary filter controls spoken script language.

---

## Prompt Design Philosophy

Prompts must be:

- structured (not freeform)
- visually explicit (no abstract language)
- continuity-aware
- escalation-aware
- consistent across shots

Each prompt includes:

- style anchor
- subject (identity locked)
- environment (baseline locked)
- continuity reference
- change from previous shot
- camera framing
- lighting
- realism cues

---

## Continuity Model

Continuity is enforced through:

### Character Identity Lock
- fixed identity
- reused exactly across prompts

### Environment Baseline Lock
- fixed layout and architecture
- only state changes allowed

### Shot-to-Shot Progression
- Previous State → Change → Result
- no resets

---

## Quality Control

### Visual Quality
Continuity Review Pass ensures:

- no identity drift
- no environment drift
- no object inconsistency
- proper escalation progression
- correct camera logic
- complete prompt structure

No sequence should be used for generation without passing review.

### Narration Quality
Narration Review Pass ensures:

- narrator identity consistency
- vocabulary filter compliance
- voice progression across escalation stages
- ElevenLabs formatting compliance
- setup engagement
- spoken delivery readiness

No script should be finalized without passing narration review.

---

## Output Target

Final output is:

- a sequence of GPT-image-2 optimized prompts
- used in a PowerShell + OpenAI API batch image generation pipeline

---

## Current State

The system is:

- structurally complete
- continuity-enforced
- GPT-image-2 optimized
- narration voice layer active (narrator identity, vocabulary filter, ElevenLabs formatting, voice examples, narration review pass)
- ready for testing and integration
