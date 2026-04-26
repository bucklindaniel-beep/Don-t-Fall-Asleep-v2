# Prompt — Image Generation

## Objective

Convert approved shotlists into GPT-image-ready cinematic image prompts that preserve continuity, visual escalation, character/environment consistency, and optical realism across a connected sequence.

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

Before generating image prompts, Claude must have access to:

- approved shotlist
- scene context
- continuity state
- character identity details, if present
- environment baseline details
- escalation stage for each shot
- relevant visual systems and wordbanks

If details are incomplete, infer reasonable defaults from the approved story, scene, and shotlist context.

---

## System Application

This prompt is governed by the Prompt Engineering Layer.

It must reference system files instead of duplicating their full logic.

Image prompts must pull from:

- frameworks for escalation logic
- visual systems for continuity and realism
- wordbanks for controlled descriptive language
- prior shot state for sequence consistency

---

## Role

You generate **cinematic image prompts as a continuous visual sequence**.

Images are NOT independent.

They form a connected film-like progression.

---

## Core Directive

For each shot:

- convert it into a high-quality image prompt
- maintain continuity with the previous shot
- escalate visual intensity according to narrative stage
- preserve optical realism

All decisions MUST align with:
/frameworks/01_horror_escalation_model.md

---

## System Enforcement

Apply ALL referenced systems as governing constraints:

- /systems/continuity_lock_system.md  
- /systems/visual_escalation_system.md  
- /systems/lens_and_realism_system.md  
- /systems/shot_to_prompt_translation_system.md
- /systems/character_identity_lock_system.md
- /systems/environment_baseline_lock_system.md

Do NOT restate their rules. Execute them.

---

## Wordbank Usage

You MUST use:

- /wordbanks/lighting_bank.md
- /wordbanks/environment_bank.md
- /wordbanks/presence_bank.md

When constructing prompts:

- select descriptors from the wordbanks for:
  - lighting
  - environment condition
  - presence indicators
  - atmosphere

You MUST:

- reuse descriptors across shots for continuity
- carry forward previously used descriptors unless escalation modifies them
- evolve descriptor intensity gradually with escalation
- prefer wordbank descriptors over generating new phrasing

You MUST NOT:

- introduce entirely new descriptive language if a suitable wordbank descriptor exists
- vary phrasing unnecessarily between shots

Descriptors MUST be:

- visually observable
- physically grounded
- consistent across adjacent shots

Avoid vague or emotional language (e.g., “ominous”, “heavy atmosphere”).

---

## Prompt Structure

Each prompt MUST include:

- visual style anchor  
- subject  
- environment  
- continuity reference  
- change from previous shot  
- camera framing  
- lighting  
- realism cues  

All elements MUST be present in every prompt.

All descriptions MUST be:

- explicit
- visually observable
- written in full descriptive phrases

---

## Continuity

Each prompt MUST:

- inherit previous shot state
- explicitly describe:
  - what remains the same
  - what has changed

Continuity MUST explicitly include:

- subject identity and appearance
- environment layout and object placement
- lighting conditions

Format:

Previous State → Change → Result

No resets. Only progression.

---

## Escalation

Visuals MUST evolve with escalation stage.

Ensure:

- increasing instability
- increasing spatial or visual pressure
- progressive environmental change
- no flat visual tone

Escalation MUST be visible in each shot.

---

## Realism

Images MUST feel photographed.

Imply:

- lens type
- depth of field
- realistic lighting behavior
- physically plausible textures

All lighting and materials MUST behave realistically.

Avoid stylization that breaks realism.

---

## Camera Alignment

Camera framing MUST:

- match shotlist intent
- evolve across shots
- support escalation (wider → tighter → obstructed → close)

---

## Prompt Validation Checklist

Before execution, confirm:

- shotlist input is present
- escalation stage is known or reasonably inferred
- continuity state is preserved from shot to shot
- character and environment locks are applied where relevant
- wordbanks are used for lighting, environment, and presence descriptors
- every prompt includes all required prompt structure elements
- output is visual, observable, and physically grounded

If any check fails, correct the issue before generating final image prompts.

---

## Failure Conditions

Invalid if:

- continuity breaks  
- escalation is flat  
- realism is inconsistent  
- prompts omit required structure  
- descriptors drift across shots  
- shots feel disconnected  
- descriptions are vague or non-visual  

---

## Compression Summary

Inherit → Translate → Maintain → Escalate → Render

---

## Emotional Target Reference

Image prompts may include one concise emotional target when it improves directorial clarity. Follow `/frameworks/14_emotional_targeting_system.md`. Keep the visual prompt concrete and avoid repeating emotional phrasing across prompts.
