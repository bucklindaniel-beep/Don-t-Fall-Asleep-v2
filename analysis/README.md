# Analysis Layer — Continuity & Structure Rules

## Purpose
This file defines structural and content consistency rules for all files within the /analysis/ directory.

---

## Core Principle

All analysis-layer files must remain:

- modular
- non-redundant
- system-compatible
- behavior-driven (not lore-driven)

---

## Folder Structure Integrity

The following structure must be preserved:

/analysis/
  /entity_inspiration/
  /entities/
  /techniques/
  /patterns/
  /style_profiles/
  /channel_profiles/

New folders should only be added if they represent a **distinct, non-overlapping system function**.

---

## Entity System Continuity

All entity files must follow the standardized template:

- Metadata
- Core Concept
- Behavior Class
- Interaction Mode
- Presence Channel
- Perceptual Reliability
- Escalation Driver
- Boundary Relationship
- Flavor
- Perceived Nature
- Behavior Patterns
- Implied Rules
- Pattern Hooks
- Escalation Profile
- Psychological Effect
- Environmental Impact
- Best Use Cases
- Avoid
- Example Usage
- Compression Summary

Do not remove or reorder sections without system-wide updates.

---

## Behavior-First Rule

Entities must be defined by:

- behavior
- interaction
- escalation

NOT:
- lore
- backstory
- visual design alone

---

## Inspiration Layer Rule

Files in `/entity_inspiration/` define:

- patterns
- fear mechanics
- behavioral structures

They must NOT:
- define specific entities
- reference intellectual property directly
- become narrative descriptions

---

## Entity Layer Rule

Files in `/entities/` must:

- derive from one or more inspiration files
- remain distinct from each other
- avoid overlap in core function

Each entity should represent a **clear, reusable role**.

---

## Redundancy Prevention

Before adding a new entity:

- check if behavior already exists
- check if variation can be handled via:
  - flavor
  - escalation
  - interaction mode

Avoid creating duplicates with minor differences.

---

## Naming Consistency

Entity files must follow:

entity_[descriptor].md

Examples:
- entity_shadow_mimic.md
- entity_unseen_follower.md

Use:
- functional names (behavior-driven)
NOT:
- vague or purely aesthetic names

---

## Expansion Rules

When expanding the system:

1. Add to inspiration layer FIRST (if needed)
2. Then derive entities
3. Then update selection logic (if necessary)

Do NOT:
- create entities without inspiration backing
- modify selection logic without testing entities

---

## System Alignment

All analysis-layer content must remain compatible with:

- /frameworks/
- /playbooks/
- /prompts/
- /systems/

No file should introduce logic that conflicts with those layers.

---

## Compression Summary

Analysis Layer = structured knowledge → drives entities → supports generation system
