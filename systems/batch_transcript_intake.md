# Batch Transcript Intake

## Purpose
Download multiple YouTube transcripts into `/transcripts/raw/` without analysis.

## Scope
This system prepares source files only. It does not clean, structure, distill, index, score, or generate from transcripts.

## Inputs
- A text file containing one YouTube video URL per line
- A playlist URL
- A small manually curated batch of target videos

## Output Location
Save all raw transcript assets under:

`/transcripts/raw/`

Each video should preserve:
- source URL
- video ID
- title
- channel
- upload date when available
- subtitle/transcript file
- metadata JSON

## Rules
- Use `yt-dlp` for transcript download before introducing YouTube API complexity.
- Skip unavailable transcripts and log the skip.
- Do not rewrite or summarize during intake.
- Do not copy transcript language into generation outputs.
- Keep transcript intake separate from transcript analysis.

## Execution Boundary
After files are saved to `/transcripts/raw/`, the existing transcript pipeline handles:

`raw → cleaned → structured → distilled → indexed`

## Recommended Use
Use this before transcript intelligence tests to build a larger reference set cheaply and consistently.
