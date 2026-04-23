# System — Environment Baseline Lock

## Purpose

Defines and enforces consistent environment identity across all shots.

Prevents:

- room layout drift
- object position inconsistency
- architectural changes between prompts
- loss of spatial continuity across a sequence

---

## Core Principle

An environment MUST be treated as a fixed spatial system.

The baseline environment is defined once and reused consistently.

It is:

- established clearly
- reused exactly
- changed only through explicit, observable progression

---

## Baseline Definition

Each environment MUST be defined using a baseline environment block.

This baseline MUST include:

- location type
- room or area layout
- doors and windows
- major furniture
- fixed objects
- light sources
- notable architectural features

Example:

small one-bedroom apartment bedroom, bed against wall, nightstand on left side, narrow hallway leading to living room, single window above radiator, warm bedside lamp on nightstand, wooden floor, pale walls

---

## Environment Persistence

Once defined:

- the layout MUST be reused exactly across prompts
- major spatial relationships MUST remain consistent
- wording SHOULD remain stable across shots

---

## Immutable Baseline Elements

The following MUST NOT change unless explicitly required by the story:

- room layout
- architectural structure
- door and window placement
- major furniture placement
- fixed lighting source positions

---

## Mutable Environment Elements

The following MAY change if explicitly described:

- object displacement
- clutter
- environmental damage
- lighting intensity
- door position (open / closed / partially open)
- curtains, shadows, or atmospheric details

These changes MUST:

- be observable
- be incremental unless at climax
- be tied to escalation or action

---

## Prompt Integration

Each prompt MUST:

- explicitly reference the same baseline environment
- reuse the baseline environment description
- separate stable layout from evolving changes

Example:

same bedroom layout, same bed placement, same window position, same bedside lamp source

---

## Continuity Rule

Environment continuity MUST be treated as:

IMMUTABLE BASELINE + CONTROLLED STATE CHANGES

---

## Spatial Consistency Rule

Spatial relationships MUST remain readable across prompts.

The following MUST remain stable:

- distance between major furniture
- doorway positions
- window positions
- subject relation to the room

Prompts MUST NOT imply a new room unless the story actually changes location.

---

## Allowed Change Categories

Environment changes may occur through:

- object movement
- clutter accumulation
- damage progression
- shadow growth
- atmosphere thickening
- light intensity changes

These MUST be described separately from the baseline.

---

## Disallowed Changes

The following MUST NOT occur without explicit narrative cause:

- room resizing
- furniture relocation without explanation
- added or removed windows/doors
- different architectural layout
- inconsistent light source origin

---

## Failure Conditions

Environment continuity FAILS if:

- room layout changes between shots
- architecture drifts
- furniture appears in new positions without cause
- environment baseline description varies too much
- the setting feels like a different location

---

## Compression Summary

Define Once → Reuse Layout → Change State Gradually
