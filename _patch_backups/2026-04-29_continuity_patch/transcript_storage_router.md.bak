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

Place ingestion-ready raw `.md` files directly in `/transcripts/raw/` unless the execution router is later updated for recursive folder scans.

Do not create source-type subfolders unless the user explicitly requests a future storage redesign.

---

## Raw Metadata Rule

Raw transcript metadata is structural scaffolding, not story content.

Creator, original title, and URL may be unknown during local ingest.

Use truthful placeholders when source metadata is unavailable:

```text
Creator: unknown
URL: local_ingest
```

Do not guess creator, channel, URL, or original title.

Core transcript intelligence is content-driven. Metadata-enhanced systems may patch source metadata later.

---

## Multi-Story File Rule

A raw file may contain multiple story sections:

```text
## Story 01 — Functional Title
```

Each story section is an independent analysis unit.

Required preservation through all stages:

- source name
- story ID
- functional title
- source file path

Batch-level outputs may aggregate patterns only after story-level analysis is complete.

---

## File Format Rule

Raw may contain source-acquisition artifacts:

- .srt
- .vtt
- .txt
- .info.json
- .md

Cleaned, structured, distilled, and indexed outputs use Markdown `.md`.

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
2. /logs/execution_log.md when relevant
3. existing transcript stage files
4. source metadata where available

Strongest duplicate identifiers:

1. YouTube Video ID
2. URL
3. source file name
4. exact title + creator when known
5. story ID inside source file

Do not overwrite or duplicate files unless the user explicitly requests reprocessing.

---

## Write-Back Status

Persistent write-back is controlled by:

```text
/systems/write_back_protocol.md
```

Until WRITE-BACK MODE is explicitly activated:

- return outputs for audit
- do not update pattern_library.md
- do not delete raw files
- do not archive raw files

After WRITE-BACK MODE is activated, raw cleanup still requires separate artifact cleanup approval.

---

## Related Systems

- /systems/01_transcript_pipeline_guide.md
- /systems/transcript_duplicate_detection.md
- /systems/pattern_promotion_bridge.md
- /systems/write_back_protocol.md
- /analysis/pattern_library.md
