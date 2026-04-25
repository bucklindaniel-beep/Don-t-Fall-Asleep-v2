# Pattern Promotion System

## Metadata
- Type: System
- Domain: Memory / Prompt Improvement / Repository Evolution
- Path: `/systems/pattern_promotion_system.md`
- Status: active
- Priority: high

---

## Purpose

This system defines when repeated observations become reusable repository rules.

It prevents useful lessons from staying buried in logs or one-off memory entries.

The goal is to turn repeated evidence into stable system improvements without overfitting to a single run.

---

## Core Rule

Claude must NOT promote every observation.

A pattern is only eligible for promotion when it is:
- repeated
- useful across future runs
- specific enough to act on
- aligned with repository goals
- not tied only to one story, narrator, or prompt seed

---

## Promotion Sources

Claude may identify promotion candidates from:
- `/logs/execution_log.md`
- `/memory/failure_log.md`
- `/memory/patterns_and_improvements.md`
- `/memory/project_learnings.md`
- user feedback
- prompt validation results
- output quality reviews
- smoke tests or debug passes

---

## Promotion Triggers

A candidate should be promoted when one of the following is true:

1. Repeated Failure
   - The same failure appears more than twice.
   - The prevention rule is stable and reusable.

2. Repeated Successful Pattern
   - The same structure, technique, or workflow improves output quality across multiple runs.
   - The pattern is not dependent on one specific story.

3. Repeated Prompt Weakness
   - Prompt validation identifies the same weakness multiple times.
   - The fix belongs in a prompt template or system rule.

4. Repeated User Preference
   - The user gives the same style, format, tone, or pacing correction more than once.
   - The preference should influence future generations.

5. Repeated Workflow Gap
   - Execution logs show recurring confusion, missing steps, or unclear routing.
   - The fix belongs in a system or playbook file.

---

## Promotion Destinations

Use the destination that matches the pattern type.

### `/systems/`
Use for core behavior rules, execution flow, validation, routing, logging, or global enforcement.

### `/prompts/`
Use for stage-specific prompt template improvements.

### `/frameworks/`
Use for story, scene, escalation, pacing, continuity, or structure logic.

### `/playbooks/`
Use for repeatable execution procedures that combine multiple systems.

### `/wordbanks/`
Use for vocabulary, phrase variation, sensory language, visual description, or style expansion.

### `/memory/`
Use for provisional lessons, patterns, failures, and calibration before they become stable system rules.

---

## Promotion Process

Claude must follow this process before recommending repository changes:

1. Identify the repeated observation.
2. Confirm it appears across more than one run, output, prompt, or validation log.
3. Determine whether it is a failure, pattern, preference, prompt weakness, or workflow gap.
4. Choose the correct repository destination.
5. Write the recommendation in concise, actionable form.
6. Preserve source evidence in memory or logs.
7. Do not modify system behavior unless the user approves or the current workflow explicitly allows repository updates.

---

## Promotion Recommendation Format

Use this format when recommending a promoted rule:

```markdown
### Promotion Candidate
- Pattern / issue:
- Evidence source:
- Repeated count:
- Recommended destination:
- Change needed:
- Why it matters:
- Expected system impact:
- Priority: required / optional
```

---

## Anti-Overfitting Rule

Claude must not promote:
- one-off story details
- temporary run state
- a single user correction with no broader value
- raw transcript wording
- source-material imitation
- vague observations
- stylistic preferences that conflict with existing calibration

If uncertain, keep the item in memory as provisional instead of promoting it.

---

## Relationship to Prompt Validation

Prompt validation logs may reveal recurring template weaknesses.

If the same prompt validation weakness appears repeatedly:
- first log it in `/logs/execution_log.md`
- route durable insight to `/memory/failure_log.md` or `/memory/patterns_and_improvements.md`
- recommend promotion into the relevant `/prompts/` template or `/systems/prompt_validation_logging.md`

---

## Relationship to Memory

Memory files are staging areas.

Promotion should only happen after memory shows that a lesson is stable enough to become repository logic.

Use:
- `/memory/failure_log.md` for repeated problems
- `/memory/patterns_and_improvements.md` for reusable successful patterns
- `/memory/style_calibration.md` for repeated user preferences
- `/memory/project_learnings.md` for durable system lessons

---

## Relationship to Execution Logs

Execution logs are diagnostic evidence, not permanent memory.

Claude may use logs to detect repeated issues, but promoted rules must be written into the correct repository file after approval.

Do not leave important recurring rules only in `/logs/execution_log.md`.

---

## Summary

This system turns repeated evidence into stable repository intelligence.

It protects the pipeline from:
- noisy memory
- duplicated logic
- overfitting
- repeated failures
- buried improvements

Promotion should be deliberate, evidence-based, and routed to the correct file.
