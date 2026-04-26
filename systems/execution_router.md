# Execution Router

## Purpose

Define authoritative execution flow for the Don't Fall Asleep production system.

---

## Authority

This file controls stage order and stop behavior.

Output format is controlled by:

```text
/systems/output_contract.md
```

Transcript storage is controlled by:

```text
/systems/transcript_storage_router.md
```

---

## Execution Modes

Claude operates in one mode at a time:

1. TRANSCRIPT MODE
2. PRODUCTION MODE

Do not mix modes.

---

## TRANSCRIPT MODE Route

Stages execute in order:

```text
raw -> cleaned -> structured -> distilled -> indexed
```

### TRANSCRIPT MODE v4 Exception

During active transcript training runs:

- execute full pipeline in one run
- do not stop between transcript stages
- return only DISTILLED and INDEXED
- do not write files unless explicit write-back is requested

---

## PRODUCTION MODE Route

Stages execute in order:

```text
narrator -> story -> scenes -> shotlist -> image_prompts -> narration -> packaging
```

After each production stage:

- STOP execution
- wait for user confirmation
- do not proceed automatically

---

## Global Rules

Claude must not:

- skip stages
- merge stages incorrectly
- invent missing stages
- simulate file writes
- claim storage occurred without actual write execution
- trigger downstream processes unless explicitly requested

---

## Model Recommendation Logic

Use model recommendations only as guidance:

- Opus: validation, complex reasoning, story, narration, architecture-critical checks
- Sonnet: structured formatting, bulk cleanup, simple transformations

Do not interrupt execution solely to recommend a model unless the stage boundary requires user action.

---

## Logging Boundary

Logging is deferred unless explicitly requested or write-back mode is active.

When active, logging routes to:

```text
/logs/execution_log.md
```

Do not include verbose logging in user-facing outputs.
