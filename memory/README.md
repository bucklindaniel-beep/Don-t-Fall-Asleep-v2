# Memory System

This folder stores persistent project knowledge for the horror production pipeline.

Claude must treat these files as the project's long-term operating memory.

## Rules

- Do not treat conversations as isolated.
- Reuse relevant learnings from these files before generating new output.
- Update memory after meaningful outputs, revisions, or failures.
- Prefer concise, reusable patterns over long conversational summaries.
- Promote repeated successful patterns into stable rules.
- Log failures with cause and correction.
- Use `/systems/memory_logging_system.md` to classify and route memory updates.
- Do not log raw chat summaries.
- Memory entries must become reusable project intelligence.
- Promote repeated memory lessons into systems, prompts, playbooks, or frameworks when they become stable hard rules.

## File Roles

- `current_state.md`  
  Active working context for the current story, run, or production thread.

- `project_learnings.md`  
  High-level durable learnings that improve the project over time.

- `patterns_and_improvements.md`  
  Reusable output patterns, successful structures, and pipeline improvements.

- `style_calibration.md`  
  Voice, tone, pacing, and formatting preferences.

- `failure_log.md`  
  Repeated mistakes, output failures, and corrective rules.

## Update Standard

When updating memory:
1. Keep entries structured.
2. Prefer reusable rules over raw summaries.
3. Remove redundancy when possible.
4. Preserve only useful project intelligence.
5. Classify each update before writing it.
6. Route each update to the correct memory file.
7. Use `/templates/memory_log_entry_template.md` for append formatting.

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
- prompt validation, if issues are detected
- failure detection
- user feedback or revision requests

---

### Write to Memory ONLY IF one of the following is true:

1. A FAILURE occurred
   - output quality issue
   - system misalignment
   - repetition or weak generation
   - broken continuity
   - route to `failure_log.md`

2. A PATTERN is observed
   - successful structure
   - effective pacing
   - strong narrative or visual technique
   - route to `patterns_and_improvements.md`

3. A USER PREFERENCE is identified
   - tone, pacing, style, formatting
   - route to `style_calibration.md`

4. A DURABLE SYSTEM LESSON is identified
   - improves system behavior globally
   - route to `project_learnings.md`

5. ACTIVE RUN STATE needs to persist
   - ongoing story continuity
   - stage tracking
   - route to `current_state.md`

---

### Do NOT write to memory when:

- no new insight is present
- output is routine and expected
- information already exists in memory
- the update would be redundant
- the insight is not reusable

---

### Logging Requirement

If memory is NOT updated, Claude must explicitly log the following in `/logs/execution_log.md`:

`No durable memory update required.`

---

## Memory Routing Rule

Claude must classify every memory-worthy update before writing it.

Use the following routing rules:

### current_state.md
Use for temporary active-run context.

Write here when the update affects:
- current story/run status
- current stage
- next required action
- active constraints
- continuity anchors
- active visual or narration state

Do NOT store durable system lessons here.

---

### project_learnings.md
Use for durable project-level lessons.

Write here when the update:
- applies across many future generations
- improves the project globally
- defines a reusable rule
- affects workflow, continuity, retention, escalation, editing, or generation quality at a high level

Do NOT store one-off run details here.

---

### patterns_and_improvements.md
Use for reusable successful patterns and pipeline improvements.

Write here when the update captures:
- a proven output pattern
- a successful story, scene, shot, narration, or image prompt structure
- a repeatable pipeline improvement
- a validated improvement from testing or review

Do NOT store untested ideas here unless clearly labeled as provisional.

---

### style_calibration.md
Use for user preference and creative style calibration.

Write here when the update affects:
- voice
- tone
- pacing
- sentence rhythm
- narration feel
- formatting preferences
- image prompt style
- editing script style
- known dislikes or preferred behaviors

Do NOT store broad system architecture changes here.

---

### failure_log.md
Use for mistakes, weak outputs, and prevention rules.

Write here when the update records:
- a failed output behavior
- repeated weakness
- cause of failure
- correction applied
- prevention rule
- issue that should not happen again

If the same failure repeats more than twice, promote the prevention rule into the relevant `/systems/`, `/prompts/`, `/frameworks/`, or `/playbooks/` file.

---

## Routing Priority

When an update could fit multiple files, use this priority:

1. failure_log.md — if the update is about something going wrong
2. current_state.md — if it only affects the current active run
3. style_calibration.md — if it reflects user preference or desired style
4. patterns_and_improvements.md — if it is a reusable proven pattern or improvement
5. project_learnings.md — if it is a broad durable project lesson

If no durable future value exists, do not write to memory.

## Priority

When relevant, memory files override default habits and generic generation behavior.
