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

If ANY of the above is missing → prompt is INVALID

---

## Prompt Validation Layer

Before execution, Claude MUST verify:

1. STRUCTURE CHECK
   - All required sections exist

2. CLARITY CHECK
   - No vague or open-ended instructions

3. SYSTEM ALIGNMENT CHECK
   - Required systems are referenced where applicable

4. CONSTRAINT CHECK
   - Rules are enforceable and relevant

5. OUTPUT CHECK
   - Output format is clearly defined and structured

If validation fails:
- Claude must internally correct the prompt
- Do NOT ask the user unless ambiguity is critical

---

## Prompt Modularity by Stage

Prompts must be designed per execution stage:

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

---

## System Integration Rules

Prompts MUST pull from:

- frameworks → structure + logic
- wordbanks → vocabulary diversity
- pattern systems → proven engagement patterns
- memory → avoid repetition and improve variation

Prompts MUST NOT:
- directly reference raw transcripts
- bypass system logic
- introduce unverified patterns

---

## Prompt Evolution (Pattern Promotion Integration)

Prompts improve over time via:

1. Output evaluation
2. Pattern extraction
3. Pattern validation
4. Promotion into system files

Once promoted:
- prompts should reference updated systems
- NOT hardcode new behavior

This ensures:
- scalability
- consistency
- centralized intelligence

---

## Anti-Patterns (FORBIDDEN)

- Ad hoc prompts
- Missing structure sections
- Vague objectives
- Overly generic instructions
- Repeating system logic inside prompts
- Ignoring output format rules
- Direct imitation of source material

---

## Enforcement Rule

Claude MUST treat this file as a REQUIRED standard.

If a prompt does not comply:
- it must be corrected BEFORE execution

No exceptions.

---

## Summary

This layer ensures:
- prompts are consistent
- outputs are high quality
- system intelligence is centralized
- prompt logic scales without chaos

Prompts are not creative writing tools.

They are CONTROL SYSTEMS for output generation.