# Scripts

This folder contains local execution scripts for the production pipeline.

These scripts are execution infrastructure, not Claude system logic.

---

## Folder Structure

```text
/scripts
  /transcripts
  /image_generation
  /audio_generation
```

---

## Required Tools

- yt-dlp
- FFmpeg
- PowerShell 7 recommended

Current local tool paths used by the transcript scripts:

```text
C:\AI Production\Tools\yt-dlp\yt-dlp.exe
C:\AI Production\Tools\ffmpeg\bin
```

The scripts use absolute tool paths, so they can be run from any PowerShell location as long as the repository root path remains correct.

---

## Transcript Scripts

### /scripts/transcripts/ingest_youtube_transcript.ps1

Purpose:
- Pulls a YouTube transcript/subtitle file into `/transcripts/raw`.
- Downloads available `.info.json` metadata.
- Uses FFmpeg for subtitle conversion when needed.

Run from repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\transcripts\ingest_youtube_transcript.ps1 -Url "YOUTUBE_URL"
```

---

### /scripts/transcripts/post_process_transcript.ps1

Purpose:
- Cleans raw `.srt`, `.vtt`, or `.txt` transcript files.
- Removes timestamps, subtitle numbering, common subtitle tags, and duplicate lines.
- Reads available `.info.json` metadata from yt-dlp.
- Outputs metadata-rich cleaned `.md` files into `/transcripts/cleaned`.
- Uses bracket-safe YouTube ID matching.

Run from repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\transcripts\post_process_transcript.ps1
```

---

### /scripts/transcripts/structure_cleaned_transcript.ps1

Purpose:
- Creates structured transcript scaffolds from cleaned transcript files.
- Preserves source metadata.
- Normalizes metadata stage fields.
- Prevents duplicate/conflicting `Pipeline Stage`, `Previous Stage`, and `Next Stage` values.
- Does not analyze story structure.

Run from repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\transcripts\structure_cleaned_transcript.ps1
```

---

### /scripts/transcripts/run_youtube_transcript_pipeline.ps1

Purpose:
- Runs the full local YouTube transcript preparation flow:
  - yt-dlp ingestion
  - post-processing
  - structured scaffold creation
- Checks for duplicate structured files.
- Supports targeted cleanup and reprocessing.

Run normal from repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\transcripts\run_youtube_transcript_pipeline.ps1 -Url "YOUTUBE_URL"
```

Force cleanup and reprocess:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\transcripts\run_youtube_transcript_pipeline.ps1 -Url "YOUTUBE_URL" -ForceReprocess
```

---

## Image Generation Scripts

### /scripts/image_generation/generate_images_from_prompts.ps1

Purpose:
- Generates images from prepared image prompt files.
- Belongs in image generation execution, not transcript processing.

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

- Keep transcript `.ps1` files in `/scripts/transcripts`.
- Keep image-generation `.ps1` files in `/scripts/image_generation`.
- Keep future audio-generation `.ps1` files in `/scripts/audio_generation`.
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
