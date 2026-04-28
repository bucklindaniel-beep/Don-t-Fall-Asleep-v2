# Agents Directory

## Purpose

This folder contains lean runtime agent configs only.

Agents should define:
- mode
- task
- rules
- output
- blockers

Expanded explanations belong in `/systems/`.

## Active Agents

| Agent | Status | Use |
|---|---|---|
| Core Dev Controller | ACTIVE | Routes work, protects roadmap |
| Transcript Intelligence | ACTIVE | Transcript RAW → CLEANED → STRUCTURED → DISTILLED |
| System QA | ACTIVE | Validates outputs only |

## Future Agents

| Agent | Status | Rule |
|---|---|---|
| Pattern System | FUTURE | Do not activate until validated DISTILLED corpus is approved |
| Production Pipeline | FUTURE | Do not activate during transcript scaling |
| Image Prompt System | FUTURE | Deferred until content quality phase |
| Packaging & Growth | FUTURE | Deferred until production content exists |
| Automation & Scripts | FUTURE | Plan only unless explicitly approved |

## Runtime Rule

Do not load or reason through FUTURE agents unless the current task explicitly belongs to that agent.

## Token Efficiency Rule

Agents should not scan:
- `/tools/`
- `/transcripts/archive/`
- logs
- backups
- old validation runs

Use only canonical active files unless a review task explicitly asks for archived material.
