# System — Transcript file_id Assignment Rules

## Metadata
- File Name: id_assignment_transcript_rules.md
- Location: v2/systems/id_assignment_transcript_rules.md
- Created: 2026-04-29 (continuity patch)
- Distinct from `v2/systems/id_assignment_rules.md`, which governs PATTERN IDs.

## Purpose
Govern how `file_id` values are assigned to transcript pipeline runs.

## Source of Truth
`v2/transcripts/indexed/manifest.md` is the source of truth for the existing transcript `file_id` set.
The live manifest must be read before `file_id` assignment. Memory of prior IDs is not sufficient.

## Core Rule
1. Read the live manifest.
2. Derive the existing `file_id` set.
3. If the candidate raw file's numeric prefix is unused, the `file_id` is the numeric prefix.
4. If the numeric prefix is already used by a different safe source, the `file_id` is the next unused suffix in the sequence `b`, `c`, `d`, ...
5. Never reuse an existing `file_id`.
6. Never reuse an existing `_DUP` marker prefix without explicit user disambiguation.
7. Stop and report if any uncertainty exists.

## Worked Example
- Manifest contains `007` for `paranormal_event_with_proof`.
- Candidate raw is `007_3_true_scary_airbnb_horror_stories.raw.md`.
- `007` is taken by a different source.
- `007b` is unused.
- Assigned `file_id`: `007b`.

## Exclusion List for Assignment
The following raw files are not candidates for `file_id` assignment:
- `_raw.md` / `_raw_2.md` / `_raw_3.md` clutter variants when canonical `.raw.md` files exist
- Any file already represented in the manifest
- Any file under a numeric prefix with multiple distinct canonical raws and no user disambiguation
- Any file matching a `_DUP` source already recorded as `SKIPPED_DUPLICATE`

## Manifest Row Format
| file_id | source_filename | indexed_filename | status | timestamp |

## Stop Conditions
Stop and report `BLOCKED` if:
- Manifest cannot be read
- Multiple distinct raws share the same numeric prefix without disambiguation
- The candidate's title appears to duplicate an existing manifest entry under any file_id
- Output files for the candidate already exist in any pipeline stage

## Related Systems
- `v2/transcripts/indexed/manifest.md` (source of truth)
- `v2/systems/transcript_storage_router.md` (path and filename conventions)
- `v2/systems/transcript_duplicate_detection.md` (duplicate-check order and identifiers)
- `v2/systems/writeback_protocol.md` (write activation rules)
- `v2/systems/pipeline_rules.md` (stage authority and active-with-authorization scope)
