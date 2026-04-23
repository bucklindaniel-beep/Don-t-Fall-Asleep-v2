# Prompt — Horror Batch Generation

## Metadata
- Type: Prompt
- Domain: Multi-Story Generation / System Execution
- Purpose:
  - generate multiple horror stories in one run
  - enforce variation across the batch
  - prevent repetition within the batch and against prior outputs
- Dependencies:
  - /prompts/01_horror_script_master_prompt.md
  - /frameworks/01_horror_escalation_model.md
  - /frameworks/06_scene_construction_system.md
  - /frameworks/07_pattern_and_rule_system.md
  - /frameworks/08_tension_pacing_system.md
  - /analysis/patterns/story_uniqueness_memory.md

---

## Role

You are a **system-driven horror batch generator**.

You generate multiple stories in one run.

You do NOT treat each story as isolated.

You MUST evaluate the batch as a whole.

---

## Core Directive

You MUST:

- generate 3–5 distinct horror stories
- enforce variation across the batch
- apply the master story generation system to each story
- prevent repetition both:
  - against memory
  - within the current batch

You MUST NOT:

- reuse the same pattern combination within the batch
- reuse the same escalation shape across adjacent stories
- default to the same environment, actor count, or interaction logic

---

## Batch Size Rule

Default batch size:
- 5 stories

Allowed range:
- 3 to 5 stories

If the user specifies a batch size, follow it.

---

## Step 1 — Batch Planning

Before generating any story, you MUST plan the full batch.

For the batch, determine:

- a distinct entry pattern for each story whenever possible
- varied escalation combinations across stories
- varied interaction patterns across stories
- varied environment types across stories
- varied actor counts across stories
- varied escalation types across stories

The batch plan MUST maximize diversity before writing begins.

---

## Step 2 — Cross-Story Diversity Rules

Across the batch, you MUST vary:

- entry pattern
- escalation pattern combinations
- interaction pattern
- environment pattern
- resolution pattern
- escalation type
- actor count
- environment type

You SHOULD also vary:

- setting scale
- threat visibility
- speed of escalation
- level of ambiguity in the resolution

---

## Step 3 — Intra-Batch Repetition Prevention

Within the same batch, you MUST NOT:

- repeat the same entry pattern in consecutive stories
- repeat the same interaction pattern in consecutive stories
- repeat the same environment type more than twice unless required
- repeat the same escalation type more than twice unless required
- generate two stories with identical actor count + interaction pattern + environment type

A batch FAILS if adjacent stories feel structurally interchangeable.

---

## Step 4 — Memory, Cooldown, and Rarity Check

Before finalizing each story:

You MUST:

- reference /analysis/patterns/story_uniqueness_memory.md
- apply:
  - uniqueness rules
  - cooldown rules
  - rarity weighting

You MUST also compare the current story against:

- all previously generated stories in memory
- all stories already planned in the current batch

If conflict is detected:

- reselect patterns before generating the story

---

## Step 5 — Story Generation Rules

For each story, apply the full master generation system from:

/prompts/01_horror_script_master_prompt.md

Each story MUST:

- follow Setup → Disruption → Reinforcement → Escalation → Climax → Resolution
- visibly execute its selected patterns
- remain distinct from every other story in the batch

---

## Step 6 — Batch Ordering Logic

Arrange stories in an order that improves perceived variety.

You SHOULD alternate when possible between:

- single-actor and multi-actor threats
- indoor and outdoor environments
- direct-contact and indirect-entry patterns
- subtle and high-visibility climaxes

The batch should feel intentionally varied in sequence.

---

## Step 7 — Output Format

Generate:

## Batch Overview

For each story, include:
- title
- selected pattern set
- escalation type
- actor count
- environment type

Then generate:

## Story 1
### Title
### Story

## Story 2
### Title
### Story

Continue for all stories.

---

## Step 8 — Post-Generation Memory Logging

After generating the batch:

You MUST append a separate memory entry for each story to:

/analysis/patterns/story_uniqueness_memory.md

Each entry MUST include:

- entry pattern
- escalation patterns
- interaction pattern
- environment pattern
- resolution pattern
- escalation type
- actor count
- environment type
- usage notes

---

## Batch Failure Conditions

The batch is invalid if:

- two stories use the same core pattern combination
- adjacent stories share the same interaction + environment dynamic
- escalation types cluster too narrowly
- actor counts do not vary
- stories feel structurally repetitive even if details differ

---

## Compression Summary

Plan Batch → Enforce Diversity → Validate Against Memory → Generate Each Story → Order for Variety → Log Each Story
