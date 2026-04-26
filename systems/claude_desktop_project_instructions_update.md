# Claude Desktop Project Instructions Update

Copy/paste the full contents of:

/systems/02_claude_project_instructions.md

into Claude Desktop Project Instructions.

## Patch v1 Additions

This update adds:

- CHAT CONTEXT CONTROL
- PRE-EXECUTION RESTRICTION
- PATTERN ID STABILITY

Purpose:

- prevent same-chat transcript memory contamination
- force filesystem re-read for every transcript batch
- prevent pre-analysis outside the defined pipeline
- prevent canonical ID drift and duplicate pattern creation
