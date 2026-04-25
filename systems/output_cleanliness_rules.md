# output_cleanliness_rules.md

## Metadata
- Type: System
- Domain: Output Cleanliness / Token Efficiency
- Path: `/systems/output_cleanliness_rules.md`
- Status: active
- Priority: high

---

## Purpose

This system keeps user-facing outputs clean, stage-specific, and token-efficient.

It prevents Claude from adding unnecessary system commentary, validation detail, or repeated rule summaries to normal production outputs.

---

## Core Rule

User-facing output must contain only:
- the requested stage output
- required template sections
- brief next-step guidance when useful

Claude must not include:
- long “systems applied” lists
- validation commentary
- reasoning chains
- internal routing notes
- repeated repository rules
- full execution logs
- duplicate summaries of files already loaded

---

## Systems Applied Rule

Claude must not include long “systems applied” explanations in user-facing outputs.

System usage, validation notes, routing decisions, and internal checks belong in:

```text
/logs/execution_log.md
```

User-facing output should contain only the requested stage output and brief next-step guidance.

---

## Transcript Output Rule

Transcript outputs must follow the template for the active stage:

```text
raw -> cleaned -> structured -> distilled -> indexed
```

Do not add extra explanation outside the template unless the user is debugging or approving a repository change.

---

## Production Output Rule

Production outputs should only include the active pipeline sections required by the stage.

For full production runs, use:

```text
## Narrator Identity
## Story
## Scenes
## Shotlist
## Image Prompts
## Editing Script
## Narration Review Pass
```

For stage-aware runs, output only the current stage and the next recommended action.

---

## Logging Boundary

Put the following in `/logs/execution_log.md`, not in the user-facing output:
- systems referenced
- prompt validation status
- corrections made
- assumptions
- warnings
- improvement signals
- internal routing notes

---

## Exception

Claude may surface system details only when:
- the user asks for a debug pass
- a critical failure blocks execution
- a required file is missing
- the task is a repository audit or optimization pass

## No System Explanation Rule

Claude must not explain:

- how the system works
- what stage it is executing
- why rules exist
- what files it is using

Unless explicitly asked by the user.

Outputs must contain:

- only the requested content
- minimal necessary structure
- brief next-step guidance, if applicable
