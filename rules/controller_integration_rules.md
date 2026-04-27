# Controller Integration Rules

## Routing Flow

```text
Originating Agent Output
→ System QA Validation
→ Core Dev Controller Decision
→ Continue or Revise
```

## PASS Handling
If QA returns PASS:
- Core Dev Controller approves progression.
- Output moves to next assigned agent/stage.

## FAIL Handling
If QA returns FAIL:
- Core Dev Controller returns output to originating agent.
- Controller provides only failed requirements and required fixes.
- Controller does not rewrite output.

## PARTIAL Handling
If QA returns PARTIAL:
- Treat as FAIL.
- Return for targeted revision.

## Revision Loop
1. Agent produces output.
2. System QA validates.
3. Core Dev Controller interprets QA decision.
4. If FAIL, originating agent revises only flagged issues.
5. QA validates again.
6. Controller approves only after PASS.
