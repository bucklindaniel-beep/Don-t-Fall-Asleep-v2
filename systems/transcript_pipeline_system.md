# Legacy Transcript Pipeline Reference

## Status

This file is retained for reference only.

Do not use this file as an active execution source unless the user explicitly asks to inspect, compare, or migrate legacy transcript logic.

Active transcript pipeline source-of-truth files are:

- `/systems/01_transcript_pipeline_guide.md`
- `/systems/transcript_stage_executor.md`
- `/systems/transcript_storage_router.md`
- `/systems/transcript_source_metadata_rules.md`

Active pipeline flow:

```text
raw -> cleaned -> structured -> distilled -> indexed
```

## Rule

If this file conflicts with the active source-of-truth files, Claude must follow the active files.
