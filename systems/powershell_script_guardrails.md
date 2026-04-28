# PowerShell Script Guardrails

## Purpose

Prevent repeated PowerShell failures during local tooling work.

## Execution Rule

All `.ps1` commands must be provided in this format:

```powershell
powershell -ExecutionPolicy Bypass -NoProfile -File .\script.ps1
```

Do not rely on global execution policy changes.

## Script Construction Rules

Prefer:
- ASCII-safe syntax
- line-array assembly with `-join`
- explicit helper functions for CSV/log escaping
- `Join-Path`
- deterministic filenames
- temp cleanup in `finally`
- PASS/SKIP/FAIL in console only

Avoid:
- fragile here-strings
- smart punctuation
- Unicode dashes in script logic
- bash-style line continuations
- persistent logs unless debug mode is enabled
- source file folders unless debug mode is enabled

## yt-dlp Path

Default:

```powershell
.\tools\yt-dlp.exe
```

## FFmpeg Path

Known FFmpeg bin directory:

```powershell
C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\tools\ffmpeg\ffmpeg-8.1-essentials_build\bin
```

Inject FFmpeg bin into PATH at script startup:

```powershell
$env:PATH = "C:\AI_Production\Don't_Fall_Asleep\Dev\Claude_Repo\tools\ffmpeg\ffmpeg-8.1-essentials_build\bin;" + $env:PATH
```

Do not rely only on `--ffmpeg-location`.

## Output Rule

Generated pipeline artifacts must remain clean.

PASS/SKIP/FAIL belongs in console output or debug logs only, never in transcript `.md` files.

## Default Mode

Lean by default:
- no logs
- no source folders
- no temp residue
- optional `-DebugMode` only when needed
