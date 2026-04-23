# Repository Update System

Claude may create, edit, and update files in the user's local clone of the GitHub repository when the user is working in a local development environment.

The repository is the persistent operating system for this project.

Claude should improve the repository whenever a reusable lesson, correction, pattern, or system rule is discovered.

---

## WHEN TO UPDATE THE REPOSITORY

Claude SHOULD update repository files when:

- a repeated failure is identified
- a new reusable rule is discovered
- a prompt pattern improves output quality
- a style preference becomes stable
- a continuity rule needs to be preserved
- a generation workflow becomes more efficient
- a missing system file would improve consistency
- a memory log entry should persist beyond the current chat
- the user explicitly asks Claude to add, change, or create files

---

## WHEN NOT TO UPDATE THE REPOSITORY

Claude MUST NOT update repository files when:

- the insight is temporary
- the rule only applies to one scene
- the user is brainstorming and has not committed to a direction
- the change would overwrite an important system without confirmation
- the change conflicts with existing project instructions
- the change reduces output variety by over-constraining generation

---

## FILE UPDATE PRIORITY

When deciding where to write changes, use this order:

1. `/memory/current_state.md`  
   Use for active story state, current pipeline progress, continuity anchors, and immediate next-step context.

2. `/memory/style_calibration.md`  
   Use for stable preferences about narration, pacing, image prompt style, formatting, tone, and user taste.

3. `/memory/failure_log.md`  
   Use for mistakes, weak outputs, repeated issues, and prevention rules.

4. `/memory/patterns_and_improvements.md`  
   Use for reusable generation formulas, prompt structures, shotlist patterns, editing patterns, and workflow improvements.

5. `/memory/project_learnings.md`  
   Use for durable high-level lessons that should affect the whole project.

6. `/systems/`  
   Use only when a learning becomes a hard reusable system rule.

7. `/frameworks/`  
   Use only when the change affects story structure, escalation theory, pacing, or scene construction.

8. `/reference/`  
   Use when adding examples, formatting standards, voice samples, or external reference material.

9. `/wordbanks/`  
   Use when adding vocabulary filters, preferred wording, forbidden phrasing, or tone-specific language banks.

---

## UPDATE DECISION RULE

Before writing to the repository, Claude MUST decide:

1. Is this insight reusable?
2. Will it improve future output?
3. Is it stable enough to preserve?
4. Which file should own it?
5. Should it be memory, a pattern, a failure correction, or a system rule?

If the answer is unclear, log it to `/memory/current_state.md` instead of modifying core systems.

---

## CHANGE SAFETY RULE

Claude MUST avoid destructive edits.

When changing files:

- append before replacing
- preserve existing rules
- mark new entries clearly
- use dates when useful
- keep changes modular
- avoid duplicate rules
- do not delete existing systems unless the user explicitly asks

---

## AUTO-GENERATION RULE

Claude may generate new files when:

- the same type of instruction is being repeated across outputs
- a new reusable subsystem is needed
- a reference file would improve consistency
- examples are needed for calibration
- a workflow can be separated into a modular system

New files should be placed in the most appropriate folder:

- `/systems/` for execution logic
- `/frameworks/` for story and structure logic
- `/reference/` for examples and standards
- `/wordbanks/` for vocabulary
- `/memory/` for accumulated learning

---

## REPOSITORY UPDATE OUTPUT FORMAT

When Claude updates or recommends updates to the repository, it MUST report:

## Repository Updates

### Files Created
- path:
- purpose:

### Files Updated
- path:
- change made:

### Why This Improves the System
- explanation:

### Follow-Up Required
- any manual action needed:

---

## LOCAL WRITE EXECUTION RULE

When Claude has direct tool access to the local repository, Claude should make the file changes directly.

When Claude does not have direct tool access, Claude must output exact file paths and copy-paste-ready content.

---

## MEMORY-TO-REPOSITORY RULE

Memory Logging should not remain only in chat.

After each meaningful execution, Claude should decide whether the Memory Logging section should be written to:

- `/memory/current_state.md`
- `/memory/style_calibration.md`
- `/memory/failure_log.md`
- `/memory/patterns_and_improvements.md`
- `/memory/project_learnings.md`

If useful, Claude should update those files directly or provide exact patch content.

---

## FAILURE CONDITION

The output is invalid if Claude discovers a reusable improvement but fails to either:

- update the relevant repository file, or
- explain exactly where the update should be placed.
