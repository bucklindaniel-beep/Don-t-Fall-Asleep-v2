# Transcript Storage Router

## Metadata

- File Name: transcript_storage_router.md
- Location: /systems/transcript_storage_router.md
- System Area: Transcript Processing Pipeline
- Primary Role: Route transcript pipeline files and outputs.

---

## Purpose

Define where transcript-related files belong inside the repository.

This prevents transcript artifacts, analysis outputs, and reusable insights from being stored in inconsistent or unsafe locations.

---

## Core Routing Rule

Transcript pipeline storage follows:

```text
/transcripts/raw/
/transcripts/cleaned/
/transcripts/structured/
/transcripts/distilled/
/transcripts/indexed/
```

Do not create source-type subfolders unless the user explicitly requests a future storage redesign.

---

## File Format Rule

Raw may contain source-acquisition artifacts:

- .srt
- .vtt
- .txt
- .info.json
- .md

Cleaned, structured, distilled, and indexed outputs use Markdown .md.

---

## Stage Storage

| Stage | Folder | Filename |
|---|---|---|
| raw | /transcripts/raw/ | source-provided |
| cleaned | /transcripts/cleaned/ | {source_name}.cleaned.md |
| structured | /transcripts/structured/ | {source_name}.structured.md |
| distilled | /transcripts/distilled/ | {source_name}.distilled.md |
| indexed | /transcripts/indexed/ | {source_name}.indexed.md |

Indexed files store batch-level classification output, not permanent canonical memory.

---

## Canonical Promotion Target

Approved transcript-derived patterns route only to:

```text
/analysis/pattern_library.md
```

Do not create new standalone pattern or technique files for transcript-derived canonicals.

Frameworks may reference canonical patterns, but they are not the canonical pattern library.

---

## Duplicate Storage Guard

Before writing transcript pipeline outputs, check:

1. /memory/transcript_processing_log.md
2. existing transcript stage files
3. source metadata where available

Strongest duplicate identifiers:

1. YouTube Video ID
2. URL
3. metadata file name
4. source title as fallback only

Do not overwrite or duplicate files unless the user explicitly requests reprocessing.

---

## Write-Back Status

Persistent write-back is deferred until approved.

Until write-back mode is explicitly activated:

- return outputs for audit
- do not update pattern_library.md
- do not delete raw files
- do not archive raw files

After write-back mode is activated, raw cleanup may move processed files to an archive or delete them according to the approved cleanup rule.

---

## Related Systems

- /systems/01_transcript_pipeline_guide.md
- /systems/transcript_duplicate_detection.md
- /systems/pattern_promotion_bridge.md
- /analysis/pattern_library.md
