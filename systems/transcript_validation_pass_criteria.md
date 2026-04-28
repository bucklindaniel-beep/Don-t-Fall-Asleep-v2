# Transcript Validation PASS Criteria

## Global Rule

If it cannot be pointed to directly in the transcript, it does not belong in STRUCTURED or DISTILLED.

## CLEANED — PASS

CLEANED passes when:
- original wording is preserved
- intro/outro/sponsor/platform chatter may be removed
- caption flow may be lightly repaired
- punctuation/casing may be normalized only when non-substantive
- no summary is introduced
- no polish is introduced

CLEANED fails when:
- events are compressed
- narrator voice is rewritten
- details are omitted
- prose becomes editorial

## STRUCTURED — PASS

STRUCTURED passes when:
- Setup / Escalation / Peak / Aftermath use extracted transcript wording
- bullets are direct quotes or minimal trims
- entities are literal as stated
- name variants are preserved instead of normalized
- key events are grounded and transcript-derived

STRUCTURED fails when:
- bullets summarize
- bullets rephrase into new wording
- multiple ideas are merged into a new sentence
- entities are normalized or renamed
- analysis appears inside structure

## DISTILLED — PASS

DISTILLED passes when:
- Observations are grounded in the structured data
- Mechanics describe sequences, repetitions, or relationships visible in the text
- no reusable pattern is created
- no causal theory is introduced
- no story-generation logic is extracted

DISTILLED fails when it uses abstraction phrases such as:
- reinforces
- establishes
- suggests
- implies
- functions as
- serves as
- creates tension
- increases narrative pressure
- audience hook
- pattern
- reusable

## Commit Rule

Only commit active STRUCTURED/DISTILLED files after PASS.

One-off failures do not trigger repo rule changes.
Recurring failures across 2+ files may trigger prompt/rule patching.
