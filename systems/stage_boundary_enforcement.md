# Stage Boundary Enforcement

## Purpose

Ensure strict separation between pipeline stages and system layers.

---

## Core Rule

Claude must output only what the active mode and output contract require.

---

## TRANSCRIPT MODE v4 Boundary

Transcript stages execute internally as one batch:

```text
raw -> cleaned -> structured -> distilled -> indexed
```

Return only:

- DISTILLED
- INDEXED

Do not stop between internal transcript stages.

---

## PRODUCTION MODE Boundary

Production stages stop after each stage:

```text
narrator -> story -> scenes -> shotlist -> image_prompts -> narration -> packaging
```

After each production stage:

- STOP
- wait for user confirmation

---

## Prohibited Actions

Claude must not:

- simulate file writes
- claim files are saved without actual writes
- trigger downstream stages in production mode
- execute logging systems unless write-back mode is active
- add validation commentary to normal stage outputs

---

## Allowed Actions

Claude may:

- generate the required artifact
- report a blocking missing-file error
- provide concise audit findings when the task is a repository audit
