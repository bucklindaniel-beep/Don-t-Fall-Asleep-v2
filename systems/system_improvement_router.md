# System Improvement Router

## Metadata
- Type: System
- Domain: Logging / Memory / Pattern Promotion / Repository Improvement
- Path: `/systems/system_improvement_router.md`
- Status: active
- Priority: high

---

## Purpose

This system decides what Claude should do with improvement signals discovered during production runs, prompt validation, logging, memory review, user feedback, or output evaluation.

It prevents the repository from becoming noisy by separating:
- issues that should only be logged
- updates that should be routed to memory
- repeated patterns that should be promoted into stable system logic
- problems that require immediate correction before execution continues

This file is a routing layer only.
It does not replace:
- `/logs/execution_log.md`
- `/memory/README.md`
- `/systems/pattern_promotion_system.md`
- `/systems/prompt_validation_logging.md`

---

## Core Principle

Claude must not treat every observation as a system update.

Claude should only recommend or apply repository improvements when the signal is:
- repeated
- validated
- user-confirmed
- clearly harmful if ignored
- clearly reusable across future runs

Routine observations should be logged, not promoted.

---

## Signal Sources

Claude must evaluate improvement signals from:

1. Prompt validation results
   - missing sections
   - vague instructions
   - weak constraints
   - unclear output format
   - poor system alignment

2. Execution logs
   - repeated failures
   - recurring ambiguity
   - stage-level issues
   - roadblocks
   - quality concerns

3. Memory files
   - repeated failures in `/memory/failure_log.md`
   - proven patterns in `/memory/patterns_and_improvements.md`
   - durable lessons in `/memory/project_learnings.md`
   - user preferences in `/memory/style_calibration.md`
   - active state in `/memory/current_state.md`

4. User feedback
   - explicit approval
   - explicit rejection
   - repeated preference
   - correction requests
   - quality concerns

5. Output evaluation
   - repetition
   - weak pacing
   - broken continuity
   - flat escalation
   - poor visual variety
   - narration quality issues
   - formatting failures

---

## Decision Categories

Claude must classify every improvement signal into one of the following categories.

### 1. Ignore

Use when the signal has no future value.

Examples:
- one-off wording issue
- user preference that does not apply beyond the current output
- routine execution note
- already solved issue
- duplicate observation

Action:
- Do not write to memory.
- Do not recommend repository changes.
- If needed, log `No durable memory update required.` in `/logs/execution_log.md`.

---

### 2. Log Only

Use when the signal may be useful for debugging but is not yet durable.

Examples:
- minor prompt ambiguity corrected automatically
- stage completed with a small tradeoff
- possible future improvement not yet validated
- quality concern that appeared once

Action:
- Log in `/logs/execution_log.md`.
- Do not write to memory unless it becomes repeated or user-confirmed.
- Do not promote to system files.

---

### 3. Write to Memory

Use when the signal has reusable value but is not yet a stable system rule.

Examples:
- repeated user preference
- confirmed output weakness
- useful style calibration
- a promising pattern from a successful output
- active run state needed for continuity

Action:
- Route using `/memory/README.md`.
- Use `/templates/memory_log_entry_template.md` when applicable.
- Record concise, reusable intelligence only.

Memory destinations:
- failure → `/memory/failure_log.md`
- active run context → `/memory/current_state.md`
- style preference → `/memory/style_calibration.md`
- reusable pattern or pipeline improvement → `/memory/patterns_and_improvements.md`
- durable project lesson → `/memory/project_learnings.md`

---

### 4. Recommend Promotion

Use when a memory item, failure, or pattern appears stable enough to become repository logic.

Examples:
- same failure appears more than twice
- same prompt weakness appears across stages
- user repeatedly reinforces a preference
- a successful pattern proves reusable across multiple outputs
- a workflow issue creates recurring friction

Action:
- Recommend promotion using `/systems/pattern_promotion_system.md`.
- Identify exact destination file path.
- Explain the change, reason, risk, and expected impact.
- Do not modify unrelated files.

---

### 5. Critical Fix Required

Use when execution should stop or be corrected before continuing.

Examples:
- prompt cannot be safely interpreted
- output format is missing or unusable
- repository instructions conflict
- required source/context is unavailable
- execution would bypass system rules
- failure would cause bad or unusable production output

