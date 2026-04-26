# Stage Execution Map

## Metadata
- Type: System
- Domain: Pipeline Execution / Stage Control / Model Guidance
- Status: active
- Priority: critical

---

## Purpose
Define production stage order, required outputs, stop points, and model recommendations.

This file controls execution flow only.
Creative standards belong in prompts, frameworks, playbooks, wordbanks, and memory.

---

## Core Rules

- Follow stages in order unless the user requests a specific stage.
- Do not skip upstream context unless it can be safely inferred.
- Use reasonable defaults instead of asking low-value clarification questions.
- Stop only for user approval, recommended model boundaries, critical validation failures, or missing required context.
- Keep stage completion output short.

---

## Standard Pipeline

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

## Stage 1 — User Seed Intake

**Purpose:** Convert idea into usable production seed.

**Outputs:** interpreted premise, genre direction, default constraints, seed status.

**Validation:** seed must be executable without major ambiguity.

**Stop:** continue unless clarification is truly required.

**Model:** Sonnet normally; Opus for abstract or complex seeds.

---

## Stage 2 — Narrator Identity Generation

**Purpose:** Create a narrator who supports the premise and spoken delivery.

**Outputs:** identity, perspective, personal context, credibility anchors, emotional baseline, voice behavior.

**Validation:** narrator must be relatable, behavior-grounded, and useful downstream.

**Stop:** stop if identity conflicts with seed/user intent.

**Model:** Opus preferred.

---

## Stage 3 — Story Generation

**Purpose:** Generate the main horror narration.

**Required Systems:**
- `/frameworks/writing_quality_rules.md`
- `/frameworks/10_organic_hook_system.md`
- `/frameworks/11_organic_story_beat_system.md`
- `/frameworks/12_pattern_composition_engine.md`
- `/frameworks/13_pattern_scoring_framework.md`
- `/frameworks/14_emotional_targeting_system.md`

**Outputs:** complete story, organic hook, controlled beat flow, grounded escalation, suitable spoken narration.

**Validation:** no source imitation, no unsupported escalation jumps, no repetitive narrator patterns, no rigid beat template.

**Stop:** stop for story review unless user requests full pass.

**Model:** Opus strongly preferred.

---

## Stage 4 — Scene Breakdown

**Purpose:** Convert story into production scenes.

**Outputs:** scene purpose, location, character state, escalation level, continuity anchors, optional emotional residue.

**Validation:** each scene must advance clarity, tension, proximity, consequence, or setup/payoff.

**Stop:** usually continue; stop if scene logic fails.

**Model:** Sonnet preferred.

---

## Stage 5 — Shotlist Generation

**Purpose:** Convert scenes into renderable visual shots.

**Outputs:** shot references, framing, subject, action, lighting, continuity notes, escalation notes.

**Validation:** every shot must be visual, renderable, and non-duplicative.

**Stop:** continue unless visual continuity is unclear.

**Model:** Sonnet preferred.

---

## Stage 6 — Image Prompt Generation

**Purpose:** Convert shotlist into image-generation prompts.

**Outputs:** one prompt per shot, locked continuity, concise emotional target where useful, negative constraints only where needed.

**Validation:** prompts must be concrete, photorealistic, continuity-safe, and API-ready.

**Stop:** stop before paid image generation if user approval is needed.

**Model:** Sonnet preferred.

---

## Stage 7 — Editing Script Generation

**Purpose:** Convert shots and narration into edit timing, pacing, transitions, and sound design.

**Outputs:** sequence edit notes, narration alignment, pacing, sound, transitions.

**Validation:** narration drives timing; sound choices support story resolution; no cliché horror cues unless intended.

**Stop:** continue unless timing conflicts with shotlist/narration.

**Model:** Sonnet preferred.

---

## Stage 8 — Narration Formatting

**Purpose:** Prepare narration for voice generation.

**Outputs:** clean narration text, delivery notes, pause markers, voice progression review.

**Validation:** spoken delivery, rhythm variation, no procedural over-reporting, no excessive em dashes or repeated rhetorical frames.

**Stop:** stop if narration requires user approval before audio generation.

**Model:** Sonnet preferred; Opus for final creative polish.

---

## Stage 9 — Continuity Review

**Purpose:** Validate the full production package.

**Outputs:** continuity audit, performance-risk notes, blocking issues, optional improvements.

**Validation Layers:** character, environment, object, lighting, escalation, camera, narration-to-visual alignment, hook/retention risk, pattern predictability.

**Stop:** stop after review.

**Model:** Opus preferred.

---

## Stage 10 — Memory Routing

**Purpose:** Route only durable learnings to memory.

**Outputs:** classified memory items and append-ready updates if direct file write is unavailable.

**Validation:** patterns must be scored before durable promotion; do not treat all patterns equally.

**Stop:** continue unless user wants to apply memory manually.

**Model:** Sonnet preferred.

---

## Stage 11 — Execution Logging

**Purpose:** Record run decisions, corrections, and high-impact learning opportunities.

**Outputs:** run summary, decisions, corrections, performance reflection, repository update signals.

**Validation:** log what happened and what should improve; do not default to “no updates required” if durable gaps exist.

**Stop:** continue to repository recommendations if gaps were found.

**Model:** Sonnet preferred.

---

## Stage 12 — Repository Update Recommendations

**Purpose:** Identify repository updates needed after the run.

**Outputs:** exact file path, change type, reason, expected impact, risk/tradeoff.

**Validation:** recommend minimal changes only; avoid broad redesign.

**Stop:** always stop after recommendations.

**Model:** Sonnet for simple cleanup; Opus for architecture conflicts.

---

## Model Strategy

Use Opus for:
- story generation
- narrator nuance
- final polish
- continuity/performance judgment
- architecture conflict resolution

Use Sonnet for:
- scene breakdown
- shotlist
- image prompts
- editing script
- narration formatting
- memory/logging
- repository cleanup

Do not stop after every minor step only to recommend a model switch. Stop at meaningful model boundaries.

---

## Completion Block

At stop points, output only:

```text
Stage X complete.
Next stage: [stage]
Recommended model: [model]
Your next action: [instruction]
```

---

## Logging Discipline

Memory routing and execution logging are required at terminal stages or when durable learning occurs.
They should not create verbose bloat after every intermediate stage.

---

## Transcript Processing Validation Mode

Use this mode when the user explicitly asks to process transcripts, validate batch intake, test duplicate detection, or run transcript intelligence only.

This mode is separate from the standard production pipeline.
Do not continue into story generation unless the user explicitly approves a production smoke test.

**Order:**

1. Transcript intake setup
2. Duplicate check
3. Raw to cleaned
4. Cleaned to structured
5. Structured to distilled
6. Distilled to indexed
7. Output approval
8. Execution logging

**Required Systems:**
- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_stage_executor.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_duplicate_detection.md`
- `/systems/stage_checkpoints.md`
- `/memory/transcript_processing_log.md`

**Stop:** stop after indexed outputs and logging.

**Model:** Sonnet normally; Opus only for nuanced narration-pattern extraction or architecture conflicts.
