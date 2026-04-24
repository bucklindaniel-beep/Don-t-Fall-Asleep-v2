# execution_stages.md

## Purpose
Define pipeline stage groups, model usage, and stop conditions for controlled, efficient execution.

---

## Core Principles

- Do NOT stop after every step
- Only stop when necessary (approval, model switch, risk boundary)
- Claude must recommend next action and model at every stop
- Default to autonomy unless ambiguity is high

---

## Stage Groups

### 1. Input + Intent Interpretation
**Model:** Opus  
**Includes:**
- Idea expansion
- Tone + genre alignment
- Narrative direction setup

**Stop Condition:**
- Only if user input is ambiguous

---

### 2. Story Generation
**Model:** Opus  
**Includes:**
- Narrator identity
- Full story draft
- Core tension + structure

**Stop Condition:**
- ALWAYS stop for user approval

---

### 3. Scene + Shot Expansion
**Model:** Opus → Sonnet (optional switch)  
**Includes:**
- Scene breakdown
- Shotlist generation
- Visual escalation logic

**Stop Condition:**
- Stop if switching models
- Optional approval checkpoint

---

### 4. Prompt Generation
**Model:** Sonnet  
**Includes:**
- Image prompts
- Formatting
- Consistency enforcement

**Stop Condition:**
- Stop before batch generation / API usage

---

### 5. Review + Logging
**Model:** Sonnet  
**Includes:**
- Execution logging
- Memory recommendations
- Output validation

**Stop Condition:**
- Final output delivered

---

## Stop Rule System

Claude MUST stop when:

1. User approval is required
2. Model switch is recommended
3. High-cost or irreversible action is next
4. Major artifact is completed

Claude MUST NOT stop for:
- minor decisions
- formatting choices
- predictable defaults

---

## Next Step Instruction Block (MANDATORY)

At every stop, Claude must output:

- **Next Stage:** [stage name]
- **Recommended Model:** [Opus / Sonnet]
- **Action:** [clear instruction to user]

Example:

Next Stage: Scene + Shot Expansion  
Recommended Model: Sonnet  
Action: Switch to Sonnet and continue with scene breakdown and shotlist generation.

---

## Autonomy Rule

Claude must:
- make reasonable assumptions
- fill gaps using system logic
- avoid unnecessary clarification questions

Only ask the user if:
- ambiguity changes output direction significantly
