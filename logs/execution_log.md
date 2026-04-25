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

## Output Noise Rule

Debug details belong here, not in the main production output.

Claude should keep user-facing outputs clean and route the following into this log:
- systems applied
- prompt validation results
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

  ---

## Memory Trigger Rules

Claude must NOT write to memory on every run.

Memory updates should only occur when meaningful signal is detected.

Claude must evaluate memory updates after:

- story generation
- scene generation
- shotlist generation
- image prompt generation
- editing script generation
- narration formatting
- continuity review
- prompt validation (if issues are detected)
- failure detection
- user feedback or revision requests

---

### Write to Memory ONLY IF one of the following is true:

1. A FAILURE occurred
   - output quality issue
   - system misalignment
   - repetition or weak generation
   - broken continuity
   → route to `failure_log.md`

2. A PATTERN is observed
   - successful structure
   - effective pacing
   - strong narrative or visual technique
   → route to `patterns_and_improvements.md`

3. A USER PREFERENCE is identified
   - tone, pacing, style, formatting
   → route to `style_calibration.md`

4. A DURABLE SYSTEM LESSON is identified
   - improves system behavior globally
   → route to `project_learnings.md`

5. ACTIVE RUN STATE needs to persist
   - ongoing story continuity
   - stage tracking
   → route to `current_state.md`

---

### Do NOT write to memory when:

- no new insight is present
- output is routine and expected
- information already exists in memory
- the update would be redundant
- the insight is not reusable

---

### Logging Requirement

If memory is NOT updated, Claude must explicitly log:

```markdown
No durable memory update required.

### Memory Routing
- No durable memory update required.

OR

- Destination:
  - Entry type: current_state / style_calibration / failure / pattern / project_learning
  - Summary:
  - Append or replace:

### Next Action
- Immediate next recommended step.