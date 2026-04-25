# prompt_validation_logging.md

## Metadata
- Type: System
- Domain: Prompt Validation / Execution Logging / Debugging
- Path: `/systems/prompt_validation_logging.md`
- Status: active
- Priority: high

---

## Purpose

This system defines how Claude validates stage prompts before execution and logs the validation result for debugging and system improvement.

It exists to make prompt behavior visible without interrupting the production pipeline.

This file does not replace:
- `/systems/prompt_engineering_layer.md`
- `/systems/execution_stages.md`
- `/systems/autonomy_rules.md`
- `/logs/execution_log.md`

It extends those files by defining what Claude should check before running a prompt and what should be recorded after validation.

---

## Core Principle

Prompt validation should improve reliability without slowing execution.

Claude must:
- validate prompts before execution
- auto-correct minor issues when safe
- log weaknesses for later improvement
- continue execution unless a critical failure is detected
- keep validation notes out of clean production output

Claude must not:
- ask unnecessary clarification questions
- expose long validation commentary in the user-facing output
- redesign the prompt during execution
- duplicate full prompt text in the execution log
- reduce creative output quality by over-constraining the prompt

---

## When This System Runs

Claude must run prompt validation before executing any stage-specific prompt, including:

- story generation
- scene generation
- shotlist generation
- image prompt generation
- editing script generation
- narration formatting
- continuity review
- narration review
- prompt batch export

Prompt validation happens before the stage output is generated.

Validation logging happens after the validation pass and may be included inside the related execution log entry.

---

## Validation Process

Claude must perform five checks before execution.

### 1. Structure Check

Confirm the prompt follows the required structure from `/systems/prompt_engineering_layer.md`.

Required sections:
- Role
- Objective
- Context
- System Application
- Constraints
- Output Format

Optional section:
- Execution Notes

Pass criteria:
- all required sections are present
- each section has stage-relevant content
- the prompt is not a loose instruction block

Minor failure examples:
- section label wording differs but meaning is clear
- Execution Notes are missing when not needed
- one section is brief but usable

Critical failure examples:
- no objective is defined
- output format is missing
- prompt cannot be tied to a pipeline stage

---

### 2. Clarity Check

Confirm the prompt is specific enough to execute without unnecessary user clarification.

Pass criteria:
- task is clear
- stage output is clear
- important inputs are identified
- ambiguous wording can be resolved using repository defaults

Flag vague phrases such as:
- make it better
- improve this
- make it cinematic
- use the system
- do the next step

These are acceptable only when surrounding context or repository rules make the meaning clear.

Minor failure examples:
- vague style wording can be resolved through existing frameworks
- scene count is unspecified but can be inferred
- tone is unspecified but implied by the story seed

Critical failure examples:
- multiple possible outputs would be valid and materially different
- required source input is missing
- user intent conflicts with the active pipeline stage

---

### 3. System Alignment Check

Confirm the prompt references the correct repository systems without restating or duplicating them.

Pass criteria:
- relevant systems are referenced by file name or system name
- stage-specific systems are used only where appropriate
- memory, frameworks, wordbanks, and pattern systems are referenced when useful
- raw transcripts are not used directly during generation

Stage alignment examples:
- story generation should reference story, narrator, pacing, retention, and memory systems
- scene generation should reference scene construction, escalation, continuity, and environment systems
- shotlist generation should reference camera language, continuity, visual escalation, and lens realism systems
- image prompt generation should reference shot-to-prompt translation, visual continuity, and GPT-image compatibility rules
- narration formatting should reference narrator identity, narration review, and ElevenLabs formatting references

Minor failure examples:
- a helpful system is omitted but output can still be produced safely
- system references are broad but not misleading

Critical failure examples:
- prompt bypasses repository systems
- prompt asks Claude to directly imitate source material
- prompt conflicts with transcript usage rules or memory rules

---

### 4. Constraint Check

Confirm constraints are enforceable, relevant, and not contradictory.

Pass criteria:
- constraints are specific
- constraints can be checked in output
- constraints support the current stage
- constraints do not conflict with each other
- constraints do not over-restrict creative quality

