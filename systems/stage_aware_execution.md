# Stage-Aware Execution System

## Metadata
- Type: System
- Domain: Pipeline Execution / Stage Awareness / Model Routing
- Path: `/systems/stage_aware_execution.md`
- Status: active
- Priority: critical

---

## Purpose

This file activates stage-aware execution without duplicating the full stage map.

Use it to ensure Claude always knows:
- current stage
- required input
- required output
- stop condition
- recommended next model
- next user action

Detailed stage rules remain in:

`/systems/stage_execution_map.md`

---

## Source of Truth

Claude must treat `/systems/stage_execution_map.md` as the authoritative source for:
- pipeline order
- stage inputs
- stage outputs
- validation checks
- stop rules
- Opus / Sonnet recommendations

This file only defines how to apply that map during execution.

Do not duplicate stage definitions here.
Do not create competing stage orders.
Do not override `/systems/stage_execution_map.md`.

---

## Required Execution Behavior

Before starting any production task, Claude must identify:

```text
Current Stage:
Previous Stage Output Available:
Required Input Present:
Recommended Model:
Stop Rule:
```

Claude should do this internally.

Do not print this block unless the user asks for debugging or stage validation.

---

## Stage Selection Rule

If the user requests a full pipeline run, begin at the earliest required stage and follow:

`/systems/stage_execution_map.md`

If the user requests a specific stage, execute only that stage if required upstream inputs are available or safely inferable.

If the user provides a seed only, start with seed intake and proceed according to the map.

If the user provides an approved output from a prior stage, continue from the next stage.

---

## Stop-Point Rule

Claude must stop only when the stage map requires it.

Valid stop reasons:
- user approval is required
- API generation would be triggered next
- voice generation would be triggered next
- model switch would materially improve quality
- critical context is missing and cannot be inferred
- validation finds a production-risk issue
- repository files would be modified

Claude must not stop merely to explain progress.
Claude must not ask preference questions when safe defaults are available.

---

## Model Recommendation Rule

Model recommendations are advisory only.

Use `/systems/stage_execution_map.md` for the specific model recommendation.

General routing:
- Opus: high-creativity, story quality, narrator identity, deep continuity review, architecture changes
- Sonnet: formatting, scene structuring, shotlists, image prompt packaging, narration formatting, logging, cleanup

Recommend model switches only at meaningful boundaries.
Do not recommend a model switch after every stage.

---

## Output Cleanliness Rule

User-facing output must follow:

`/systems/output_cleanliness_rules.md`

Do not include:
- internal stage diagnosis
- systems-applied lists
- repeated validation notes
- execution logs
- long explanations of repository logic

Use one short next-action line when helpful.

---

## Required End-of-Stage Footer

When a stage completes and a next step is needed, append only this compact footer:

```markdown
## Next Action
Next stage: [stage name]
Recommended model: [Opus/Sonnet]
Action: [approve / continue / switch model / run script / review issue]
```

Omit the footer if the user asked for a file-only output, a repository patch, or a debug scan.

---

## Logging Boundary

Execution details belong in:

`/logs/execution_log.md`

Memory routing follows:

`/systems/memory_logging_system.md`

Repository update recommendations follow:

`/systems/system_improvement_router.md`

Do not place diagnostic logs in user-facing stage outputs.

---

## Integration References

This file depends on:
- `/systems/stage_execution_map.md`
- `/systems/output_cleanliness_rules.md`
- `/systems/autonomy_rules.md`
- `/systems/prompt_engineering_layer.md`
- `/systems/prompt_validation_logging.md`
- `/systems/memory_logging_system.md`
- `/systems/system_improvement_router.md`

---

## Summary

This system makes execution stage-aware while preserving a single source of truth.

Use this file for behavior.
Use `/systems/stage_execution_map.md` for stage details.

---

## Checkpoint Control Addendum

Use `/systems/stage_checkpoints.md` when a controlled user decision would materially improve quality, cost control, source selection, duplicate handling, model routing, or output approval.

Do not use checkpoints for low-value preference questions.
Do not stop at every stage.
If the user already provided enough direction, proceed using the relevant default.

This addendum depends on:
- `/systems/stage_checkpoints.md`
