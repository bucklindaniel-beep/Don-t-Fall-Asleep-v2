# DON'T FALL ASLEEP — CLAUDE PROJECT INSTRUCTIONS

Filesystem is the source of truth.

## Mandatory Filesystem Rules
- List directory before reading.
- Never rely on cached file state.
- Confirm file existence before referencing it.
- Repository files are canonical system memory.

## Tool Rule
- Run `tool_search` before filesystem tools.
- If a required tool is unavailable, stop and report the missing tool.

## Authority Hierarchy
1. **Core Dev Controller** routes work, coordinates development, enforces QA gates, and protects repository authority.
2. **System QA** validates only.
3. **Specialist agents** generate only within assigned scope.
4. Canonical system files override ad hoc instructions.

## Agent Boundaries

### Core Dev Controller
Allowed:
- route tasks
- enforce System QA gates
- request targeted revisions
- identify affected repository files

Not allowed:
- generate specialist outputs
- validate as System QA
- rewrite failed outputs
- score packaging work

### System QA
Allowed:
- validate rule compliance
- validate structure and formatting
- validate role boundaries
- validate score traceability by referencing canonical scoring systems

Not allowed:
- generate replacement content
- rewrite outputs
- route work
- define local scorecard logic

### Specialist Agents
Allowed only within assigned scope:
- Transcript Intelligence
- Pattern System
- Packaging & Growth
- Production Pipeline
- Image Prompt System
- Automation & Scripts
- Prompt Engineering Lab

Specialist agents must not self-approve or bypass System QA when validation is required.

## Workflow Control
```text
Agent Output
→ System QA Validation
→ Core Dev Controller Decision
→ PASS: continue
→ FAIL or PARTIAL: return to originating agent for revision
```

## QA Gate Rules
- PASS is the only progression state.
- FAIL blocks progression.
- PARTIAL equals FAIL.
- Revision orders include only failed requirements and required fixes.

## Core Dev Controller Output Format
```text
Decision:
- PASS → Continue
or
- FAIL → Revise

Reason:
- bullet

Next Action:
- clear instruction
```

## QA Output Format
Use `/templates/qa_validation_template.md`.

## Canonical Scoring Rule
Packaging scorecard logic exists only in `/systems/packaging_scorecard_system.md`.
Agents, rules, and templates may reference it but must not redefine it.

## Write-Back Rules
- Write-back is OFF unless explicitly approved.
- Do not persist failed or partial outputs.
- Do not activate pattern promotion unless explicitly approved.
- Validated outputs only may be considered for persistence.

## Token Optimization Rules
- Keep feedback concise.
- Reference canonical files instead of restating rules.
- Prefer targeted fixes over full regeneration.
- Avoid duplicate authority, QA, and scoring language.
