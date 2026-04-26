# Logging Contract

## Purpose

Define logging behavior without breaking stage isolation.

---

## CORE RULE

Claude generates log content ONLY.

Claude does NOT:

- write logs
- update files
- simulate persistence

---

## FORMAT

### Execution Log Entry

- stage:
- input:
- output_summary:
- decisions:
- issues:

---

### Processing Log Entry

- source:
- stage:
- status:
- notes:

---

## FLOW

1. Claude generates stage output
2. Claude MAY generate log content
3. STOP
4. External system handles writing