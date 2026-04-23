# System — Shot to Prompt Translation

## Purpose

Converts structured shot descriptions into consistent, model-ready image generation prompts.

Ensures:
- prompt consistency
- stable visual outputs
- compatibility with generative image models
- preservation of continuity and escalation

---

## Core Principle

A shot is not directly a prompt.

It must be translated into:

- visual description
- camera description
- environment state
- continuity reference

All translation decisions MUST reflect the current escalation stage from:
/frameworks/01_horror_escalation_model.md

---

## Prompt Structure

Each image prompt MUST follow this structure:

[Visual Style Block]  
[Subject Description]  
[Environment Description]  
[Continuity Reference]  
[Change From Previous Shot]  
[Camera + Framing]  
[Lighting + Atmosphere]  
[Realism Cues]

All sections MUST be present in every prompt.

No section may be omitted or merged.

---

## Wordbank Integration

You MUST use:

- /wordbanks/lighting_bank.md
- /wordbanks/environment_bank.md
- /wordbanks/presence_bank.md

When translating shots:

- map shot elements to wordbank descriptors
- maintain consistent descriptor usage across prompts
- escalate descriptor intensity using wordbank language

Descriptor selection MUST:

- align with escalation stage
- remain consistent across adjacent shots
- reuse previously established descriptors whenever possible

Previously used descriptors SHOULD be explicitly carried forward and reused in subsequent prompts unless escalation modifies them.

You MUST:

- treat wordbanks as the primary source of descriptive language
- prefer wordbank descriptors over generating new phrasing
- maintain descriptor continuity across shots unless escalation requires change

You MUST NOT:

- introduce entirely new descriptive language if a suitable wordbank descriptor exists
- vary phrasing unnecessarily between shots

---

## Visual Style Block

Each prompt MUST begin with a consistent style anchor.

Example:

Photorealistic cinematic horror film still, 16:9, natural lighting, realistic textures, high detail, depth of field

This MUST remain consistent across all prompts.

---

## Subject Description

Character identity MUST follow:
/systems/character_identity_lock_system.md

Each subject MUST be defined using a consistent baseline identity.

Define:

- who or what is present
- physical appearance (full identity block)
- posture or action

The identity MUST:

- be reused exactly across prompts
- not introduce new traits
- remain consistent in wording

Minor changes (posture, expression, slight clothing state) MUST be described separately from identity.

---

## Environment Description

Environment identity MUST follow:
/systems/environment_baseline_lock_system.md

Each environment MUST be defined using a consistent baseline environment block.

Define:

- location
- layout
- key objects
- spatial relationships

The baseline environment MUST:

- be reused exactly across prompts
- preserve architectural and spatial consistency
- separate stable layout from changing state

---

## Continuity Reference

Each prompt MUST include:

- what remains the same from previous shot

Continuity MUST explicitly include:

- same character identity (full baseline reused)
- same environment baseline (layout, furniture, doors/windows)
- same lighting source and conditions

Example:

same male, mid-20s, lean build, pale skin, short messy dark brown hair, faint stubble, wearing a loose gray t-shirt and dark sweatpants  
same room layout, same lighting source

---

## Change Description

Each prompt MUST include:

- a clear, observable visual change from the previous shot

Changes MUST be:

- specific (object, lighting, spatial, or presence-based)
- incremental unless at climax
- directly tied to escalation

Changes MUST NOT:

- be vague or abstract
- repeat without progression

---

## Camera + Framing

Translate shotlist data into:

- shot scale
- camera position
- framing style

---

## Lighting + Atmosphere

Define:

- light source
- intensity
- tone (warm, cold, dim, harsh)

Lighting MUST:

- align with escalation stage
- evolve gradually across shots
- remain physically plausible

---

## Realism Cues

Ensure:

- physically plausible textures
- realistic lighting behavior
- grounded environmental detail
- no stylized or abstract elements unless explicitly required

---

## Consistency Rules

Prompts MUST:

- reuse key descriptive anchors across shots
- maintain consistent character identity and descriptors
- maintain consistent environment descriptors
- preserve visual identity across the sequence

---

## Failure Conditions

Translation FAILS if:

- prompts vary wildly in structure
- continuity is not explicitly referenced
- character identity changes or drifts
- style anchor changes between prompts
- outputs feel inconsistent across shots
- visual changes are unclear or non-progressive

---

## Compression Summary

Shot → Structured Description → Controlled Vocabulary → Locked Identity → Consistent Prompt
