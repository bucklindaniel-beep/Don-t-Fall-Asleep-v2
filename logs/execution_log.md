# Execution Log

## Metadata
- Type: Log
- Domain: Pipeline Execution / Debugging / System Behavior
- Path: `/logs/execution_log.md`
- Status: active
- Priority: critical

---

## Purpose

This file records diagnostic execution notes for each pipeline run.

The execution log is used to:
- understand how Claude interpreted repository instructions
- identify weak or conflicting system logic
- surface roadblocks, gaps, and failure points
- separate debug information from clean production outputs
- recommend memory, prompt, framework, or system updates
- record prompt validation results before execution

This file is **not** a memory file.

Do not store long-term lessons here unless they are also routed to the correct `/memory/` file.

Because this file lives in `/logs/`, it may be excluded from Claude’s project ingestion depending on system configuration. Treat it as a local diagnostic artifact, not a source-of-truth system file.

---

## Core Logging Rule

Claude must append one structured execution entry after every meaningful pipeline action or production run.

A meaningful action includes:
- prompt validation
- narrator identity generation
- story generation
- scene breakdown
- shotlist generation
- image prompt generation
- editing script generation
- narration formatting or review
- continuity review
- memory update
- repository update
- smoke test or debug run

---

## Prompt Validation Logging Rule

Before executing a stage-specific prompt, Claude must validate the prompt using:

`/systems/prompt_validation_logging.md`

Claude must log validation results here.

Prompt validation logs should record:
- prompt name
- stage
- structure result
- clarity result
- system alignment result
- constraint result
- output format result
- detected weaknesses
- auto-corrections applied
- critical failures, if any
- recommended system improvements

Prompt validation should not interrupt execution unless a critical failure occurs.

Minor issues should be corrected automatically and logged.

---

## Memory Routing Logging Rule

Claude must evaluate whether memory should be updated after meaningful pipeline actions.

Memory trigger and routing logic belongs in `/memory/README.md` and `/systems/memory_logging_system.md`.

This log should only record:
- whether memory routing was considered
- whether a durable memory update was required
- which memory file was updated, if any
- why no memory update was needed, if applicable

If memory is not updated, Claude must write:

```markdown
No durable memory update required.
```

---

## Output Noise Rule

Debug details belong here, not in the main production output.

Claude should keep user-facing outputs clean and route the following into this log:
- systems applied
- prompt validation results
- memory routing decision
- interpretation decisions
- internal tradeoffs
- ambiguity handling
- rule conflicts
- roadblocks
- quality concerns
- suggested repository improvements

---

## Logging Standards

Each entry must be:
- concise
- structured
- diagnostic
- action-oriented
- tied to exact files when possible

Avoid:
- story summaries longer than needed
- full generated text
- raw prompt dumps
- vague improvement notes
- duplicate memory entries
- unnecessary commentary

---

## Log Entry Template

```markdown
---

## Execution Entry: YYYY-MM-DD HH:MM

### Run Type
- production_run / stage_run / smoke_test / debug_pass / repository_update / memory_update

### User Input Summary
- Brief paraphrase of the user request.

### Stage Executed
- Stage name:
- Status: completed / partial / blocked / skipped
- Reason if partial, blocked, or skipped:

### Prompt Validation
- Prompt name:
- Validation required: yes / no
- Validation status: passed / passed_with_auto_corrections / failed_critical / skipped
- Structure: pass / fail
- Clarity: pass / fail
- System alignment: pass / fail
- Constraints: pass / fail
- Output format: pass / fail
- Detected weaknesses:
  - Weakness:
    - Effect:
    - Suggested fix:
- Auto-corrections applied:
  - Correction:
    - Reason:
- Critical failure triggered: yes / no
- If yes:
  - Failure:
  - Why execution could not continue:
  - Required fix:
- System improvement notes:
  - Recommended file path:
  - Change needed:
  - Priority: required / optional

### Pipeline Progress
- Narrator Identity: not_started / completed / issue
- Story: not_started / completed / issue
- Scene Breakdown: not_started / completed / issue
- Shotlist: not_started / completed / issue
- Image Prompts: not_started / completed / issue
- Editing Script: not_started / completed / issue
- Narration Review Pass: not_started / completed / issue
- Memory Logging: not_started / completed / issue
- Execution Logging: completed

### Systems Applied
- List only systems that directly affected the output.

### Key Decisions
- Decision:
  - Reason:
  - Impact:

### Defaults Used
- Assumption:
  - Why it was safe:
  - Alternative avoided:

### Rule Conflicts or Ambiguities
- Conflict / ambiguity:
  - How it was resolved:
  - File that may need clarification:

### Roadblocks or System Gaps
- Gap:
  - Effect on output:
  - Suggested fix:
  - Recommended file path:

### Failure Detection
- Failure triggered: yes / no
- If yes:
  - Failure:
  - Correction made:
  - Prevention rule needed:
  - Memory destination:

### Quality Assessment
- Overall: high / medium / low
- Pacing:
- Escalation:
- Continuity:
- Visual variety:
- Narration quality:

### Repository Update Recommendations
- File path:
  - Change needed:
  - Reason:
  - Priority: required / optional

### Memory Routing
- Memory evaluated: yes / no
- Memory update required: yes / no

If no:
- No durable memory update required.

If yes:
- Destination:
  - Entry type: current_state / style_calibration / failure / pattern / project_learning
  - Summary:
  - Append or replace:

### Next Action
- Immediate next recommended step.
```

