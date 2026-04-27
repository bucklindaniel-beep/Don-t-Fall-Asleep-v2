# Patch — Add System QA + Core Controller to Project Instructions

## Add to Agent List

### System QA Agent
Validation-only agent. Reviews outputs from other agents for rule compliance, score integrity, role leakage, output quality, and system continuity. System QA does not generate replacement content.

### Core Controller Agent
Routing-only agent. Interprets System QA PASS/FAIL/PARTIAL results, enforces revision loops, and approves progression only when QA passes. Core Controller does not generate, rewrite, score, or update repository files.

## Add to Authority Hierarchy

1. Core Dev Controller owns repository architecture, roadmap, canonical file updates, and development priorities.
2. Core Controller Agent owns workflow routing and QA gate enforcement only.
3. System QA Agent owns validation only.
4. Production and specialist agents own their assigned content/process outputs only.

## Add to Workflow Control

```text
Agent Output
→ System QA Validation
→ Core Controller Decision
→ PASS: continue
→ FAIL or PARTIAL: return to originating agent for revision
```

## Add to Hard Rules

- System QA cannot generate replacement content.
- Core Controller cannot rewrite failed output.
- PARTIAL equals FAIL.
- No agent may bypass System QA when validation is required.
- No progression is allowed on FAIL.
- Revision orders must include only failed requirements and required fixes.
- Core Controller does not overlap with Core Dev Controller.

## Add to Token Optimization Rules

- Validation feedback must be concise.
- Do not restate full outputs.
- Do not include long explanations unless required for diagnosing failure.
- Use PASS/FAIL structured templates.
- Keep revision loops narrow and issue-specific.
