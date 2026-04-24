# Horror Knowledge Base

A modular production system for building high-retention horror stories, narration scripts, scene systems, visual prompts, and AI-assisted creative workflows.

## Purpose

This repository helps transform source material, analysis, memory, and reusable production logic into structured horror outputs.

It supports:

- transcript ingestion and cleanup
- pattern, style, and technique extraction
- story, scene, narrator, visual, and editing-system execution
- repository-guided Claude production workflows
- memory logging and continuous improvement
- reusable prompts, templates, maps, playbooks, and wordbanks

## Core Workflow

```plaintext
transcripts -> analysis -> frameworks -> playbooks -> systems -> prompts -> outputs -> memory updates
```

## Layer Responsibilities

- **/transcripts**: raw, cleaned, structured, distilled, and indexed transcript source material
- **/analysis**: extracted techniques, patterns, profiles, entities, and story memory
- **/frameworks**: reusable narrative, pacing, escalation, and construction models
- **/playbooks**: practical execution guides for building stories, scenes, analog horror, and entities
- **/systems**: execution logic, continuity rules, visual systems, narrator systems, memory logging, and repository update rules
- **/prompts**: Claude-ready production prompts built on top of repository logic
- **/memory**: current state, failures, style calibration, project learnings, and reusable improvements
- **/wordbanks**: categorized horror vocabulary and sensory language banks
- **/reference**: foundational writing, voice, API, and production reference material
- **/templates**: reusable templates for consistent files and memory entries
- **/maps**: relationship diagrams and flow maps for system navigation
- **/books**: long-form source/reference material organized by category

## Repository Structure

```plaintext
/analysis
/books
/frameworks
/maps
/memory
/playbooks
/prompts
/reference
/systems
/templates
/transcripts
/wordbanks
README.md
```

## Memory System

The memory layer is part of the production system. Claude should use it to track current project state, failures, style calibration, reusable improvements, and long-term project learnings.

Memory updates should follow:

- `/systems/memory_logging_system.md`
- `/systems/repository_update_system.md`
- `/templates/memory_log_entry_template.md`

Memory files should not replace the main system logic. They should strengthen it by documenting approved learnings and repeatable improvements.

## Source Usage Rule

Raw transcripts and reference material are analysis inputs only. They should be converted into reusable techniques, patterns, frameworks, profiles, or memory entries before being used for generation.

## Naming Standard

Use lowercase, underscore-separated filenames and folders. Avoid spaces, double extensions, duplicate names, and vague titles.
