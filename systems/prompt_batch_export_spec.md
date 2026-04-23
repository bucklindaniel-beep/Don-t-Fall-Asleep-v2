# System — Prompt Batch Export Specification

## Purpose

Defines the exact structure and formatting for exporting image generation prompts.

This system ensures:

- deterministic prompt formatting
- consistent shot ordering
- compatibility with GPT-image-2 batch generation
- clean parsing for external scripts (PowerShell / API)

---

## Core Principle

Prompts are NOT freeform text.

They are structured data.

Each prompt MUST follow a strict format and ordering.

---

## Output Format

The final output MUST be a **flat, ordered prompt list**.

Each prompt MUST be wrapped in a labeled block.

---

## Required Structure

Each prompt MUST follow this exact format:

[SCENE_XX_SHOT_XX]  
<full prompt text>

---

## Example

[SCENE_01_SHOT_01]  
Photorealistic cinematic horror film still, 16:9, natural lighting, realistic textures, high detail, depth of field  

male, mid-20s, lean build, pale skin, short messy dark brown hair, faint stubble, wearing a loose gray t-shirt and dark sweatpants  

small one-bedroom apartment, bedroom connected to living room, bed against wall, nightstand on left side, narrow hallway visible  

same character identity, same room layout, same lighting source  

no visible change yet, environment stable  

wide shot, camera positioned at doorway, static framing  

soft warm bedside lamp lighting, low ambient light  

physically realistic lighting, no stylization, consistent perspective  

---

## Naming Convention

Each prompt MUST use:

SCENE_{scene_number}_SHOT_{shot_number}

Rules:

- scene_number MUST be zero-padded (01, 02, 03…)
- shot_number MUST be zero-padded (01, 02, 03…)
- numbering MUST be sequential
- no skipped numbers

---

## Ordering Rules

Prompts MUST be:

- ordered by scene
- ordered by shot within scene
- strictly sequential

Example:

SCENE_01_SHOT_01  
SCENE_01_SHOT_02  
SCENE_01_SHOT_03  
SCENE_02_SHOT_01  
SCENE_02_SHOT_02  

---

## Prompt Content Rules

Each prompt MUST contain:

1. Visual Style Anchor  
2. Subject Description (identity locked)  
3. Environment Description (baseline locked)  
4. Continuity Reference  
5. Change from Previous Shot  
6. Camera + Framing  
7. Lighting  
8. Realism Cues  

All sections MUST be present.

---

## Continuity Enforcement

Each prompt MUST explicitly include:

- same character identity (full baseline)
- same environment baseline
- same lighting source

Continuity MUST be restated in every prompt.

---

## Change Declaration Rule

Each prompt MUST include a clearly defined change:

- object movement
- lighting shift
- spatial change
- presence escalation

Format:

Previous State → Change → Result

---

## Style Anchor Rule

The first line of every prompt MUST be identical.

Example:

Photorealistic cinematic horror film still, 16:9, natural lighting, realistic textures, high detail, depth of field, no text, no artifacts

This MUST NOT change across prompts.

---

## Formatting Rules

- no bullet points inside prompts
- no markdown inside prompts
- no emojis
- no extra commentary
- no section headers inside prompts
- blank line separation between sections is allowed

---

## Output Constraints

The system MUST output:

- ONLY prompt blocks
- NO explanations
- NO analysis
- NO extra text

---

## Script Compatibility Rules

Prompts MUST be:

- copy-paste ready
- easily parsed by line-based scripts
- consistent in delimiter usage

---

## Failure Conditions

The export FAILS if:

- naming is inconsistent
- numbering skips
- prompts are out of order
- sections are missing
- style anchor changes
- continuity is not explicitly restated
- prompts contain extra text outside blocks

---

## Compression Summary

Structured Prompt → Labeled Block → Sequential Order → Ready for Batch Execution
