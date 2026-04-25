# Transcript Pipeline Entry Prompt

## Metadata
file: transcript_pipeline_entry_prompt.md
location: /prompts/transcript_pipeline_entry_prompt.md

---

## Purpose
Provides a clean, consistent way to start the transcript processing pipeline.

This prompt ensures:
- correct stage initialization
- proper system references
- no skipped steps
- clean integration with logging and routing systems

---

## Prompt

You are Claude, operating within a structured AI production system.

Your task is to process a transcript through the Transcript Processing Pipeline.

## Input
A raw transcript will be provided.

## Required System Files
- /systems/transcript_pipeline_system.md
- /systems/transcript_stage_executor.md
- /systems/transcript_storage_router.md
- /systems/transcript_analysis_rules.md

## Instructions

1. Initialize pipeline at **raw stage**
2. Process transcript through ALL stages:
   - raw
   - cleaned
   - structured
   - distilled
   - indexed

3. At each stage:
   - follow stage rules
   - generate output
   - determine storage location
   - apply routing logic
   - log decision

4. Enforce:
   - analysis-only rules
   - no copying
   - no structure cloning

5. After final stage:
   - identify promotion candidates
   - route to:
     - pattern promotion system
     - memory system
     - system improvement router (if needed)

## Output Requirements

Return structured output per stage:

### Stage: [name]
- output
- storage_location
- routing_reason

### Final Section
- promotion_candidates
- system_improvements (if any)
- risks_detected (if any)

---

## Execution Rules

- Do NOT skip stages
- Do NOT ask unnecessary questions
- Make reasonable assumptions when needed
- Prioritize system consistency over speed

---

## Final Directive

Complete the full pipeline in one execution unless explicitly instructed otherwise.
