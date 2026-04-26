# System — Transcript Pipeline Guide

## Metadata

- System Name: transcript_pipeline
- Version: 2.1
- Status: active
- Phase: training (intelligence-first)

---

## Purpose

Define the authoritative transcript processing pipeline for pattern extraction, pattern scoring, pattern validation, and canonical pattern promotion.

This system protects originality and converts transcript inputs into reusable mechanics.

---

## Core Principle

Transcripts are used for mechanics extraction only.

Never reuse source phrasing, narrative structure, creator voice, premise, characters, or scene content.

---

## Pipeline Flow (Authoritative)

```text
raw -> cleaned -> structured -> distilled -> indexed
```

---

## Stage Definitions

### 1. RAW

Location:

```text
/transcripts/raw/
```

Purpose:

- store original transcript input
- preserve narrator wording
- preserve source order

Allowed changes at raw packaging:

- add metadata header
- normalize obvious formatting issues
- fix obvious transcription artifacts only

Do not rewrite, summarize, restructure, or remove meaningful narration.

---

### 2. CLEANED

Location:

```text
/transcripts/cleaned/
```

Purpose:

- remove transcript artifacts
- improve readability without changing wording
- preserve narrative order and source voice

Allowed removals:

- sponsor reads
- calls to like or subscribe
- channel announcements
- repeated subtitle artifacts
- non-narrative markers such as music or applause tags

Do not paraphrase source narration, simplify style, or compress scenes.

---

### 3. STRUCTURED

Location:

```text
/transcripts/structured/
```

Purpose:

- identify story sections
- identify pacing shifts
- identify escalation phases
- identify tension transitions

Focus on mechanics only.

---

### 4. DISTILLED

Location:

```text
/transcripts/distilled/
```

Purpose:

- extract reusable mechanics
- remove source-specific story content
- identify pattern candidates

Distilled output must not preserve source phrasing or reconstruct source scenes.

---

### 5. INDEXED

Location:

```text
/transcripts/indexed/
```

Purpose:

- compare distilled candidates against canonical patterns
- score usefulness
- classify merge, subtype, hold, reject, or new candidate
- prepare curator review

Indexed output is not canonical until approved and written to:

```text
/analysis/pattern_library.md
```

---

## Transcript Mode Output Scope

In TRANSCRIPT MODE v4:

- execute raw -> cleaned -> structured -> distilled -> indexed internally
- return only DISTILLED and INDEXED
- do not return raw, cleaned, or structured unless explicitly requested for debugging

---

## Canonical Pattern Library Integration

Single source of truth:

```text
/analysis/pattern_library.md
```

Before creating any new pattern candidate:

1. read the canonical library
2. compare against ACTIVE, CORE, HOLD, and ARCHIVED entries
3. prefer MERGE_WITH_EXISTING or SUBTYPE_OF_EXISTING when appropriate
4. use NEW_CANONICAL only when structurally distinct
5. do not assign permanent IDs in transcript output

---

## Candidate Control

During training:

- target 1-3 NEW_CANONICAL candidates per batch
- reject generic observations
- hold single-instance mechanics unless structurally exceptional
- avoid subtype sprawl
- prefer precision over volume

---

## Failure Conditions

The transcript pipeline is invalid if:

- source phrasing appears in reusable mechanics
- duplicate patterns are created
- pattern_library.md is not checked
- stages are skipped or merged incorrectly
- in-session memory replaces repository canon
- outputs are claimed as written when no filesystem write occurred

---

## Write-Back Status

Persistent write-back is deferred until post-training validation.

Until explicitly activated:

- do not update pattern_library.md
- do not write indexed outputs automatically
- do not delete or archive raw files automatically
- return outputs for human audit
