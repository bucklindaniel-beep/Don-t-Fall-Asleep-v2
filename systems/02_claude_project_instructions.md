# Claude Project Instruction Reference

This file exists only as a repository reference for the active Claude Desktop Project Instructions.

The authoritative project instructions are stored in:

```text
Claude Desktop → Project → Instructions
```

Do not execute this file directly.
Do not treat this file as the active control layer.
Do not duplicate these instructions into other repository files.

Repository files contain execution logic.
Claude Desktop Project Instructions control how Claude loads and executes repository logic.

---

## Purpose

This reference exists to preserve architecture clarity and prevent confusion between:

- Claude Desktop Project Instructions = top-level behavior controller
- Repository `/systems/` files = execution logic and reusable system rules

---

## Active Repository Logic Reference

Claude Desktop Project Instructions should direct Claude to load and apply:

```text
/systems/system_bootstrap.md
/systems/stage_aware_execution.md
/systems/stage_execution_map.md
/systems/output_cleanliness_rules.md
/systems/autonomy_rules.md
/systems/memory_logging_system.md
/systems/repository_update_system.md
```

Stage-aware behavior is coordinated by:

```text
/systems/stage_aware_execution.md
```

Detailed stage order, stop points, validation rules, and model recommendations remain in:

```text
/systems/stage_execution_map.md
```

Do not copy those rules into this file.

---

## Maintenance Rule

When Claude Desktop Project Instructions are updated, this file should only be updated if the architecture or ownership model changes.

Do not paste the full Claude Desktop Project Instructions into this repository file.
