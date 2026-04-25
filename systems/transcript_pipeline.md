# transcript_pipeline.md

## Purpose
Define the structure for moving horror narration transcripts through the repository so they can be transformed into reusable storytelling patterns without copying or imitating source material.

This file is a structure and workflow guide only. Full automation and optimization will be handled later as a separate system improvement.

---

## Current Status
This pipeline is not yet automated.

At this stage, transcripts must be processed manually or semi-manually from one stage to the next.

Future work should define:
- automatic transcript intake
- cleaning scripts
- structured analysis prompts
- pattern extraction rules
- indexing format
- validation checks
- memory update workflow

---

## Core Rule
Raw transcripts are reference material only.

Claude must never generate new stories by copying, rewriting, or directly imitating transcript content.

Transcripts may only be used to extract:
- pacing patterns
- structure patterns
- escalation techniques
- narration techniques
- retention mechanics
- scene transition methods
- audience engagement strategies

---

## Transcript Folder Flow

```text
/transcripts/
  raw/
  cleaned/
  structured/
  distilled/
  indexed/
```

---

## Stage 1: Raw

### Path
`/transcripts/raw/`

### Purpose
Store untouched source transcripts exactly as collected.

### Rules
- Do not edit meaning
- Do not summarize
- Do not restructure
- Preserve original source text
- Keep each transcript in its own file

### Output
A raw transcript file ready for cleaning.

---

## Stage 2: Cleaned

### Path
`/transcripts/cleaned/`

### Purpose
Convert raw transcript text into readable formatting.

### Allowed Changes
- fix punctuation
- break into paragraphs
- remove obvious filler
- correct spacing
- improve readability

### Not Allowed
- adding new meaning
- changing story events
- rewriting style
- summarizing too aggressively

### Output
A readable transcript that preserves original meaning.

---

## Stage 3: Structured

### Path
`/transcripts/structured/`

### Purpose
Break the cleaned transcript into identifiable storytelling components.

### Extract
- hook
- setup
- escalation beats
- reveals
- reversals
- tension peaks
- scene transitions
- ending type
- pacing shifts
- narrator behavior
- audience retention moments

### Output
A structured analysis file showing how the transcript works.

---

## Stage 4: Distilled

### Path
`/transcripts/distilled/`

### Purpose
Convert structured analysis into reusable principles and techniques.

### Extract
- repeatable storytelling patterns
- pacing tactics
- suspense-building methods
- framing devices
- escalation structures
- narration techniques
- visual or sensory motifs
- engagement strategies

### Not Allowed
- copying phrases
- copying scenes
- copying characters
- copying plot events
- preserving source-specific identity

### Output
A distilled pattern file that can safely inform future generation.

---

## Stage 5: Indexed

### Path
`/transcripts/indexed/`

### Purpose
Create searchable references that help Claude retrieve useful patterns without relying on raw transcript text.

### Index Entries Should Include
- source title or internal ID
- genre tags
- technique tags
- pacing notes
- structure type
- ending type
- reusable pattern references
- related distilled file path

### Output
An index record that points to safe, reusable learnings.

---

## Manual Processing Workflow

Until automation exists, process one transcript at a time:

1. Save original transcript in `/transcripts/raw/`
2. Create cleaned version in `/transcripts/cleaned/`
3. Analyze cleaned version into `/transcripts/structured/`
4. Convert analysis into reusable patterns in `/transcripts/distilled/`
5. Add searchable reference entry in `/transcripts/indexed/`

Do not skip stages.

---

## Future Automation Requirement

This item remains open on the system To-Do list.

The future automated version should allow Claude or a script to move one transcript through:

```text
raw → cleaned → structured → distilled → indexed
```

The automation should include:
- stage-specific prompts
- validation checks
- safe-use restrictions
- file naming rules
- duplicate detection
- pattern promotion hooks
- logging to `execution_log.md`

---

## Relationship to Other Files

### Connects to:
- `/logs/execution_log.md`
- `/systems/autonomy_rules.md`
- `/systems/output_format_rules.md`
- future `/systems/pattern_promotion_system.md`

### Supports:
- safe transcript use
- originality protection
- future pattern extraction
- long-term memory improvement
- higher-quality story generation

---

## Safety Rule
Transcript content must be transformed into abstract, reusable system knowledge before it can influence generation.

Raw or cleaned transcript content should never be used directly as generation material.

---

## Summary Rule
Do not copy transcripts.

Study them, structure them, distill them, index them, and convert them into reusable production logic.
