# Transcript Stage Executor

## Purpose
Enforces strict stage-by-stage execution of the transcript pipeline.

## Rules
- Claude MUST NOT skip stages
- Claude MUST complete one stage before moving to the next
- Claude MUST log outputs at each stage
- Claude MUST respect stage-specific rules

## Stages
1. Raw Ingestion
2. Cleaning
3. Structuring
4. Distillation
5. Indexing

## Execution Logic
- Input → Validate stage
- Apply stage rules
- Generate output
- Log output
- Route output to storage

## Integrations
- transcript_pipeline_system.md
- memory system
- pattern promotion system
- execution logging

## Output
- Stage-complete structured data
