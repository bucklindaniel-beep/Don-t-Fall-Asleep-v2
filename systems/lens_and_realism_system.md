# System — Lens and Realism

## Metadata
- Type: System
- Domain: Cinematography / Optical Realism / Image Consistency
- Purpose:
  - enforce believable camera optics
  - improve realism across generated images
  - align visual outputs with cinematic camera behavior
- Dependencies:
  - /systems/camera_language_system.md
  - /systems/continuity_lock_system.md
  - /systems/visual_escalation_system.md
- Status: active
- Confidence: high

---

## Purpose

Controls how lens choice and realism cues affect the final image.

Ensures:
- believable perspective
- realistic optical behavior
- cinematic but grounded imagery
- stable visual quality across a sequence

---

## Core Principle

Every image should feel like it was captured by a real camera.

The image MUST obey plausible optical logic.

---

## Lens Logic

Each shot SHOULD imply a lens type based on framing purpose.

### Wide Lens
Use for:
- establishing shots
- spatial distortion
- environmental dominance
- vulnerability within space

Effect:
- broader field of view
- stronger depth exaggeration
- more environmental context

---

### Standard Lens
Use for:
- neutral perspective
- medium shots
- grounded realism
- conversational framing

Effect:
- balanced space
- natural proportions
- less distortion

---

### Long Lens
Use for:
- surveillance feeling
- compressed distance
- voyeuristic tension
- isolating subjects from background

Effect:
- compressed depth
- narrower field of view
- stronger subject separation

---

## Depth of Field Rules

Depth of field MUST support narrative emphasis.

### Deep Focus
Use when:
- environment information matters
- multiple planes are important
- spatial awareness is critical

---

### Shallow Focus
Use when:
- emotional focus is narrow
- threat is implied rather than clear
- attention must be directed precisely

---

## Realism Rules

Visuals MUST:

- maintain believable exposure
- preserve consistent texture quality
- avoid hyper-stylized or dreamlike image behavior unless explicitly intended
- avoid unnatural over-sharpening
- avoid impossible camera perspectives

---

## Exposure and Lighting Realism

Lighting MUST behave like a real photographed scene.

You MUST:

- preserve plausible light falloff
- maintain realistic shadow behavior
- keep highlights and darkness believable
- avoid flat, evenly lit horror scenes unless intentionally sterile

---

## Texture and Material Realism

Materials MUST appear physically believable.

Examples:
- fabric should look like fabric
- skin should not appear plastic
- walls, floors, objects, and surfaces must retain real-world texture

---

## Optical Continuity

Across shots:

- lens behavior should not shift randomly
- depth of field changes must feel motivated
- realism level must remain stable
- perspective should evolve intentionally, not arbitrarily

---

## Escalation Integration

Lens and realism may evolve with escalation:

- Setup → balanced lensing, stable focus
- Disruption → slight focal tension, more selective focus
- Reinforcement → more directed focus, subtle compression or widening
- Escalation → increased subject isolation or environmental pressure
- Climax → aggressive lensing, stronger proximity, heightened optical tension
- Resolution → partial return to balance OR lingering visual compression

---

## Forbidden Behavior

- random lens shifts
- impossible perspective changes
- inconsistent realism between adjacent shots
- excessive stylization that breaks grounded tone
- fake “cinematic” language without optical logic

---

## Failure Conditions

Lens and realism FAIL if:

- the image feels synthetic rather than photographed
- perspective changes break continuity
- depth of field distracts from the subject
- lighting behaves unrealistically
- different shots feel like different visual worlds

---

## Compression Summary

Lens choice controls perspective.  
Focus controls attention.  
Realism controls believability.
