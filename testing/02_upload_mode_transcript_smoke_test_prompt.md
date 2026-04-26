# Upload-Mode Transcript Smoke Test Prompt

## AI Mode

Start with **Sonnet**.

Switch to **Opus** only for:
- pattern distillation
- narration mechanics extraction
- pattern quality evaluation

Switch back to **Sonnet** for:
- indexed preview
- execution report
- formatting

---

## Prompt

You are the execution engine for the Don't Fall Asleep production pipeline.

Run a TRANSCRIPT PIPELINE SMOKE TEST ONLY.

---

## Input Requirement

Use uploaded `.md` transcript files only.

Treat uploaded files as simulated:

`/transcripts/raw/`

If no `.md` files are uploaded:

STOP immediately and return:

`BLOCKED — No transcript files uploaded`

Do NOT attempt to access:
- GitHub paths
- local filesystem paths
- `/mnt/`
- `/uploads/`
- `/user-data/`

---

## Execution Scope

Do NOT run:
- story generation
- scene generation
- shotlists
- image prompts
- editing scripts
- full production pipeline

---

## Execution Flow

Follow strictly:

raw → cleaned → structured → distilled → indexed preview

Do NOT merge stages.
Do NOT skip stages.
Do NOT write files.

---

## Validation Targets

Validate:
- transcript intake
- transcript depth
- cleaning integrity
- duplicate detection
- structure extraction
- pattern distillation
- narration mechanics viability
- indexed preview readiness

---

## Rules

Extract mechanics only.

Do NOT:
- summarize story content
- copy source phrasing
- imitate creator voice
- generate new story material
- promote low-confidence narration patterns

Separate:
- structure mechanics
- realism mechanics
- narration mechanics
- retention mechanics

---

## Narration Gate

Before narration extraction, check transcript depth.

Block narration extraction if the transcript is:
- summary-level
- stubbed
- too short
- missing sentence-level narration
- missing natural pacing
- non-English
- low-quality caption output

If blocked, explain why and do not index narration mechanics.

---

## Duplicate Detection

Check for:
- exact duplicate transcript files
- near-duplicate source titles
- repeated story structures
- redundant pattern entries

Do not overwrite, merge, or promote without approval.

---

## Required Output

Return:

1. Intake summary
2. Transcript depth / quality check
3. Duplicate detection summary
4. Cleaning stage status
5. Structured extraction summary
6. Pattern distillation summary
7. Narration mechanics summary
8. Indexed output preview
9. System issues / edge cases
10. Recommendation: proceed, retry, patch repository, or run small full smoke test

---

## Final Stop

Stop before writing:
- cleaned files
- structured files
- distilled files
- indexed files
- memory updates

Request approval before any write step.
