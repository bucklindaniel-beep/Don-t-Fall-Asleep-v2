# prompt_validation_logging.md

## Metadata
- Type: System
- Domain: Prompt Validation / Execution Logging / Debugging
- Path: `/systems/prompt_validation_logging.md`
- Status: active
- Priority: high

---

## Purpose

This system defines a lightweight prompt validation pass before Claude executes a stage prompt.

It exists to protect reliability without adding unnecessary token cost.

This file extends:
- `/systems/prompt_engineering_layer.md`
- `/systems/stage_execution_map.md`
- Claude Project Instructions
- `/systems/output_cleanliness_rules.md`
- `/logs/execution_log.md`

---

## Core Principle

Prompt validation must be brief, internal, and diagnostic.

Claude must:
- validate the active prompt before execution
- auto-correct minor issues when safe
- continue unless a critical failure exists
- log only useful validation outcomes
- keep validation notes out of clean user-facing outputs

Claude must not:
- ask unnecessary clarification questions
- expose validation commentary during normal production
- duplicate full prompts in the execution log
- repeat system rules in the execution log
- over-constrain creative output

---

## Validation Checks

Before executing a stage prompt, Claude must internally check:

1. **Structure** — role, objective, context, constraints, and output format are clear enough to execute.
2. **Clarity** — the task and stage are identifiable without unnecessary clarification.
3. **System Alignment** — the prompt does not bypass repository rules or transcript safeguards.
4. **Constraints** — constraints are enforceable and non-contradictory.
5. **Output Format** — the output can be used by the next stage.

Claude does not need to write out each category unless validation fails or the user is debugging.

---

## Validation Status

Use one status:

- `pass` — ready to execute.
- `corrected` — minor issue corrected using repository defaults.
- `critical_failure` — execution must stop because the issue cannot be safely resolved.

---

## Auto-Correction Rules

Claude may silently correct:
- missing standard section labels
- minor formatting gaps
- vague style language that maps to existing systems
- missing stage defaults that are defined in the repository
- output section labels that can be normalized safely

Claude must not silently change:
- the creative premise
- the intended pipeline stage
- approved continuity
- repository rules
- file contents
- API or batch-generation approval status

---

## Critical Failure Rules

Stop only when:
- required source material is missing
- output format conflicts with the next stage
- user instructions conflict with repository rules
- the request asks Claude to copy or imitate source material
- ambiguity would materially change the output
- API/file actions are requested without required approval

When stopping, explain the issue briefly and ask only for the missing required input or approval.

---

## Logging Structure

Prompt validation must be logged concisely in `/logs/execution_log.md`.

Use this format:

```markdown
### Prompt Validation
- Stage:
- Status: pass / corrected / critical_failure
- Correction made:
- Risk:
```

Only include category-level detail when validation fails or when the user is debugging.

Do not log:
- the full prompt
- full generated output
- long reasoning chains
- repeated system rules
- obvious checks that add no debugging value

---

## User-Facing Output Rule

Prompt validation should remain invisible to user-facing production output unless:
- a critical failure stops execution
- the user asks for validation details
- the task is a debug pass or system review
- a repository update recommendation is required before the next step

---

## Summary

Prompt validation protects quality while staying lightweight.

Its job is to catch critical issues, correct minor ones, and leave a concise debug trail without increasing normal production verbosity.
