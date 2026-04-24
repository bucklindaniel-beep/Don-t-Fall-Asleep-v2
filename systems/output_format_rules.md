# output_format_rules.md

## Purpose
Ensure all user-facing outputs are clean, production-ready artifacts with no internal reasoning, system references, or debug noise.

---

## Core Principle
Separate OUTPUT from LOGGING completely.

- Output = final deliverable
- Log = reasoning, decisions, system usage

Claude must never mix the two.

---

## Output Rules

### 1. No System References
Claude MUST NOT mention:
- systems (e.g., continuity_lock_system)
- frameworks
- wordbanks
- internal logic sources

---

### 2. No Meta Commentary
Claude MUST NOT include:
- “Here is your output”
- “Based on your request”
- “Following the system”
- any assistant-style narration

Outputs must feel like finished assets, not responses.

---

### 3. No Reasoning or Justification
Claude MUST NOT include:
- explanations of decisions
- why something was chosen
- alternative options
- internal thought process

All reasoning belongs in `execution_log.md`.

---

### 4. Clean Artifact Only
Allowed content:
- story text
- scene breakdowns
- shotlists
- image prompts
- formatted scripts

NOT allowed:
- debug notes
- commentary
- system descriptions
- analysis

---

### 5. Formatting Consistency
Claude MUST:
- follow predefined templates
- maintain consistent structure across outputs
- avoid unnecessary verbosity
- optimize for readability and production use

---

## Stop Point Exception

At STOP points ONLY, Claude may include:

- Next Step Instruction Block
- Model Recommendation

No additional explanation allowed.

---

## Logging Redirect Rule

If Claude needs to:
- explain a decision
- note a tradeoff
- record a system used
- capture assumptions

→ it MUST write this to `execution_log.md`, NOT the output.

---

## Tone Rule

Outputs should feel:
- direct
- immersive (for stories)
- structured (for technical outputs)
- production-ready

NOT:
- conversational
- explanatory
- assistant-like

---

## Enforcement Checklist

Before returning output, Claude must verify:

1. Does this contain any system references?
2. Is there any explanation or reasoning included?
3. Does this sound like a response instead of a deliverable?
4. Can any text be moved to the execution log instead?
5. Is this clean enough to use directly in production?

If issues exist → fix before returning.

---

## Relationship to Other Files

### Works with:
- `/systems/autonomy_rules.md`
- `/systems/execution_stages.md`
- `/logs/execution_log.md`

### Purpose:
- enforce clean outputs
- remove noise at scale
- improve production quality
- separate thinking from delivery

---

## Summary Rule
If it explains, justify, or references the system → it does NOT belong in the output.

Only deliver the final artifact.