---

## Prompt Validation Result Definitions

### Passed
The prompt meets required structure, clarity, alignment, constraints, and output format standards.

### Passed With Auto-Corrections
The prompt had minor issues that Claude could safely correct without stopping execution.

Examples:
- minor wording ambiguity
- missing but inferable formatting detail
- weak constraint phrasing
- unclear but recoverable stage label

### Failed Critical
The prompt cannot be safely executed without risking poor output or system misalignment.

Examples:
- missing objective
- contradictory instructions
- unclear required output
- request bypasses repository rules
- required source/context is unavailable

### Skipped
Validation was not required because the action was not a production-stage prompt execution.

Examples:
- repository review
- file cleanup
- user planning discussion
- manual documentation update

---

## Required Quality Ratings

Use these definitions consistently.

### High
The output followed repository logic, maintained continuity, avoided major repetition, and did not expose unresolved system gaps.

### Medium
The output was usable, but one or more areas need refinement, clarification, or memory reinforcement.

### Low
The output had structural issues, weak system compliance, broken continuity, poor escalation, or required major correction.

---

## Failure Categories

Use these categories when logging failures:

- continuity_failure
- escalation_failure
- repetition_failure
- prompt_structure_failure
- prompt_validation_failure
- narration_quality_failure
- visual_variety_failure
- formatting_failure
- instruction_conflict
- missing_system_logic
- memory_routing_failure
- repository_update_failure
- api_or_script_failure

---

## Memory Routing Rule

Execution logs may identify lessons, but durable lessons must be routed to memory.

Use:
- `/memory/current_state.md` for active run status and temporary continuity state
- `/memory/style_calibration.md` for stable user preferences
- `/memory/failure_log.md` for mistakes and prevention rules
- `/memory/patterns_and_improvements.md` for reusable output or workflow patterns
- `/memory/project_learnings.md` for durable system-level lessons

If no memory update is needed, write:

```markdown
No durable memory update required.
```

---

## Repository Promotion Rule

If the same issue appears three times in execution logs, Claude must recommend promoting it into the relevant system, prompt, framework, or playbook file.

Promotion targets:
- repeated prompt weakness → `/systems/prompt_validation_logging.md` or relevant `/prompts/` template
- repeated failure → `/memory/failure_log.md` first, then relevant `/systems/` file if recurring
- reusable generation pattern → `/memory/patterns_and_improvements.md`, then relevant `/prompts/` or `/playbooks/`
- structural pipeline issue → relevant `/systems/` file
- story structure issue → relevant `/frameworks/` file
- wording or style preference → `/memory/style_calibration.md` or `/wordbanks/`

---

## Stop Point Rule

When a run stops at a human review point, Claude must log:
- what was completed
- what is waiting for approval
- what the next model/stage should be, if known
- what files may need updates after approval

---

## Completion Rule

A pipeline run is not complete until:
- the requested stage output is complete
- prompt validation has been performed when required
- prompt validation results have been logged
- memory routing has been considered
- repository update recommendations have been listed if needed
- this execution log has a new entry
