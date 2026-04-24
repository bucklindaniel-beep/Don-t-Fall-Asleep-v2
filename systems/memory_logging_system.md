# Memory Logging System

## Metadata
- Type: System
- Domain: Memory / Logging / Repository Persistence
- Primary Use Cases:
  - logging reusable lessons after production runs
  - preserving user feedback
  - routing failures, patterns, preferences, and current state into the correct files
  - preventing useful improvements from remaining only in chat
- Status: active
- Priority: critical

---

## Purpose

This system defines how Claude records useful project memory after analysis, generation, debugging, revision, or production execution.

The goal is to preserve only information that improves future output quality, reliability, continuity, cost efficiency, or workflow clarity.

Claude must not treat memory logging as a transcript summary. Memory entries must become reusable operating knowledge.

---

## Core Rule

After every meaningful task, Claude must decide whether the interaction produced memory worth saving.

A task is meaningful if it includes any of the following:

- a completed story, scene, shotlist, prompt batch, narration script, or editing script
- user feedback that changes future output expectations
- a repeated failure or correction
- a successful pattern worth reusing
- a workflow improvement
- an API, PowerShell, image generation, voice generation, or editing lesson
- a continuity anchor for an active production run
- a style preference that should remain stable across future work

If no reusable memory was produced, Claude should state: `No durable memory update required.`

---

## Memory Classification

Claude must classify memory before writing it.

### 1. Current State
Use `/memory/current_state.md` for:

- active story premise
- current stage
- last completed stage
- next required action
- active constraints
- continuity anchors
- current narrator identity
- active visual state
- unresolved issues

Current state may be temporary. It is the correct place for useful but not-yet-durable context.

---

### 2. Style Calibration
Use `/memory/style_calibration.md` for:

- stable user preferences
- narration tone preferences
- formatting preferences
- image prompt density preferences
- vocabulary dislikes
- pacing preferences
- preferred output structure
- repeated revision requests that reveal taste

Style calibration should not store one-off scene details.

---

### 3. Failure Log
Use `/memory/failure_log.md` for:

- repeated mistakes
- broken continuity
- weak escalation
- redundant shots
- poor narration rhythm
- API/script failures
- formatting failures
- anything the user corrected that should not recur

Each failure entry must include a prevention rule.

---

### 4. Patterns and Improvements
Use `/memory/patterns_and_improvements.md` for:

- proven prompt structures
- successful scene formulas
- visual variation strategies
- useful shotlist patterns
- editing workflow improvements
- batch generation improvements
- reusable production techniques

Patterns must explain when to use and when not to use the approach.

---

### 5. Project Learnings
Use `/memory/project_learnings.md` for:

- durable system-level lessons
- architectural decisions
- long-term workflow rules
- high-level principles that apply across multiple outputs
- lessons that should eventually influence systems, prompts, or frameworks

Project learnings should be concise and broadly reusable.

---

## Logging Decision Tree

Claude must use this routing logic:

1. Is this only relevant to the current story or active run?
   - Yes → `/memory/current_state.md`

2. Is this a stable user preference?
   - Yes → `/memory/style_calibration.md`

3. Did something fail or require correction?
   - Yes → `/memory/failure_log.md`

4. Did a reusable structure, pattern, or workflow improvement emerge?
   - Yes → `/memory/patterns_and_improvements.md`

5. Is this a durable system lesson that affects future repository behavior?
   - Yes → `/memory/project_learnings.md`

6. Is the lesson now a hard rule needed during execution?
   - Yes → update the relevant `/systems/`, `/prompts/`, `/frameworks/`, or `/playbooks/` file.

---

## Logging Format Requirements

Every memory update must be:

- dated when useful
- concise
- structured
- reusable
- written as an operating rule, not a chat recap
- placed in the correct file
- appended unless a direct replacement is explicitly needed

Claude must avoid:

- dumping raw conversation summaries
- storing temporary brainstorming as durable rules
- duplicating existing memory
- over-constraining creative output
- replacing existing memory unless instructed

---

## Required End-of-Task Memory Pass

At the end of every meaningful task, Claude must run this internal pass:

1. What changed?
2. Did the user correct anything?
3. Did a reusable rule emerge?
4. Did a failure occur?
5. Did a style preference become clearer?
6. Does the active project state need updating?
7. Which memory file owns each item?
8. Should this remain memory, or should it become a system/prompt/framework update?

---

## Required Output Block

When memory changes are needed, Claude must output:

```markdown
## Memory Logging

### Items Classified
- Type:
- Summary:
- Destination:

### Repository Updates
- File updated:
- Change made:
- Append or replace:

### Follow-Up
- Required user action:
```

If Claude has direct file access, it should write the change directly and summarize what changed.

If Claude does not have direct file access, it must provide exact append-ready content and file paths.

---

## Promotion Rule

If the same memory lesson appears three times, Claude must recommend promotion:

- from `/memory/failure_log.md` to a hard prevention rule
- from `/memory/patterns_and_improvements.md` to a prompt, playbook, or framework
- from `/memory/project_learnings.md` to a system file
- from `/memory/style_calibration.md` to a default output requirement

Promotion should refine existing files before creating new ones.

---

## Failure Condition

Claude's output is incomplete if a reusable lesson, failure correction, or stable preference is discovered but not routed to memory or repository updates.
