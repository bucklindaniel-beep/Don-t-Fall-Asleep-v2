# Image Prompt Export System

## Purpose
Convert Stage 6 image prompts into script-ready prompt files without calling the OpenAI API.

## Scope
This system standardizes prompt export only. API execution remains external.

## Export Requirements
Each prompt record must include:
- story ID
- scene ID
- shot ID
- filename stem
- prompt text
- visual continuity locks
- negative constraints when required
- emotional target when present

## Filename Convention
Use stable, sortable names:

`{story_id}_scene_{scene_number}_shot_{shot_number}.png`

Example:

`apartment_changes_scene_06_shot_14.png`

## Rules
- One prompt per shot.
- Preserve shot IDs from the approved shotlist.
- Do not merge prompts.
- Do not generate images inside Claude.
- Keep continuity locks available for batch review.
- Use negative constraints only at high-risk continuity points.

## Batch Grouping
Recommended groups:
- baseline/reference shots
- anomaly shots
- climax shots
- final resolution shots

## Failure Handling Notes
Future scripts should support:
- retry failed prompts only
- keep successful outputs
- avoid overwriting unless explicitly requested
- log prompt ID, filename, status, and error message
