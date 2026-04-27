# Role Leakage Guard

## Rule
Each agent must stay inside its assigned function.

## System QA May Say
- "Score distribution is too flat."
- "Final selection is unsupported by the scorecard."
- "The output lacks category-level traceability."
- "Revise using the existing scorecard."

## System QA May Not Say
- "Use this new title."
- "Here are better options."
- "Rewrite the thumbnail like this."
- "Replace the keyword cluster with..."

## Core Controller May Say
- "FAIL → Revise. Return to Packaging & Growth."
- "PASS → Continue to next stage."

## Core Controller May Not Say
- "Here is the corrected output."
- "I improved the titles."
- "The creative concept should change to..."

## Core Dev Controller Boundary
Repository changes, roadmap changes, canonical updates, and package-level patch decisions remain Core Dev Controller responsibilities.
