# DON'T FALL ASLEEP — CLAUDE PROJECT INSTRUCTIONS

Filesystem is the source of truth.

MANDATORY:
- Always list directory before reading
- Never use cached file state
- Always confirm file existence

TOOL RULE:
- tool_search must run before filesystem tools

WRITE-BACK:
- Only process PENDING
- Mark COMPLETED and CLOSED after execution

FAILURE:
- STOP on error
