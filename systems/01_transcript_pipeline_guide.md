# System — Transcript Pipeline Guide

## Metadata
- Type: System
- Domain: Workflow / Knowledge Ingestion
- Primary Use Cases:
  - processing raw transcripts
  - building analysis library
  - scaling repository knowledge
- Retrieval Tags:
  - transcript pipeline
  - ingestion workflow
  - analysis pipeline
  - knowledge system
- System Role:
  - defines end-to-end pipeline for transcript processing
  - standardizes how data enters the system
  - ensures consistency and scalability
- Related Files:
  - /prompts/05_transcript_analysis_prompt.md
  - /prompts/07_technique_extraction_prompt.md
  - /prompts/08_pattern_extraction_prompt.md
  - /prompts/06_channel_profile_generator_prompt.md
- Status: active
- Confidence: high

---

## Rule

This file defines workflow and orchestration ONLY.

It does NOT define:
- techniques
- patterns
- frameworks

---

## Purpose

This system converts raw transcripts into structured, reusable system knowledge.

Raw transcripts are unstructured data.

This pipeline transforms them into:

- structured analysis  
- reusable techniques  
- repeatable patterns  
- channel profiles  
- style profiles  
- entity inspiration  
- framework improvements  

---

## Pipeline Overview

1. Collect Transcript  
2. Clean Transcript  
3. Analyze Transcript  
4. Extract Techniques  
5. Extract Patterns  
6. Update Channel Profile  
7. Update Style Profile  
8. Extract Entity Inspiration  
9. Update Frameworks  
10. Store Outputs  

---

## Step-by-Step Workflow

### Step 1 — Collect Transcript

Sources may include:

- YouTube videos  
- scripts  
- audio transcriptions  
- film or screenplay excerpts  
- analog horror transcripts  

Requirements:

- full text  
- minimal missing sections  

---

### Step 2 — Clean Transcript

Use:
/prompts/05_transcript_analysis_prompt.md (cleaning step only)

Actions:

- fix grammar  
- remove filler  
- remove repetition  
- preserve meaning  

Output:

- cleaned transcript  

Store in:

/transcripts/cleaned/

---

### Step 3 — Analyze Transcript

Use:
/prompts/05_transcript_analysis_prompt.md

Output:

- summary  
- structure  
- pacing  
- style notes  

Store in:

/transcripts/structured/

---

### Step 4 — Extract Techniques

Use:
/prompts/07_technique_extraction_prompt.md

Output:

- techniques  
- definitions  
- evidence  

Store in:

/analysis/techniques/

Rule:

- only add NEW techniques  
- avoid duplicates  

---

### Step 5 — Extract Patterns

Use:
/prompts/08_pattern_extraction_prompt.md

Output:

- structural patterns  
- sequence definitions  

Store in:

/analysis/patterns/

---

### Step 6 — Update Channel Profile

Use:
/prompts/06_channel_profile_generator_prompt.md

Output:

- refined channel structure  
- pacing model  
- narrative format  

Store in:

/analysis/channel_profiles/

Rule:

- update profiles ONLY using repeated patterns across multiple transcripts  
- do NOT base a profile on a single transcript  

---

### Step 7 — Update Style Profile

Output:

- narration tone  
- sentence structure  
- pacing rhythm  
- delivery style  

Store in:

/analysis/style_profiles/

Rule:

- capture voice characteristics  
- avoid copying phrases  

---

### Step 8 — Extract Entity Inspiration

Output:

- threat introduction patterns  
- escalation behavior  
- perception manipulation  
- presence techniques  

Store in:

/analysis/entity_inspiration/

Rule:

- abstract behavior patterns only  
- do NOT store specific story elements  

---

### Step 9 — Update Frameworks

Output:

- improvements to:
  - retention mechanics  
  - escalation models  
  - scene construction logic  

Store in:

/frameworks/

Rule:

- only update frameworks when patterns appear consistently across sources  

---

### Step 10 — Store Outputs

Final structure:

/transcripts/raw/  
/transcripts/cleaned/  
/transcripts/structured/  
/analysis/techniques/  
/analysis/patterns/  
/analysis/channel_profiles/  
/analysis/style_profiles/  
/analysis/entity_inspiration/  
/frameworks/  

Rule:

- create new files per transcript  
- do NOT overwrite existing analysis unless refining  

---

## Transcript Source Classification

Transcripts must be classified before analysis.

### YouTube Narration

Best for:

- pacing  
- retention mechanics  
- escalation structure  
- voice delivery  

---

### Film / Screenplay

Best for:

- scene construction  
- visual staging  
- dialogue rhythm  
- reveal timing  

---

### Analog Horror

Best for:

- fragmentation  
- ambiguity  
- environmental storytelling  
- pattern-based horror  

---

### User Scripts

Best for:

- custom pattern development  
- testing system behavior  

---

## Multi-Transcript Merge Logic

When multiple transcripts from the same channel are available:

You MUST:

1. identify repeated structural patterns  
2. identify repeated pacing behaviors  
3. identify repeated retention techniques  
4. ignore isolated story-specific details  
5. update channel profiles using ONLY recurring traits  

You MUST NOT:

- treat a single transcript as definitive  
- merge unrelated patterns blindly  

---

## Cross-Source Learning Logic

When using transcripts from multiple creators:

You MUST:

- identify overlapping mechanics  
- isolate unique elements  
- preserve only reusable abstractions  

You MUST NOT:

- blend sources into imitation  
- reproduce recognizable structures  

---

## Knowledge Conversion Targets

Each transcript MUST contribute to:

- /analysis/channel_profiles/  
- /analysis/style_profiles/  
- /analysis/techniques/  
- /analysis/patterns/  
- /analysis/entity_inspiration/  
- /frameworks/  

Raw transcripts MUST NEVER be used directly in generation.

---

## Transcript Safeguard

Claude MUST NEVER:

- reuse raw transcript phrases  
- recreate the same story premise  
- replicate scene-by-scene structure  
- reference transcripts directly during generation  

Claude MAY ONLY use abstracted system knowledge.

---

## Automation Potential

Pipeline can be automated:

1. Upload transcript  
2. Run cleaning  
3. Run analysis  
4. Run extraction prompts  
5. Append structured outputs  

---

## Quality Control

Before storing outputs:

- is the analysis accurate?  
- are techniques reusable?  
- are patterns repeatable?  
- is the profile based on multiple sources?  

---

## Scaling Strategy

### Start Small
- 5–10 transcripts per channel  

---

### Expand
- identify consistent patterns  
- refine profiles  

---

### Optimize
- merge similar techniques  
- remove redundancy  
- improve prompts  

---

## Failure Modes

### Poor Transcript Quality
Leads to inaccurate analysis  

---

### Over-Extraction
Too many weak techniques  

---

### Redundancy
Duplicate patterns or techniques  

---

### Premature Profile Creation
Profiles based on insufficient data  

---

## Reusable Rules

- always clean transcripts first  
- extract only reusable patterns  
- refine profiles over time  
- prioritize quality over quantity  
- store outputs in structured format  

---

## Compression Summary

Transcript → Clean → Analyze → Extract → Abstract → Store → Refine

---

## Notes

This pipeline is the backbone of the system.

All improvements scale through this process.
