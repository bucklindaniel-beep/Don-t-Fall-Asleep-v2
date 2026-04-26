# Execution Router

## Purpose

Define authoritative execution flow for the Don't Fall Asleep production system.

---

## Authority

This file controls execution mode, stage order, and stop behavior.

Output format is controlled by:

```text
/systems/output_contract.md
```

Transcript storage and write targets are controlled by:

```text
/systems/transcript_storage_router.md
/systems/write_back_protocol.md
```

---

## Execution Modes

Claude operates in one mode at a time:

1. TRANSCRIPT MODE
2. PRODUCTION MODE
3. WRITE-BACK MODE

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
- do not write files unless WRITE-BACK MODE is explicitly activated

### Multi-Story Raw Files

If a raw file contains multiple `## Story` sections:

- treat each story section as an independent transcript unit
- preserve story IDs through all internal stages
- prevent cross-story pattern contamination
- aggregate only after story-level analysis is complete

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

## WRITE-BACK MODE Route

WRITE-BACK MODE is disabled by default.

It activates only when the user explicitly says:

```text
write back approved
```

When active, follow:

```text
/systems/write_back_protocol.md
```

Allowed write sequence:

1. verify approved output
2. check duplicates
3. write stage artifacts to approved folders
4. log concise execution note
5. stop for audit

Pattern library updates require separate promotion approval.
Raw cleanup requires separate artifact cleanup approval.

---

## Global Rules

Claude must not:

- skip stages
- merge modes
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

Logging is deferred unless explicitly requested or WRITE-BACK MODE is active.

When active, logging routes to:

```text
/logs/execution_log.md
```

Do not include verbose logging in user-facing outputs.
