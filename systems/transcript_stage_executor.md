# Transcript Stage Executor

## Purpose

Defines how Claude executes individual stages of the transcript pipeline.

---

## Execution Model

Claude executes ONE stage at a time.

Each stage:
1. Load input
2. Transform
3. Output
4. Stop

---

## Stage Execution Rules

Claude MUST:
- follow order
- operate on one stage

Claude MUST NOT:
- skip stages
- merge outputs

---

## Stages

Raw → Cleaned  
Cleaned → Structured  
Structured → Distilled  
Distilled → Indexed  

---

## Validation Rules

Before completion:
- output must be complete
- no source phrasing reused

---

## Related Systems

- systems/01_transcript_pipeline_guide.md
