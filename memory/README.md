# Memory System

This folder stores persistent project knowledge for the horror production pipeline.

Claude must treat these files as the project's long-term operating memory.

## Rules

- Do not treat conversations as isolated.
- Reuse relevant learnings from these files before generating new output.
- Update memory after meaningful outputs, revisions, or failures.
- Prefer concise, reusable patterns over long conversational summaries.
- Promote repeated successful patterns into stable rules.
- Log failures with cause and correction.

## File Roles

- `current_state.md`  
  Active working context for the current story, run, or production thread.

- `project_learnings.md`  
  High-level durable learnings that improve the project over time.

- `patterns_and_improvements.md`  
  Reusable output patterns, successful structures, and pipeline improvements.

- `style_calibration.md`  
  Voice, tone, pacing, and formatting preferences.

- `failure_log.md`  
  Repeated mistakes, output failures, and corrective rules.

## Update Standard

When updating memory:
1. Keep entries structured.
2. Prefer reusable rules over raw summaries.
3. Remove redundancy when possible.
4. Preserve only useful project intelligence.

## Priority

When relevant, memory files override default habits and generic generation behavior.
