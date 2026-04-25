# PowerShell Scripts

This folder contains local execution scripts for the production pipeline.

These scripts are execution infrastructure, not Claude system logic.

---

## Required Tools

- yt-dlp
- FFmpeg
- PowerShell 7 recommended

Current local tool paths used by the scripts:

```text
C:\AI Production\Tools\yt-dlp\yt-dlp.exe
C:\AI Production\Tools\ffmpeg\bin
```

The scripts use absolute tool paths, so they can be run from any PowerShell location as long as the repository root path remains correct.

---

## Script Overview

### ingest_youtube_transcript.ps1

Purpose:
- Pulls a YouTube transcript/subtitle file into `/transcripts/raw`.
- Downloads available `.info.json` metadata.
- Uses FFmpeg for subtitle conversion when needed.

Run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\ingest_youtube_transcript.ps1 -Url "YOUTUBE_URL"
```

Use when:
- You only want raw transcript artifacts.
- You are testing yt-dlp ingestion by itself.

---

### post_process_transcript.ps1

Purpose:
- Cleans raw `.srt`, `.vtt`, or `.txt` transcript files.
- Removes timestamps, subtitle numbering, common subtitle tags, and duplicate lines.
- Reads available `.info.json` metadata from yt-dlp.
- Outputs metadata-rich cleaned `.md` files into `/transcripts/cleaned`.
- Uses bracket-safe YouTube ID matching.

Run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\post_process_transcript.ps1
```

Use when:
- Raw transcripts already exist in `/transcripts/raw`.
- You want to clean and metadata-tag them before Claude analysis.

---

### structure_cleaned_transcript.ps1

Purpose:
- Creates structured transcript scaffolds from cleaned transcript files.
- Preserves source metadata.
- Normalizes metadata stage fields.
- Prevents duplicate/conflicting `Pipeline Stage`, `Previous Stage`, and `Next Stage` values.
- Does not analyze story structure.

Run:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\structure_cleaned_transcript.ps1
```

Use when:
- Cleaned transcripts already exist.
- You want Claude-ready structured scaffold files.

---

### run_youtube_transcript_pipeline.ps1

Purpose:
- Runs the full local YouTube transcript preparation flow:
  - yt-dlp ingestion
  - post-processing
  - structured scaffold creation
- Checks for duplicate structured files.
- Supports targeted cleanup and reprocessing.

Run normal:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\run_youtube_transcript_pipeline.ps1 -Url "YOUTUBE_URL"
```

Force cleanup and reprocess:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\run_youtube_transcript_pipeline.ps1 -Url "YOUTUBE_URL" -ForceReprocess
```

Use when:
- You want the normal end-to-end YouTube transcript preparation flow.

---

## Current Transcript Flow

```text
YouTube URL
-> yt-dlp
-> /transcripts/raw
-> post_process_transcript.ps1
-> /transcripts/cleaned
-> structure_cleaned_transcript.ps1
-> /transcripts/structured
-> Claude structured analysis
-> /transcripts/distilled
-> /transcripts/indexed
```

---

## Rules

- Keep `.ps1` files in `/powershell_scripts`.
- Do not place scripts inside `/systems`, `/prompts`, or `/frameworks`.
- Do not store API keys in scripts.
- Use `.env`, environment variables, or secure local config for secrets later.
- Raw transcripts are for analysis only.
- Do not use raw source language directly in story generation.
- Source metadata belongs in cleaned and later-stage markdown.
- PowerShell prepares files; Claude performs analysis.

---

## Known Boundaries

Scripts may:
- ingest
- clean
- preserve metadata
- scaffold structured files
- check duplicates
- force reprocess

Scripts must not:
- determine final story boundaries
- extract patterns
- distill insights
- promote system behavior
- modify memory files without explicit future design

---

## Future Improvements

- Add batch URL ingestion.
- Add transcript quality checks.
- Add structured-stage validation.
- Add `/logs` script logging.
- Add configurable local path file.
