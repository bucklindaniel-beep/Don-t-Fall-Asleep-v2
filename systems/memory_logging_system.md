# Memory Logging System

## Metadata
- Type: System
- Domain: Memory / Logging / Pattern Promotion
- Status: active
- Priority: high

---

## Purpose
Route durable learnings to the correct memory file without creating memory bloat.

Memory should improve future runs, not archive every detail.

---

## Memory Destinations

### `/memory/current_state.md`
Use for active run status, next action, unresolved blockers, and current focus.
Replace when state changes.

### `/memory/style_calibration.md`
Use for stable user preferences affecting future output style.
Append only concise reusable rules.

### `/memory/failure_log.md`
Use for failures, corrections, repeated mistakes, or validation breakdowns.

### `/memory/patterns_and_improvements.md`
Use for reusable production patterns after scoring.
Each entry must include why it works, when to use, and when not to use.

### `/memory/project_learnings.md`
Use for durable architecture or workflow lessons.

---

## Routing Decision Tree

1. Current run only → `/memory/current_state.md`
2. Stable user preference → `/memory/style_calibration.md`
3. Failure or correction → `/memory/failure_log.md`
4. Reusable pattern with value → score first, then `/memory/patterns_and_improvements.md`
5. Durable architecture lesson → `/memory/project_learnings.md`
6. Hard execution rule → recommend repository update instead of memory-only logging

---

## Pattern Scoring Requirement
Before routing a pattern to durable memory, apply `/frameworks/13_pattern_scoring_framework.md`.

Do not promote every successful moment. Promote only reusable, explainable, low-copying-risk mechanics.

---

## End-of-Run Memory Pass
At terminal stages or when durable learning occurs, classify:
- what changed
- what user corrected
- what pattern proved useful
- what failed
- what should be tested again
- what should become repository logic

Do not perform verbose memory routing after every intermediate stage.

---

## Output Block
When memory changes are needed, output:

```markdown
## Memory Logging

### Items Classified
- Type:
- Summary:
- Destination:

### Repository Updates
- File updated:
- Change made:
- Append or replace:

### Follow-Up
- Required user action:
```

If direct file access is unavailable, provide exact append-ready content and file paths.

---

## Promotion Rule
Recommend promotion when a lesson repeats, a failure recurs, user preference is stable, or a pattern proves reusable across outputs.
