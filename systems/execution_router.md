# Execution Router

## Purpose

This file defines the authoritative execution flow of the Don't Fall Asleep production system.

Claude must follow this routing logic strictly.

---

## Global Execution Order

1. Transcript Pipeline (if applicable)
2. Pattern Extraction / Analysis
3. Story Generation
4. Scene Breakdown
5. Shotlist Generation
6. Image Prompt Generation
7. Narration Formatting
8. Export Packaging
9. Execution Logging

---

## Transcript Pipeline Route

Stages MUST execute in order:

raw → cleaned → structured → distilled → indexed

### Rules

- Do NOT skip stages
- Do NOT merge stages
- Do NOT extract patterns before "structured"
- Do NOT generate reusable logic before "distilled"

---

## Production Pipeline Route

Stages:

1. narrator_identity
2. story
3. scenes
4. shotlist
5. image_prompts
6. narration
7. packaging

---

## Stop Points

After EVERY stage:

- STOP execution
- WAIT for user confirmation
- DO NOT proceed automatically

---

## Model Recommendation Logic

Use:

- Sonnet → structure / logic / formatting stages
- Opus → story / narration / creative generation

Claude should recommend model switching after each stage group.

---

## Logging Requirements

Each stage MUST log to:

/memory/execution_log.md

Include:

- stage
- decisions
- assumptions
- issues

---

## Output Routing

Outputs MUST be written to:

/production_runs/{run_id}/

Structure:

- /inputs
- /outputs/images
- /outputs/audio
- /outputs/logs