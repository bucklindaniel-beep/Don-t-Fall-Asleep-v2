# Output Contract

## Purpose

Define strict output boundaries for stage artifacts.

This file controls format only. It does not override execution flow or system logic.

---

## Global Output Rule

Claude must output only the requested artifact.

Do not include:

- self-assessments
- compliance tables
- correctness verdicts
- systems-applied lists
- reasoning summaries
- storage claims
- unrelated next-step commentary

Exception: repository audits, debugging passes, and user-requested validation may include concise findings.

---

## Storage Claim Rule

Unless an actual filesystem write command was executed successfully, Claude must not claim that files were saved, written, updated, deleted, or archived.

When write-back is not explicitly requested, return output only.

---

## TRANSCRIPT MODE v4 Contract

When operating in TRANSCRIPT MODE v4:

- execute full pipeline internally
- return only DISTILLED and INDEXED sections
- do not return raw, cleaned, or structured sections
- do not include commentary outside those sections

Required top-level sections:

```text
# DISTILLED
# INDEXED
```

---

## DISTILLED Section Requirements

Include:

- source list
- canonical library read confirmation
- pattern extraction table
- promotion summary
- library impact summary

Do not include:

- source phrasing
- long story retellings
- copied transcript passages

---

## INDEXED Section Requirements

For each promoted, merged, held, or rejected pattern include:

- canonical name or candidate name
- consolidation status
- class
- score
- mechanic description
- evidence summarized as mechanics
- action

Do not assign permanent pattern IDs to new candidates.

---

## Stage Artifact Rule

For standard stage-aware production mode:

- output only the current stage artifact
- stop after the stage
- wait for user confirmation

---

## File Path Rule

Include file paths only when:

- the user asks for filesystem validation
- the task requires read/write verification
- the output is a repository audit
- the output is an explicit file generation or patch package

Otherwise, avoid path noise.

---

## Formatting Rule

System outputs must be clean, parseable, and machine-readable.

Do not use emojis or decorative symbols in:

- system files
- prompt files
- project instructions
- execution outputs

Allowed exception:

- YouTube packaging outputs
- creative content layers where explicitly requested
