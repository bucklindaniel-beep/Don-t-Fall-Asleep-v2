# Manual Transcript Intake Package — Inactive Patch Candidate

## Status
Reference-only / excluded until Core Dev Controller approves activation.

## Purpose
Combine the current manual systems:
1. Bring transcript down from URL using yt-dlp + FFmpeg.
2. Prepare downloaded transcript files into strict RAW ingestion `.md` format for Claude.

## Intended Flow
```text
youtube_urls.txt
  -> Fetch-TranscriptsFromUrls.ps1
  -> /transcripts/incoming_raw_txt/
  -> Prepare-RawTranscripts.ps1
  -> /transcripts/raw/*.md
```

## Scripts
- `Fetch-TranscriptsFromUrls.ps1` — downloads subtitles/transcripts only; no video/audio download.
- `Prepare-RawTranscripts.ps1` — wraps `.txt`, `.md`, `.srt`, `.vtt` inputs in the RAW transcript template.
- `Run-ManualTranscriptIntake.ps1` — optional manual bridge to run fetch, prep, or both.

## Default Paths
- Repo root: `C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\v2`
- URL file: `C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\youtube_urls.txt`
- yt-dlp: `.\tools\yt-dlp.exe`
- FFmpeg bin: `C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\tools\ffmpeg\ffmpeg-8.1-essentials_build\bin`
- Incoming transcript folder: `.\transcripts\incoming_raw_txt`
- RAW output folder: `.\transcripts\raw`

## Manual Commands
Run from the script folder after approval:

```powershell
powershell -ExecutionPolicy Bypass -NoProfile -File .\Fetch-TranscriptsFromUrls.ps1
```

```powershell
powershell -ExecutionPolicy Bypass -NoProfile -File .\Prepare-RawTranscripts.ps1
```

```powershell
powershell -ExecutionPolicy Bypass -NoProfile -File .\Run-ManualTranscriptIntake.ps1 -Fetch -Prepare
```

## Safety Rules
- No deletes by default.
- No cleaning, summarizing, interpreting, or rewriting transcript wording.
- RAW prep only.
- Console-only PASS/SKIP/FAIL unless `-DebugMode` is used.
- Existing outputs are skipped unless `-Force` is passed.
- Keep excluded until reviewed by Core Dev Controller and System QA.

## Known Limitations
- URL metadata is not automatically carried into RAW metadata yet.
- Story segmentation remains one story per file unless manually split later.
- This package should not replace Claude judgment stages.
