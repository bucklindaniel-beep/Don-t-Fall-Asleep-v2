# Transcript Source Metadata Rules

## Purpose

Define how transcript source metadata must be represented after raw transcript ingestion.

## Core Rule

All cleaned transcript files must include a structured metadata block before transcript content.

Metadata is added during post-processing, not during ingestion.

## Required Metadata Fields

Every cleaned transcript must include:

- Source Type
- Source File
- Processed At
- Pipeline Stage
- Next Stage
- Usage Rule

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

## Pipeline Placement

Metadata tagging belongs in:

```text
/scripts/post_process_transcript.ps1
```

Do not add source classification logic to:

```text
/scripts/ingest_youtube_transcript.ps1
```

The ingestion script must remain a simple file-acquisition layer.

## Claude Usage Rules

Claude may use transcript metadata for:

- source-aware analysis
- transcript organization
- pattern extraction
- source category filtering
- future comparison across YouTube, Reddit, books, scripts, or other sources

Claude must not:

- copy source phrasing into generation
- treat raw transcripts as generation material
- infer missing metadata when structured fields are absent
- bypass the transcript pipeline stages

## Approved Flow

```text
raw
→ cleaned with metadata
→ structured
→ distilled
→ indexed
```
