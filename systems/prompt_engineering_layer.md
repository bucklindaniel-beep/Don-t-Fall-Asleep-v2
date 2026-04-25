# Prompt Engineering Layer

## Purpose

This system defines how ALL prompts in the repository are constructed, validated, and evolved.

It ensures:
- consistent prompt structure
- high-quality outputs
- alignment with system frameworks
- reusability across pipeline stages
- continuous improvement via pattern promotion

This is NOT a prompt library.
This is the STANDARD that all prompts must follow.

---

## Core Principles

1. Prompts are SYSTEM-DRIVEN
   - Never ad hoc
   - Always structured
   - Always aligned with repository systems

2. Prompts are MODULAR
   - Built per pipeline stage
   - Reusable across executions
   - Composable when needed

3. Prompts PRIORITIZE OUTPUT QUALITY
   - Clarity > brevity
   - Specificity > generalization
   - Structure > freeform text

4. Prompts are VALIDATED before execution
   - No incomplete or ambiguous prompts allowed
   - Must pass defined validation checks
   - Validation uses `/systems/prompt_validation_logging.md`

---

## Standard Prompt Structure (REQUIRED)

All prompts MUST follow this structure:

### 1. ROLE
Defines Claude’s responsibility for the task.

- Must be explicit and task-specific
- Example:
  "You are a system-driven horror story generator focused on psychological realism and narrative tension."

---

### 2. OBJECTIVE
Clear definition of what must be produced.

- No ambiguity
- Output must be clearly defined
- Example:
  "Generate a structured horror story with escalating tension and grounded psychological elements."

---

### 3. CONTEXT
Relevant inputs and system awareness.

May include:
- user input / seed idea
- prior stage outputs
- memory references
- constraints from execution stage

---

### 4. SYSTEM APPLICATION
Defines which systems must be applied.

Examples:
- frameworks
- wordbanks
- pattern systems
- continuity systems

DO NOT restate system logic.
REFERENCE systems instead.

---

### 5. CONSTRAINTS
Hard rules Claude MUST follow.

Examples:
- no repetition
- no generic phrasing
- no breaking continuity
- no referencing transcripts directly

Constraints must be:
- enforceable
- specific
- testable

---

### 6. OUTPUT FORMAT
Defines EXACT structure of output.

- Must align with `output_format_rules.md`
- No deviations allowed
- Use clearly labeled sections

---

### 7. EXECUTION NOTES (OPTIONAL)
Only used when necessary.

Examples:
- escalation expectations
- tone control
- pacing guidance

---

## Prompt Quality Standards

A prompt is considered VALID only if:

- Role is clearly defined
- Objective is unambiguous
- Context is sufficient for execution
- Required systems are referenced
- Constraints are enforceable
- Output format is explicitly defined

If ANY of the above is missing → prompt requires validation handling before execution.

---

## Prompt Validation Layer

Before executing any stage-specific prompt, Claude MUST validate the prompt using:

`/systems/prompt_validation_logging.md`

Claude MUST verify:

1. STRUCTURE CHECK
   - All required sections exist

2. CLARITY CHECK
   - No vague or open-ended instructions

3. SYSTEM ALIGNMENT CHECK
   - Required systems are referenced where applicable
   - Prompt does not bypass repository logic

4. CONSTRAINT CHECK
   - Rules are enforceable and relevant

5. OUTPUT CHECK
   - Output format is clearly defined and structured

6. LOGGING CHECK
   - Validation result can be logged to `/logs/execution_log.md`

If validation identifies a minor issue:
- Claude must auto-correct internally
- Claude must continue execution
- Claude must log the correction in `/logs/execution_log.md`

If validation identifies a critical issue:
- Claude may stop execution only if the prompt cannot be safely interpreted
- Claude must explain the blocker clearly
- Claude must log the failure and recommended fix in `/logs/execution_log.md`

Claude MUST NOT ask unnecessary clarification questions.

---

## Prompt Validation Logging Rule

Prompt validation results are diagnostic data.

Claude MUST route validation details to:

`/logs/execution_log.md`

Because `/logs/` is excluded from Claude’s long-term project ingestion, validation logs must be concise and actionable.

Claude should log:
- prompt name
- stage
- pass/fail status by validation category
- detected weaknesses
- auto-corrections applied
- system improvement notes

Claude should NOT expose full validation details in the main user-facing output unless a critical failure blocks execution.

---

## Prompt Modularity by Stage

Prompts must be designed per execution stage:

- Use `/systems/stage_execution_map.md` to determine stage order, required inputs, outputs, stop points, and model recommendations.
- story_generation
- scene_generation
- shotlist_generation
- image_prompt_generation
- editing_script_generation
- narration_formatting

Each stage:
- has its own prompt template
- follows the standard structure
- pulls from relevant systems only
- is validated before execution
- logs validation results to `/logs/execution_log.md`

---

## System Integration Rules

- autonomy_enforcement → ensures forward execution without unnecessary blocking 
- output_cleanliness_rules → ensures all outputs are clean and free of system noise

Prompts MUST pull from:

- frameworks → structure + logic
- wordbanks → vocabulary diversity
- pattern systems → proven engagement patterns
- memory → avoid repetition and improve variation
- prompt validation logging → debug prompt quality before execution

Prompts MUST NOT:
- directly reference raw transcripts
- bypass system logic
- introduce unverified patterns
- skip validation when validation is required

---

## Prompt Evolution (Pattern Promotion Integration)

Prompts improve over time via:

1. Output evaluation
2. Prompt validation logging
3. Pattern extraction
4. Pattern validation
5. Promotion into system files

Once promoted:
- prompts should reference updated systems
- NOT hardcode new behavior

Prompt validation logs may reveal repeated weaknesses.

If the same prompt weakness appears repeatedly, Claude should recommend promotion into the appropriate system file, prompt template, framework, playbook, wordbank, or memory file.

This ensures:
- scalability
- consistency
- centralized intelligence
- cleaner system improvement loops

---

## Anti-Patterns (FORBIDDEN)

- Ad hoc prompts
- Missing structure sections
- Vague objectives
- Overly generic instructions
- Repeating system logic inside prompts
- Ignoring output format rules
- Direct imitation of source material
- Running prompts without validation
- Asking clarification questions for minor fixable issues

---

## Enforcement Rule

Claude MUST treat this file as a REQUIRED standard.

If a prompt does not comply:
- it must be corrected BEFORE execution
- minor issues must be corrected automatically
- critical issues must be logged and surfaced clearly

No exceptions.

---

## Summary

This layer ensures:
- prompts are consistent
- outputs are high quality
- system intelligence is centralized
- prompt logic scales without chaos
- prompt weaknesses are visible through logging

Prompts are not creative writing tools.

They are CONTROL SYSTEMS for output generation.