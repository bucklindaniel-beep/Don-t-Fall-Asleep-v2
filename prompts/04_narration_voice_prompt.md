# Prompt — Narration Voice

## Metadata
- Type: Prompt
- Domain: Generation / Voice / Narration
- Purpose:
  - control narration tone, pacing, and delivery
  - ensure immersive, natural, and high-retention storytelling
- Dependencies:
  - /frameworks/09_retention_mechanics.md

---

## Objective

Shape narration into a natural spoken delivery format that preserves narrator identity, controlled rhythm, escalation-aware vocabulary, retention pacing, and ElevenLabs readiness.

---

## Prompt Engineering Compliance

This prompt MUST comply with:

- /systems/prompt_engineering_layer.md
- /systems/output_format_rules.md

Before execution, validate that the prompt contains:

- clear role
- clear objective
- sufficient context
- required system references
- enforceable constraints
- explicit output requirements

If a minor prompt issue is detected, correct it internally before execution. Do NOT ask the user unless the missing information creates a critical ambiguity that cannot be resolved through defaults.

---

## Context Requirements

Before applying narration voice, Claude must have access to:

- story or scene text
- narrator identity
- escalation stage
- intended spoken delivery style
- applicable formatting references
- vocabulary filter
- retention mechanics

If narrator identity is missing, derive it from the story context using /systems/narrator_identity_system.md.

---

## System Application

This prompt is governed by the Prompt Engineering Layer.

It must reference system files instead of duplicating their full logic.

Narration must pull from:

- narrator identity for voice behavior
- formatting references for delivery
- vocabulary filters for language control
- retention mechanics for pacing and curiosity

---

## Role

You control the narration voice.

You are NOT writing prose for reading.

You are writing narration for spoken delivery.

The output must sound natural when read aloud.

---

## Core Directive

Narration must be:

- grounded
- controlled
- immersive
- easy to follow when spoken

NOT:

- overly dramatic
- overly descriptive
- overly minimal
- mechanical or repetitive

---

## Narration Voice System

You MUST apply the following:

- /systems/narrator_identity_system.md
- /reference/reference_elevenlabs_formatting.md
- /wordbanks/narration_vocabulary_filter.md
- /reference/reference_narrator_voice_examples.md

Narration MUST be:

- spoken, not written
- conversational and natural
- grounded in narrator identity
- free of clinical or analytical language
- structured for AI voice delivery

Voice quality MUST be derived from:

- narrator identity (who is speaking)
- formatting rules (how it is delivered)
- vocabulary filter (what words are allowed)
- voice examples (how it should sound)

You MUST NOT:

- use system or analytical language
- describe events like a camera or report
- ignore pacing and breath structure

## Wordbank Integration

Narration must reflect:

- emotional precision
- environmental specificity
- psychological progression
- physical sensation
- temporal pacing
- spatial relationships
- object-based anomalies

---

## Vocabulary Control

You MUST:

- use precise, context-aware language
- vary phrasing across sentences and scenes
- align vocabulary with escalation stage
- combine temporal, spatial, and environmental cues where appropriate

You MUST NOT:

- use generic descriptors (e.g., "creepy", "scary", "dark")
- repeat the same descriptive phrasing across nearby sentences
- use high-intensity language during early escalation stages
- separate language from entity behavior or scene progression

---

## Escalation Alignment

Language must evolve with escalation:

- early → subtle, indirect, delayed
- mid → clearer, pattern-based, uneasy
- late → immediate, intrusive, overwhelming

Vocabulary should reinforce escalation, not jump ahead of it.

---

## Controlled Richness

Narration must remain clear and grounded, but not overly compressed.

Use:

- short sentences when tension spikes
- medium-length sentences to create flow, context, and psychological texture
- slightly richer phrasing when it improves immersion or makes narration sound natural aloud

Avoid:

- stacking too many short sentences in a row
- reducing all prose to blunt subject-verb statements
- creating a clipped, mechanical cadence

Aim for:

- controlled variation
- natural spoken rhythm
- simple language with moderate descriptive depth

---

## Sentence Structure & Rhythm

Narration must vary sentence construction and flow.

You MUST:

- actively vary sentence openings (action, observation, reflection, consequence)
- alternate sentence length (short, medium, occasional longer)
- monitor local sentence rhythm within each paragraph
- combine related thoughts into natural sentences when appropriate

You MUST NOT:

- begin consecutive or nearby sentences with the same word
- rely on repeated transitions (e.g., "Then", "And", "He", "I")
- stack identical grammatical structures (e.g., subject + verb + object repetition)
- create predictable or list-like sentence patterns

---

## Speech Optimization Layer

You MUST apply:

- /reference/reference_elevenlabs_formatting.md
- /wordbanks/narration_vocabulary_filter.md

Narration MUST:

- sound natural when spoken aloud
- avoid clinical or written-sounding vocabulary
- use punctuation for pacing and breath
- prefer contractions and conversational phrasing

---

## Rhythm Model

Narration should feel:

- natural
- slightly uneven in a controlled way
- fluid when spoken aloud

Use:

- short sentences for impact
- medium sentences for flow
- occasional longer sentences for immersion

Avoid:

- uniform sentence length
- repetitive cadence
- overly segmented narration

---

## Transition Control

Transitions must be subtle and natural.

Avoid:

- obvious sequencing words ("Then", "After that", "Next")
- formulaic progression

Prefer:

- implied transitions
- contextual flow
- cause-and-effect phrasing

---

## Repetition Control

Repetition is allowed ONLY when it increases tension.

You MUST:

- use repetition intentionally
- tie repetition to entity behavior or perception patterns
- evolve or escalate repeated phrasing

You MUST NOT:

- repeat phrasing without change
- use repetition as filler
- create rhythmic predictability

---

## Tone Control

Tone must remain:

- calm
- observational
- controlled

Even during escalation.

Avoid:

- emotional exaggeration
- dramatic language
- forced intensity

---

## Immersion Rules

Narration should feel like:

- recalling a real event
- describing something experienced firsthand

Avoid:

- storytelling theatrics
- narration that feels written instead of remembered

---

## Information Control

Do NOT:

- over-explain events
- clarify everything immediately
- resolve ambiguity too early

Allow:

- partial understanding
- delayed clarity
- natural confusion

---

## Retention Alignment

Apply:

/frameworks/09_retention_mechanics.md

Ensure:

- curiosity is maintained
- information is revealed gradually
- tension builds through controlled pacing

---

## Prompt Validation Checklist

Before execution, confirm:

- narrator identity is defined or derived
- narration is optimized for spoken delivery
- vocabulary aligns with escalation stage
- sentence rhythm avoids repetition and mechanical cadence
- ElevenLabs formatting references are applied
- retention mechanics are preserved
- output does not sound clinical, analytical, or over-written

If any check fails, correct the issue before finalizing narration.

---

## Failure Conditions

Narration is incorrect if:

- sentences feel repetitive
- cadence becomes predictable
- language is too clipped or too sparse
- prose becomes overly complex or literary
- narration does not sound natural when spoken aloud

---

## Compression Summary

Simple language → controlled richness → varied rhythm → natural flow → immersive narration
