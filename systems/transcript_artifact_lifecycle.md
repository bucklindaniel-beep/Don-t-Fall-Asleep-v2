# Transcript Artifact Lifecycle

## Status

Transcript Intelligence pipeline validation is complete.

Validated stages:
- RAW
- CLEANED
- STRUCTURED
- DISTILLED

## Core Principle

Active repo context should contain canonical data only.

Archive preserves history.
Active directories drive execution.

## Active Directories

```text
/transcripts/raw/
/transcripts/cleaned/
/transcripts/structured/
/transcripts/distilled/
```

## Archive Directories

```text
/transcripts/archive/raw_legacy/
/transcripts/archive/cleaned_legacy/
/transcripts/archive/structured_cache/
/transcripts/archive/distilled_cache/
/transcripts/archive/validation_runs/
/transcripts/archive/debug/
/transcripts/archive/failed_outputs/
/transcripts/archive/pre_patch_snapshots/
/transcripts/archive/misc/
```

## Canonical Storage Rules

| Stage | Storage Rule |
|---|---|
| RAW | Keep as source of truth |
| CLEANED | Keep when validated |
| STRUCTURED | Store only after PASS |
| DISTILLED | Store only after PASS |
| Debug/log/source files | Archive or discard; never active |
| Failed outputs | Archive under failed_outputs only |

## Validation Gate

Do not store STRUCTURED or DISTILLED in active directories unless they pass current criteria.

## Archive Rule

Move stale or legacy files to archive.
Do not delete during validation/scaling unless explicitly approved.

## Token Efficiency Rule

Claude should ignore archive directories unless the task explicitly asks for audit, recovery, or historical comparison.

## Naming Standard

Use:

```text
###_short_slug.stage.md
```

Examples:

```text
001_tube_sock_killer.raw.md
001_tube_sock_killer.cleaned.md
001_tube_sock_killer.structured.md
001_tube_sock_killer.distilled.md
```

Rules:
- numeric prefix
- short slug
- explicit stage suffix
- `.md` only
- no long YouTube ID slugs in canonical filenames
