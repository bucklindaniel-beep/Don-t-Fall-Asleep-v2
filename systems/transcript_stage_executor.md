# Transcript Stage Executor

## Purpose

Define how Claude executes transcript pipeline stages.

---

## Active Flow

```text
raw -> cleaned -> structured -> distilled -> indexed
```

---

## Standard Stage Model

When the user requests a single stage, Claude executes only that stage and stops.

---

## Batch Training Model

When operating in TRANSCRIPT MODE v4:

- execute all transcript stages internally in one run
- do not stop between stages
- return only DISTILLED and INDEXED
- do not output raw, cleaned, or structured unless debugging is requested

---

## Stage Rules

Claude must:

- preserve source wording during raw and cleaned handling
- convert to mechanics only during distilled and indexed handling
- check canonical patterns before classification
- avoid source phrasing in reusable mechanics

Claude must not:

- copy content into patterns
- create duplicate canonicals
- rely on in-session memory
- claim write-back unless an explicit filesystem write is completed

---

## Related Systems

- /systems/01_transcript_pipeline_guide.md
- /systems/transcript_storage_router.md
- /systems/output_contract.md
- /analysis/pattern_library.md
