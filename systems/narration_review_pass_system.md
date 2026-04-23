# System — Narration Review Pass

## Purpose

Performs a final narration audit after a script is generated.

Ensures:

- narrator identity remains consistent
- vocabulary stays within the filter
- voice progresses with escalation
- formatting is optimized for spoken delivery
- narration sounds like a person, not a system

---

## Core Principle

Before a narration script is finalized, it MUST be reviewed as a complete spoken piece.

No paragraph should be evaluated in isolation.

---

## Review Scope

The narration review pass MUST check:

- narrator identity consistency
- vocabulary filter compliance
- voice progression across escalation stages
- ElevenLabs formatting compliance
- setup engagement
- spoken delivery readiness

---

## Narrator Identity Review

Verify:

- same personality baseline throughout
- same vocabulary register throughout
- same relationship to environment
- same speech habits
- fear processing style evolves with escalation but remains consistent with identity

Fail if:

- narrator personality changes without cause
- vocabulary register shifts between sections
- narrator sounds like a different person at different points
- identity feels generic or undefined

---

## Vocabulary Filter Review

Verify:

- no clinical or system-level language
- no words from the "Avoid" column in /wordbanks/narration_vocabulary_filter.md
- objects described the way the narrator would say them
- environment described through ownership, not observation

Fail if:

- any instance of "lock lever," "horizontal position," "object displacement," or similar
- narrator describes their own home like a camera log
- language sounds academic, analytical, or written for a report
- framework vocabulary leaks into narration

---

## Voice Progression Review

Verify:

- setup voice is relaxed and conversational
- disruption voice is slightly tighter and more focused
- reinforcement voice includes rationalization and compressed thoughts
- escalation voice uses simpler language with less confidence
- climax voice is fragmented and immediate
- resolution voice is reflective and altered

Fail if:

- voice remains flat across all stages
- voice jumps to climax intensity too early
- narrator sounds equally calm at setup and escalation
- no detectable shift in sentence length or structure across stages

---

## ElevenLabs Formatting Review

Verify:

- no em dashes
- no semicolons
- no parenthetical asides
- contractions used naturally
- ellipsis used for hesitation and trailing thoughts
- periods used for breath resets
- numbers written as words
- sentences structured for single-breath delivery

Fail if:

- any em dash present
- any semicolon present
- complex nested sentences that would cause unnatural AI voice prosody
- emphasis relies on typography instead of sentence structure

---

## Setup Engagement Review

Verify:

- the narrator's personality is established before the first disruption
- the audience has a reason to care about this person within the first few sentences
- the setup conveys routine, weariness, familiarity, or relatability
- the baseline is not just environment description

Fail if:

- the first disruption arrives before the narrator has any personality
- setup paragraphs read like a room inventory
- no emotional connection is established before tension begins

---

## Spoken Delivery Review

Verify:

- every sentence sounds natural when read aloud
- sentence openings are varied across adjacent sentences
- no predictable structural patterns repeat across paragraphs
- actions are combined into natural flows, not itemized lists
- the narrator uses possessive language for their environment

Fail if:

- multiple paragraphs follow the same Statement → Comment → Description pattern
- sentence openings repeat ("I did," "I saw," "I went")
- the narration sounds written for a page instead of spoken to a listener

---

## Compression Summary

Generate Script → Review Identity → Review Vocabulary → Review Voice Progression → Review Formatting → Review Engagement → Review Delivery → Finalize
