# Write-Back Protocol

## Metadata

- File Name: write_back_protocol.md
- Location: /systems/write_back_protocol.md
- System Area: Persistence / Transcript Intelligence
- Status: active

---

## Purpose

Define when Claude may write transcript intelligence outputs back to the repository.

Write-back converts audited outputs into durable files. It does not replace human audit, canonical pattern checks, or duplicate detection.

---

## Activation Rule

Write-back is OFF by default.

Claude may write files only when the user explicitly says:

```text
write back approved
```

Casual requests such as "save this" or "update the repo" are not sufficient for transcript intelligence write-back unless the target files are explicit.

---

## Write-Back Modes

| Mode | Trigger | Allowed Writes |
|---|---|---|
| Audit Only | default | none |
| Indexed Output Write | write back approved | transcript stage outputs and execution log |
| Pattern Library Update | pattern promotion approved | /analysis/pattern_library.md and related index files |
| Cleanup | artifact cleanup approved | archive or remove processed raw inputs |

---

## Approved Write Targets

Transcript outputs write only to stage folders defined in /systems/transcript_storage_router.md.

Default targets:

```text
/transcripts/cleaned/{source_name}.cleaned.md
/transcripts/structured/{source_name}.structured.md
/transcripts/distilled/{source_name}.distilled.md
/transcripts/indexed/{source_name}.indexed.md
```

Approved canonical pattern updates write only to:

```text
/analysis/pattern_library.md
```

Concise execution notes write to:

```text
/logs/execution_log.md
```

---

## Multi-Story File Rule

If a raw transcript contains multiple sections marked as:

```text
## Story 01 — Functional Title
```

Claude must treat each story section as an independent analysis unit.

Required behavior:

1. Preserve file-level metadata.
2. Preserve story IDs and functional titles.
3. Process each story independently through cleaned, structured, distilled, and indexed logic.
4. Aggregate batch-level results only after story-level analysis is complete.
5. Do not infer a pattern across stories unless it recurs as a mechanic in multiple story units.

---

## Duplicate Guard Before Writing

Before writing any file, check:

1. existing target path
2. /memory/transcript_processing_log.md
3. /logs/execution_log.md when relevant
4. source metadata if available
5. story IDs for multi-story files

If a duplicate exists:

- skip if identical
- merge if safe and explicitly requested
- flag if uncertain

Do not overwrite existing files unless the user explicitly requests replacement.

---

## Pattern Library Update Rules

Pattern library updates require separate approval after audit.

Before editing /analysis/pattern_library.md:

1. Read /analysis/pattern_library.md.
2. Compare every candidate against existing canonicals.
3. Prefer MERGE_WITH_EXISTING or SUBTYPE_OF_EXISTING.
4. Promote only approved high-signal candidates.
5. Preserve existing pattern IDs.
6. Do not invent permanent IDs for unapproved candidates.

---

## Raw Artifact Hygiene

Raw cleanup is not automatic.

Claude may archive or remove processed raw inputs only when the user explicitly says:

```text
artifact cleanup approved
```

Until then, raw inputs remain untouched.

---

## Storage Claim Rule

Claude must not claim that files were saved, updated, archived, or deleted unless the filesystem write or delete operation actually succeeded.

If a write fails, report the failure and do not proceed as if persistence occurred.