Strong constraint examples:
- avoid direct transcript imitation
- maintain narrator identity continuity
- preserve environmental baseline unless escalation requires a change
- avoid repeated sentence openings unless used intentionally for tension
- do not introduce visual details that conflict with prior scene state

Weak constraint examples:
- make it scary
- make it high quality
- keep it interesting
- make it unique

Minor failure examples:
- weak constraint can be translated into an existing system rule
- constraint is useful but not testable as written

Critical failure examples:
- constraints conflict with the requested output
- constraints require impossible verification
- constraints would degrade the output by blocking necessary stage behavior

---

### 5. Output Format Check

Confirm the prompt defines the expected output clearly.

Pass criteria:
- output sections are named
- order of output is clear
- formatting expectations are explicit
- output aligns with `/systems/output_format_rules.md`
- output can be reused by the next pipeline stage

Minor failure examples:
- formatting can be inferred from the stage template
- section labels need minor normalization

Critical failure examples:
- no output format is defined
- output format conflicts with the next stage
- requested output cannot be stored, reviewed, or reused cleanly

---

## Validation Result Levels

Claude must classify the validation result using one of three statuses.

### Pass

The prompt is ready for execution.

Claude should:
- execute normally
- log the validation pass concisely

---

### Pass With Auto-Correction

The prompt has minor issues, but Claude can safely correct them using repository rules.

Claude should:
- apply the correction internally
- execute without asking the user
- log what was corrected
- recommend a system or prompt update only if the issue may recur

Examples:
- normalize section labels
- infer missing stage defaults
- tighten vague constraints using existing systems
- add missing output structure from the stage template
- resolve minor ambiguity through `/systems/autonomy_rules.md`

---

### Critical Failure

The prompt cannot be executed safely or would produce an unreliable output.

Claude should stop only when the issue cannot be safely resolved through repository defaults.

Critical failures include:
- missing source material required for the stage
- missing or conflicting output format
- direct conflict with repository rules
- instruction to copy or imitate source material
- ambiguity that changes the core creative direction
- request to proceed with API/file actions without required approval

When critical failure occurs, Claude must:
- stop execution
- explain the issue briefly
- ask only the minimum necessary question or request the missing input
- log the failure in `/logs/execution_log.md`

---

## Auto-Correction Rules

Claude should auto-correct minor prompt issues when the correction is obvious and low-risk.

Allowed auto-corrections:
- add missing standard section labels
- map vague style language to existing systems
- apply default stage output format
- infer model/stage behavior from `/systems/execution_stages.md`
- route debug notes to `/logs/execution_log.md`
- remove redundant system restatement from the working prompt
- convert weak constraints into enforceable constraints using existing files

Not allowed without user approval:
- changing the creative premise
- changing the intended stage
- changing approved story continuity
- adding new system rules
- overwriting repository files
- approving API usage, file writes, or batch generation

---

## Logging Structure

Prompt validation results must be logged inside `/logs/execution_log.md` as part of the related execution entry.

Claude should add a concise subsection called `Prompt Validation`.

Use this structure:

```markdown
### Prompt Validation
- Prompt name:
- Stage:
- Validation status: pass / pass_with_auto_correction / critical_failure

#### Category Results
- Structure: pass / fail / corrected
- Clarity: pass / fail / corrected
- System Alignment: pass / fail / corrected
- Constraints: pass / fail / corrected
- Output Format: pass / fail / corrected

#### Detected Weaknesses
- Weakness:
  - Effect:
  - Severity: low / medium / critical

#### Auto-Corrections Applied
- Correction:
  - Reason:
  - Source rule or file:

#### System Improvement Notes
- Recommended file path:
  - Suggested improvement:
  - Priority: required / optional
```

If there are no weaknesses, write:

```markdown
#### Detected Weaknesses
- None detected.
```

If there are no auto-corrections, write:

```markdown
#### Auto-Corrections Applied
- None.
```

If no system improvement is needed, write:

```markdown
#### System Improvement Notes
- No system update recommended.
```

---

## Concision Rule

Prompt validation logs must be diagnostic, not verbose.

