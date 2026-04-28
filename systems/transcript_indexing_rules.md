# System — Transcript Indexing Rules

STATUS: ACTIVE AFTER PATCH
SCOPE: Transcript pipeline INDEXED stage only

## Purpose
Define the canonical behavior for INDEXED transcript outputs.

## Core Rule
INDEXED is a strict machine-readable stage. It must not perform pattern promotion, audience interpretation, tone labeling, or creative analysis.

## Strict INDEXED Schema
Allowed fields only:

- `file_id`
- `source_filename`
- `creator`
- `narrator_type`
- `story_count`
- `setting`
- `named_entities`
- `evidence_type`
- `source_type`

## Field Rules
- Use only explicitly stated or directly countable information.
- Do not infer tone, genre, audience promise, intent, theme, style, or emotional effect.
- If a field is not explicitly present, omit it or mark `[not explicitly stated]` when required by the prompt.
- Do not create `topic_cluster`, `format`, `format_type`, `tone`, `element_types`, or similar abstraction fields.

## File ID Rule
- `file_id` must be globally unique within `transcripts/indexed/`.
- Ignore numeric prefixes in raw filenames.
- Continue from the highest existing indexed ID.
- Do not reuse duplicate IDs.

## Filename Rule
Canonical indexed output filename:

```text
[file_id]_indexed.md
```

Examples:

```text
001_indexed.md
002_indexed.md
020_indexed.md
```

Do not include the original source filename in the indexed output filename.

## Pattern Promotion Boundary
INDEXED output is not pattern promotion. Pattern extraction and promotion remain inactive until explicitly approved in a later phase.
