# Scripts

This folder contains local execution scripts for the production pipeline.

These scripts are execution infrastructure, not Claude system logic.

## Required Tools

- yt-dlp
- FFmpeg
- PowerShell 7 recommended

## File Overview

### ingest_youtube_transcript.ps1

Purpose:
- Pulls a YouTube transcript/subtitle file into `/transcripts/raw`.

Run:
```powershell
.\ingest_youtube_transcript.ps1
```

Use when:
- You only want the raw transcript file.
- You are testing yt-dlp ingestion by itself.

---

### post_process_transcript.ps1

Purpose:
- Cleans raw `.srt`, `.vtt`, or `.txt` transcript files.
- Removes timestamps, subtitle numbering, common subtitle tags, and duplicate lines.
- Reads available `.info.json` metadata from yt-dlp.
- Outputs metadata-rich cleaned `.md` files into `/transcripts/cleaned`.

Run:
```powershell
.\post_process_transcript.ps1
```

Use when:
- Raw transcripts already exist in `/transcripts/raw`.
- You want to clean and metadata-tag them before Claude analysis.

---

### run_youtube_transcript_pipeline.ps1

Purpose:
- Runs transcript ingestion and post-processing together.
- Pulls transcript + metadata with yt-dlp.
- Calls `post_process_transcript.ps1`.
- Outputs cleaned transcript files.

Run:
```powershell
.\run_youtube_transcript_pipeline.ps1
```

Use when:
- You want the normal end-to-end YouTube transcript ingest flow.

## Current Transcript Flow

```text
YouTube URL
→ yt-dlp
→ /transcripts/raw
→ post_process_transcript.ps1
→ /transcripts/cleaned
→ manual review
→ structured
→ distilled
→ indexed
```

## Rules

- Keep `.ps1` files in `/scripts` or `/powershell_scripts`.
- Do not place scripts inside `/systems`, `/prompts`, or `/frameworks`.
- Do not store API keys in scripts.
- Use `.env`, environment variables, or secure local config for secrets later.
- Raw transcripts are for analysis only.
- Do not use raw source language directly in story generation.
- Source metadata belongs in cleaned transcript markdown, not raw transcript files.

## Future Improvements

- Add batch URL ingestion.
- Add transcript quality checks.
- Add structured transcript generation.
- Add logging to `/logs`.
