# Transcript Source Metadata Rules

## Purpose

Define how transcript source metadata is represented, preserved, and used across the transcript pipeline.

Metadata exists to keep analysis source-aware without allowing transcript content to become generation material.

---

## Core Rule

All cleaned, structured, distilled, and indexed transcript files must include a structured metadata block before analysis content.

Metadata is added during post-processing, not during raw ingestion.

---

## Required Metadata Fields

Every cleaned transcript must include:

- Source Type
- Source File
- Processed At
- Pipeline Stage
- Next Stage
- Usage Rule

---

## YouTube Metadata Fields

For YouTube transcripts, use:

- Source Type: youtube_video
- Title
- Channel
- URL
- Video ID
- Upload Date
- Duration Seconds
- Metadata File

---

## Pipeline Placement

Metadata tagging belongs in:

```text
/powershell_scripts/post_process_transcript.ps1
```

Do not add source classification logic to:

```text
/powershell_scripts/ingest_youtube_transcript.ps1
```

The ingestion script must remain a simple file-acquisition layer.

---

## Valid Raw Ingestion Files

The raw transcript folder may contain source-acquisition formats such as:

- `.srt`
- `.vtt`
- `.txt`
- `.info.json`

This is allowed because raw ingestion preserves original source artifacts.

All later stages should use Markdown:

```text
/transcripts/cleaned/*.md
/transcripts/structured/*.md
/transcripts/distilled/*.md
/transcripts/indexed/*.md
```

---

## Claude Usage Rules

Claude may use transcript metadata for:

- Source-aware analysis.
- Transcript organization.
- Duplicate detection.
- Pattern extraction.
- Source category filtering.
- Future comparison across YouTube, Reddit, books, scripts, or other sources.

Claude must not:

- Copy source phrasing into generation.
- Treat raw transcripts as generation material.
- Infer missing metadata unless clearly marked as inferred.
- Bypass transcript pipeline stages.

---

## Approved Flow

```text
raw
-> cleaned with metadata
-> structured with metadata preserved
-> distilled with source-safe insights
-> indexed for reusable system knowledge
```

---

## Boundary Rule

PowerShell may preserve and transfer metadata.

Claude is responsible for analysis, segmentation, pattern extraction, and distillation.

Scripts must not replace Claude's reasoning layer.
