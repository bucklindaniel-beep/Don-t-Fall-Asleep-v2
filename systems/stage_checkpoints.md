# Stage Checkpoints

## Metadata
- Type: System
- Domain: Execution Control / User Checkpoints / Model Routing
- Path: `/systems/stage_checkpoints.md`
- Status: active
- Priority: high

---

## Purpose

This file defines lightweight checkpoint prompts for controlled testing and transcript processing runs.

Use this file when a run needs user confirmation before:
- adding or changing source material
- including pre-indexed transcript knowledge
- switching model by stage
- writing indexed outputs
- resolving duplicates or near-duplicates

Do not use checkpoints to ask low-value preference questions.
Do not stop at every stage.
Only stop when the checkpoint materially improves quality, cost control, or debugging.

---

## Checkpoint Rules

- Keep checkpoint messages short.
- Present clear options.
- Recommend a default.
- Include the recommended model only when a switch matters.
- Do not expose internal reasoning.
- Do not merge stages while waiting for user input.
- If the user already gave an instruction that answers the checkpoint, proceed with that instruction.

---

## Checkpoint — Transcript Intake Setup

Use before batch transcript processing begins.

```markdown
## CHECKPOINT — Transcript Intake Setup

Choose source scope:

1. Use only new transcripts from this run
2. Include pre-indexed transcript knowledge
3. Compare new transcripts against existing indexed patterns
4. Add additional source URLs before processing

Default: 1 for clean validation runs; 3 for regression/comparison runs.
Recommended model: Sonnet
Action: confirm source scope or provide additional URLs/files.
```

---

## Checkpoint — Pattern Extraction Scope

Use after raw inputs are confirmed and before extraction begins.

```markdown
## CHECKPOINT — Pattern Extraction Scope

Choose extraction scope:

1. Structure + pacing mechanics only
2. Include narration delivery mechanics
3. Include packaging signals from titles/thumbnails
4. Strict transcript mechanics only

Default: 2 for the next validation run.
Recommended model: Sonnet for batch mechanics; Opus for nuanced narration/pacing analysis.
Action: confirm extraction scope.
```

---

## Checkpoint — Duplicate Handling

Use when duplicate or near-duplicate material is detected.

```markdown
## CHECKPOINT — Duplicate Handling

Duplicate or near-duplicate source detected.

Choose handling:

1. Skip duplicate
2. Merge useful new deltas into existing indexed pattern
3. Flag for review only
4. Compare only, do not save

Default: skip exact duplicates; merge useful non-duplicate deltas.
Recommended model: Sonnet
Action: approve duplicate handling.
```

---

## Checkpoint — Output Approval

Use before writing distilled or indexed outputs when running a validation pass.

```markdown
## CHECKPOINT — Output Approval

Transcript processing output is ready for review.

Choose:

1. Review summary only
2. Approve writing files
3. Revise extraction rules
4. Discard run

Default: review summary first during validation; approve writing after user confirmation.
Recommended model: Sonnet
Action: choose output handling.
```

---

## Checkpoint — Full Pipeline Gate

Use after transcript validation and before any full story-to-production smoke test.

```markdown
## CHECKPOINT — Full Pipeline Gate

Transcript validation is complete.

Choose next run type:

1. Small single-seed smoke test
2. Full production pipeline test
3. More transcript ingestion first
4. Stop and review repository updates

Default: 1 after a clean transcript validation run.
Recommended model: Opus for story generation stages; Sonnet for packaging stages.
Action: choose next run type.
```

---

## Summary

This file adds controlled pause points without turning the system into a question-heavy workflow.

Use checkpoints to protect quality, cost, and debugging clarity.