Do not log:
- the full prompt
- full generated output
- long reasoning chains
- repeated copies of system rules
- obvious checks that add no debugging value

Do log:
- what passed
- what failed
- what was corrected
- what could cause future issues
- which file should be improved if the weakness recurs

---

## Failure Handling Rules

### Minor Issue

Definition:
- issue is clear
- correction is obvious
- output quality is not at risk

Behavior:
- auto-correct
- continue execution
- log correction

---

### Medium Issue

Definition:
- issue may affect output quality, but repository defaults can resolve it

Behavior:
- auto-correct using the safest system-aligned default
- continue execution
- log weakness and correction
- recommend optional update if recurrence is likely

---

### Critical Issue

Definition:
- issue prevents reliable execution or conflicts with source-of-truth rules

Behavior:
- stop execution
- explain the failure briefly
- ask only for the missing required input or approval
- log the failure
- recommend required update if the issue is caused by missing system logic

---

## Integration With Execution Stages

Prompt validation must align with `/systems/execution_stages.md`.

### Input + Intent Interpretation

Validate:
- user seed is sufficient
- requested direction is not contradictory
- missing preferences can be inferred

Do not stop unless ambiguity changes the story direction significantly.

---

### Story Generation

Validate:
- narrator identity requirements are clear
- story output format is defined
- memory and pattern systems are referenced
- transcript usage rules are respected

Stop after story generation for user approval.

---

### Scene + Shot Expansion

Validate:
- prior story output is available
- scene format is defined
- continuity systems are referenced
- escalation logic is preserved
- shotlist output can support image prompt generation

Stop only if model switch or approval checkpoint is required.

---

### Prompt Generation

Validate:
- shotlist or scene source exists
- image prompt format is defined
- continuity locks are active
- GPT-image prompt constraints are clear
- batch export requirements are respected if applicable

Stop before API usage or batch generation.

---

### Review + Logging

Validate:
- review target is defined
- scoring or assessment categories are clear
- memory routing rules are active
- improvement recommendations are tied to repository paths

Do not turn review notes into memory unless they are durable and routed correctly.

---

## System Improvement Routing

Validation findings should be routed according to the type of issue.

- prompt structure issue → `/systems/prompt_engineering_layer.md` or affected `/prompts/` file
- stage behavior issue → `/systems/execution_stages.md`
- unnecessary clarification issue → `/systems/autonomy_rules.md`
- output format issue → `/systems/output_format_rules.md`
- logging issue → `/logs/execution_log.md`
- recurring failure → `/memory/failure_log.md`
- reusable improvement → `/memory/patterns_and_improvements.md`
- durable architecture lesson → `/memory/project_learnings.md`
- visual continuity issue → relevant continuity or visual system file
- narration issue → narration system, narration review pass, or ElevenLabs reference file

Validation logs may recommend these updates, but Claude should not rewrite repository files unless the user has approved file changes or the current workflow explicitly allows repository updates.

---

## User-Facing Output Rule

Prompt validation should normally remain invisible to the user-facing production output.

Claude may mention validation only when:
- a critical failure stops execution
- the user explicitly asks for validation details
- the task is a debug pass or system review
- a repository update recommendation is important to the next step

For normal production runs, validation belongs in `/logs/execution_log.md`.

---

## Required Mini-Checklist

Before executing a prompt, Claude must internally confirm:

```markdown
Prompt Validation Mini-Checklist
- Structure complete: yes / no
- Objective clear: yes / no
- Stage identified: yes / no
- Required systems referenced: yes / no
- Constraints enforceable: yes / no
- Output format defined: yes / no
- Safe to auto-correct: yes / no / not needed
- Critical failure present: yes / no
```

This mini-checklist does not need to appear in final output unless the user asks for debugging detail.

---

## Summary

The Prompt Validation Logging System gives the pipeline a lightweight quality gate before each stage runs.

Its job is to:
- catch weak prompts early
- preserve production flow
- reduce unnecessary clarification
- improve debugging visibility
- identify recurring system gaps
- support long-term prompt improvement

Validation should protect quality without becoming a bottleneck.
