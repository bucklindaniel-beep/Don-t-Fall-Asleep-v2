# Transcript Pipeline Guide

## Purpose

This file defines how transcript data flows through the system and how Claude should interact with each stage.

This is an orchestration-level guide.  
It does NOT define analysis techniques or pattern extraction logic.

---

## Pipeline Overview

All transcript data must follow this structure:

/transcripts/
  raw/
  cleaned/
  structured/
  distilled/
  indexed/

Each stage transforms the previous stage's output.

---

## Stage Definitions

### 1. Raw

Location: /transcripts/raw/

- Source transcripts
- No modifications
- Include metadata when possible

---

### 2. Cleaned

Location: /transcripts/cleaned/

- Remove timestamps, noise
- Preserve sentence structure

---

### 3. Structured

Location: /transcripts/structured/

- Break into narrative components
- Extract pacing + structure

---

### 4. Distilled

Location: /transcripts/distilled/

- Convert into patterns and techniques
- No direct phrasing from source

---

### 5. Indexed

Location: /transcripts/indexed/

- Tag and categorize patterns
- Prepare for retrieval

---

## Usage Rules

Claude MUST:
- treat transcripts as analysis-only
- extract patterns, NOT content

Claude MUST NOT:
- copy phrasing
- use transcripts in generation

---

## Related Systems

- systems/transcript_stage_executor.md
