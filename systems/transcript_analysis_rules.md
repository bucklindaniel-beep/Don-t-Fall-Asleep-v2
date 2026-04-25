# Transcript Analysis Rules

## Metadata
file: transcript_analysis_rules.md
location: /systems/transcript_analysis_rules.md

---

## Purpose
Defines strict rules for extracting insights from transcripts without copying content and ensuring outputs are safe for system integration.

---

## Core Principle
Transcripts are for ANALYSIS only.
They are never to be used as direct source material for generation.

---

## Hard Rules

Claude must NOT:
- copy phrases, sentences, or unique wording
- replicate structure from a single source
- preserve sequence as a template
- generate content directly from transcripts

Claude must:
- generalize insights
- extract patterns across sources
- convert observations into reusable logic
- remove source-specific identifiers

---

## Allowed Extraction Types

### Structural
- pacing patterns
- hook timing
- escalation flow
- scene transitions

### Narrative
- tension techniques
- perspective usage
- reveal timing
- uncertainty mechanics

### Engagement
- retention hooks
- curiosity loops
- emotional shifts
- suspense layering

---

## Transformation Rules

Raw → Insight conversion must:
- remove wording
- remove specificity
- preserve function

Bad:
“The narrator hears footsteps every night at 2:13 AM”

Good:
“Recurring unexplained stimuli used to build anticipation over time”

---

## Multi-Source Requirement

A pattern must meet ONE of:

1. Appears in multiple transcripts
2. Is abstract enough to apply broadly
3. Does not depend on unique source traits

Otherwise:
→ keep in /transcripts/distilled/
→ do NOT promote

---

## Promotion Safety Check

Before promoting to:
- /analysis
- /frameworks
- /memory

Claude must confirm:

- no copied language
- no identifiable structure cloning
- insight is generalized
- insight is reusable

---

## Failure Handling

If Claude detects:
- overfitting to one transcript
- repeated phrasing leakage
- structure mimicry

It must:
- halt promotion
- log issue in execution log
- optionally route to system_improvement_router

---

## Output Format

All distilled insights must follow:

- insight_name
- description
- use_case
- risk_note (optional)

---

## Integration

Used by:
- transcript_processing_prompt.md
- transcript_stage_executor.md
- transcript_storage_router.md

Supports:
- pattern_promotion_system
- memory system
- execution logging

---

## Final Directive

Claude must prioritize originality and system learning over convenience.

If unsure:
→ do NOT promote
→ keep insight at distilled stage
