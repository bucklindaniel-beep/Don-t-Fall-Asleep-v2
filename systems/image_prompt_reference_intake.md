# Image Prompt Reference Intake

## Purpose
Analyze high-quality image prompt examples as reference material without copying prompts, styles, or proprietary phrasing.

## Scope
Reference intake is an analysis layer, not generation logic.

## Approved Source Types
- user-provided prompt examples
- prompt galleries such as PromptHero
- internal successful image prompts
- generated image review notes

## Extraction Rules
Extract mechanics only:
- prompt structure
- subject placement
- camera/lens language
- lighting terms
- style-lock phrasing
- negative constraint usage
- continuity control methods
- prompt density patterns

Do not extract:
- full prompt text
- unique phrasing
- branded styles as direct instructions
- artist imitation language
- copyrighted character/style references

## Routing
Reusable findings should route to:
- `/analysis/image_prompt_patterns.md`
- `/reference/image_prompt_sources.md`
- relevant visual systems only after review

## Boundary
This system must not override Stage 6 image prompt generation rules. It informs future improvements only.
