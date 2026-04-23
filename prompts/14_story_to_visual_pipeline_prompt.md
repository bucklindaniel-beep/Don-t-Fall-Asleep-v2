## Step 1 — Scene Breakdown

Use:

- /prompts/02_horror_scene_generation_prompt.md
- /frameworks/01_horror_escalation_model.md
- /frameworks/06_scene_construction_system.md

You MUST:

- divide the story into coherent scenes
- align each scene to escalation stage
- preserve causal progression
- ensure no scene duplicates the same purpose

Output:
- ordered scene list
- each scene labeled with escalation stage
- short scene summary

---

## Step 2 — Shotlist Generation

Use:

- /prompts/11_shotlist_generation_prompt.md
- /prompts/10_entity_integration_prompt.md

You MUST:

- generate a cinematic shotlist for each scene
- ensure each shot supports escalation and entity behavior
- vary framing, reveal timing, and composition
- avoid redundant shots

You MUST also:

- enforce continuity planning across shots
- ensure each shot builds directly from the previous shot
- apply /systems/camera_language_system.md

Each shot MUST include:

- shot scale
- camera position
- camera movement
- framing style

Camera behavior MUST:

- evolve with escalation stage
- increase proximity over time
- become less stable as tension increases

Output:
- scene-by-scene shotlist
- each shot described clearly and visually

---

## Step 3 — Image Prompt Generation

Use:

- /prompts/03_image_generation_prompt.md
- /frameworks/01_horror_escalation_model.md

You MUST:

- convert each shot into a high-quality image prompt using structured translation and wordbank descriptors
- preserve continuity across shots
- escalate visuals according to narrative stage

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

## Prompt Construction

Each prompt MUST:

- be generated through structured translation from the shotlist
- follow a consistent format across all shots
- include:
  - visual style anchor
  - subject
  - environment
  - continuity reference
  - change from previous shot
  - camera framing
  - lighting
  - realism cues

Each prompt MUST follow:

Previous State → Change → Result

All elements MUST be present in every prompt.

---

## Continuity + Escalation Rule

Each shot MUST:

- preserve prior visual state (continuity)
- evolve that state (escalation)

No resets. Only progression.

Escalation MUST be visible in each shot.

---

## Step 3.5 — Continuity Review Pass

Use:

- /systems/continuity_review_pass_system.md

You MUST:

- review the full image prompt sequence before final output
- check for:
  - character identity drift
  - environment baseline drift
  - object inconsistency
  - lighting inconsistency
  - escalation errors
  - camera inconsistency
  - prompt structure omissions

If issues are found:

- correct the sequence before proceeding

Only approved sequences may be output.

---

## Output

- one image prompt per shot
- ordered by scene and shot number

## Step 4 — Prompt Batch Export

Use:

- /systems/prompt_batch_export_spec.md

You MUST:

- convert all image prompts into the required export format
- apply strict naming and ordering rules
- ensure prompts are ready for batch image generation

Output MUST:

- contain only labeled prompt blocks
- follow exact formatting rules
- be sequential and deterministic