Action:
- Stop execution only when continuation would cause system failure or poor output.
- Explain the blocker clearly.
- Log the issue in `/logs/execution_log.md`.
- Recommend the minimum required fix.
- Avoid broad redesign.

---

## Promotion Thresholds

Claude should recommend promotion only when one of the following thresholds is met.

### Repeated Failure Threshold

If the same failure appears more than twice:
- route to `/memory/failure_log.md`
- recommend promotion into the relevant system, prompt, framework, or playbook file

### Repeated Prompt Weakness Threshold

If the same prompt issue appears across multiple prompts or stages:
- route to `/memory/patterns_and_improvements.md` or `/memory/failure_log.md`
- recommend update to the relevant prompt template or `/systems/prompt_engineering_layer.md`

### Repeated User Preference Threshold

If the user repeats or reinforces the same preference:
- route to `/memory/style_calibration.md`
- recommend promotion only if it should affect all future generations

### Proven Pattern Threshold

If a successful pattern appears useful across multiple outputs:
- route to `/memory/patterns_and_improvements.md`
- recommend promotion into the relevant `/prompts/`, `/playbooks/`, or `/frameworks/` file

### Critical System Gap Threshold

If a gap blocks execution or causes recurring confusion:
- log in `/logs/execution_log.md`
- recommend immediate update to the relevant `/systems/` file

---

## Destination Rules

Use the following destination map.

### Prompt problem
Route to:
- `/logs/execution_log.md`
- `/memory/failure_log.md` if repeated
- `/systems/prompt_engineering_layer.md` if structural
- relevant `/prompts/` template if stage-specific
- `/systems/prompt_validation_logging.md` if validation logic needs refinement

### Output quality problem
Route to:
- `/logs/execution_log.md`
- `/memory/failure_log.md`
- `/memory/style_calibration.md` if preference-related
- relevant `/frameworks/` file if structural
- relevant `/wordbanks/` file if language-related

### Successful reusable pattern
Route to:
- `/memory/patterns_and_improvements.md`
- `/systems/pattern_promotion_system.md` for promotion review
- relevant `/prompts/`, `/playbooks/`, or `/frameworks/` file after validation

### User preference
Route to:
- `/memory/style_calibration.md`
- relevant `/prompts/` or `/systems/` file only if it should become global behavior

### Current production state
Route to:
- `/memory/current_state.md`

### Broad durable lesson
Route to:
- `/memory/project_learnings.md`
- relevant `/systems/` file only after repeated validation

---

## Execution Flow

After each meaningful pipeline action, Claude must:

1. Review execution result
2. Identify any improvement signals
3. Classify signal using the Decision Categories
4. Route signal to the correct destination
5. Log action taken in `/logs/execution_log.md`
6. Recommend promotion only if thresholds are met
7. Keep user-facing output clean unless action is needed

---

## Required Log Note

When this router is applied, Claude should add a concise note to `/logs/execution_log.md`:

```markdown
### System Improvement Routing
- Signal detected: yes / no
- Signal type:
- Routing decision: ignore / log_only / write_to_memory / recommend_promotion / critical_fix_required
- Destination:
- Reason:
- Promotion recommended: yes / no
```

If no signal is detected:

```markdown
### System Improvement Routing
- Signal detected: no
- Routing decision: ignore
- Reason: No reusable system improvement signal detected.
```

---

## Anti-Patterns

Claude must avoid:
- promoting one-off issues into hard rules
- writing raw chat summaries to memory
- duplicating logic across files
- creating new files when an existing file should be updated
- turning debugging notes into permanent rules too early
- overcorrecting based on a single weak output
- interrupting execution for minor fixable issues

---

## Integration Points

This file should be referenced by:

- `/systems/prompt_validation_logging.md`
- `/systems/pattern_promotion_system.md`
- `/systems/memory_logging_system.md` if present
- `/systems/prompt_engineering_layer.md` if prompt validation produces improvement signals
- `/logs/execution_log.md` as a diagnostic routing note
- `/memory/README.md` as part of memory routing and promotion behavior

---

## Summary

The System Improvement Router controls how Claude reacts to improvement signals.

It ensures the system learns without becoming chaotic.

The correct behavior is:

```text
Observe → Classify → Route → Log → Promote only when justified
```
