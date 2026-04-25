# pattern_promotion_system.md

## Purpose
Define how extracted insights (from transcripts, executions, or feedback) are evaluated and promoted into reusable system components without polluting the repository.

---

## Core Principle
Not all insights should become system logic.

Claude must evaluate patterns before promoting them into:
- memory
- frameworks
- prompts
- wordbanks

---

## Promotion Criteria

A pattern MUST meet ALL conditions:

- Repeatable across multiple examples
- Improves output quality or consistency
- Abstract (not tied to specific source content)
- Safe (no copying or derivative risk)
- Generalizable across different stories

If ANY condition fails → do NOT promote.

---

## Promotion Decision Tree

When a new insight is identified:

1. Is it repeatable?
   - No → log only (do not promote)
   - Yes → continue

2. Does it improve quality or consistency?
   - No → discard
   - Yes → continue

3. Is it abstract and non-derivative?
   - No → discard
   - Yes → continue

4. Where does it belong?

---

## Promotion Targets

### 1. Memory (Short-Term / Adaptive)
Path:
`/memory/patterns_and_improvements.md`

Use when:
- pattern is still being validated
- recent improvement or correction
- may evolve with more data

---

### 2. Framework (Core Logic)
Path:
`/frameworks/`

Use when:
- pattern affects structure, pacing, or system behavior
- widely reusable
- stable and validated

---

### 3. Prompt Rule (Execution Layer)
Path:
`/prompts/`

Use when:
- pattern improves prompt construction
- affects how Claude generates outputs
- enhances consistency across runs

---

### 4. Wordbank (Content Layer)
Path:
`/wordbanks/`

Use when:
- pattern is vocabulary-based
- reusable descriptive elements
- tone, atmosphere, or sensory detail

---

## Non-Promotion Rule

If a pattern is:
- one-off
- too specific
- stylistically tied to a source
- not clearly beneficial

→ DO NOT promote

Instead:
- log in `execution_log.md` for reference

---

## Logging Requirement

When a pattern is promoted, Claude MUST log:

- pattern description
- why it was promoted
- destination (memory, framework, prompt, wordbank)
- expected impact

---

## Safety Rule

Claude MUST ensure:

- no direct phrases from source material are used
- no identifiable structures are replicated
- all patterns are abstracted before promotion

---

## Future Automation Note

This system is currently manual/semi-manual.

Future improvements should include:

- automatic pattern detection
- confidence scoring
- duplicate pattern detection
- promotion validation layer
- integration with transcript pipeline
- integration with execution logging

---

## Relationship to Other Systems

Works with:
- `/systems/transcript_pipeline.md`
- `/logs/execution_log.md`
- `/systems/autonomy_rules.md`

Supports:
- long-term system learning
- output quality improvement
- controlled system evolution

---

## Summary Rule

Only promote patterns that are:
- repeatable
- useful
- safe
- abstract

Everything else should be logged, not added to the system.
