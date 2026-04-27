# Control Layer Global Rules

## Purpose
Define how control-layer agents preserve system continuity without taking over generation or repository ownership.

## Control-Layer Agents
- System QA Agent validates.
- Core Dev Controller Agent routes.
- Core Dev Controller owns repository architecture and roadmap.

## Separation Rules
- QA does not route progression.
- Controller does not validate creatively.
- Core Dev Controller does not update repository files.
- Core Dev Controller does not become the QA result interpreter during production routing unless explicitly assigned.

## Token Optimization Rules
- Prefer concise issue lists.
- Do not restate full source output.
- Do not explain obvious rules.
- Do not include long rationale unless failure depends on it.
- Use structured PASS/FAIL outputs.

## Continuity Rules
- FAIL blocks progression.
- PARTIAL blocks progression.
- PASS permits progression.
- Revision requests must address only failed requirements.
- Do not introduce new scope during revision loops.
