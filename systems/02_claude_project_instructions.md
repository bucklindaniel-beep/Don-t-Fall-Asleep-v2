# Claude Project Instruction Reference

## Purpose

This file documents the relationship between Claude Desktop Project Instructions and repository logic.

Claude Desktop Project Instructions are the active top-level controller.
Repository files define execution logic.

Do not paste full desktop instructions here.
Do not execute this file as a pipeline prompt.

---

## Authority Model

1. Claude Desktop Project Instructions
2. Active repository systems and frameworks
3. Stage-specific prompts
4. Memory and analysis files

When conflict exists, follow the desktop instructions and report the repository conflict.

---

## Required Desktop Instruction Behavior

Claude Desktop Project Instructions should tell Claude to:

- load only files required for the active mode and stage
- follow `/systems/stage_execution_map.md`
- apply `/systems/stage_aware_execution.md` during production runs
- use `/systems/stage_checkpoints.md` when validation, source selection, model switching, duplicate handling, or output approval needs a controlled user decision
- apply repository-defined pattern, scoring, composition, writing-quality, and emotional-targeting systems when relevant
- treat those systems as execution rules, not optional suggestions
- avoid redesigning repository logic during production runs
- avoid direct repository edits unless explicitly instructed
- keep outputs clean and stage-specific

---

## Core Repository References

Load as needed, not globally:

- `/systems/stage_execution_map.md`
- `/systems/stage_aware_execution.md`
- `/systems/stage_checkpoints.md`
- `/systems/output_cleanliness_rules.md`
- `/systems/memory_logging_system.md`
- `/systems/repository_update_system.md`
- `/frameworks/writing_quality_rules.md`
- `/frameworks/10_organic_hook_system.md`
- `/frameworks/11_organic_story_beat_system.md`
- `/frameworks/12_pattern_composition_engine.md`
- `/frameworks/13_pattern_scoring_framework.md`
- `/frameworks/14_emotional_targeting_system.md`

Transcript analysis may also load:

- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_stage_executor.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_duplicate_detection.md`
- `/systems/transcript_source_metadata_rules.md`
- `/systems/transcript_pattern_extraction_rules.md`
- `/memory/transcript_processing_log.md`

Narration formatting and delivery analysis may also load:

- `/frameworks/15_narration_pacing_system.md`
- `/playbooks/05_narration_delivery_playbook.md`
- `/analysis/narration_patterns/`

---

## Layer Separation Rule

Claude must keep system layers separate:

- structure mechanics inform story and scene architecture
- realism mechanics inform believability and grounded escalation
- narration mechanics inform sentence rhythm, pause placement, and delivery timing
- retention mechanics inform pacing and watch-time support

Narration references must not override structure logic or cause creator imitation.

---

## Duplicate Detection Rule

Before transcript batch processing or writing distilled/indexed analysis, Claude must apply:

- `/systems/transcript_duplicate_detection.md`
- `/systems/transcript_storage_router.md`
- `/memory/transcript_processing_log.md`

Exact duplicates should be skipped.
Near-duplicates should be merged only when they add useful new mechanics.
Conflicts should be flagged instead of overwritten.

---

## Maintenance Rule

Update this file only when the authority model, required references, or repository ownership model changes.
