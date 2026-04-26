# Pattern Library — Canonical

## Purpose

This file stores confirmed reusable storytelling mechanics.

Claude must treat this as the canonical pattern memory for transcript-derived mechanics.

Patterns here are not transcript summaries.
Patterns here are reusable system logic.

---

## Library Rules

- Do not copy source phrasing
- Do not store story-specific content
- Do not create duplicate patterns
- Merge variants under existing canonicals when possible
- Promote only high-signal reusable mechanics
- Track frequency when patterns repeat across transcripts

---

## Status Values

- ACTIVE: usable in downstream generation
- CORE: repeatedly confirmed high-value engine pattern
- HOLD: observed but not yet reliable
- ARCHIVED: deprecated or merged pattern

---

# CORE PATTERNS

## P-001 — Mundane-to-Catastrophic Escalation

- Category: Core
- Status: CORE
- Frequency: 3+
- Definition: Begins with ordinary routine or realistic baseline, then pivots into irreversible danger or dread.
- Primary Use: Establish believable normalcy before the first major destabilizing event.
- Common Subtypes:
  - domestic routine collapse
  - public-place disruption
  - ordinary task becomes threat trigger
- Related Patterns:
  - P-005 Sensory Dread Cascade
  - P-014 Authentic Artifact Embedding
- Downstream Use: Use as a default opening engine for grounded horror and true-crime-style scripts.
- Avoid When: Story already begins in active danger.

---

# STRUCTURAL PATTERNS

## P-002 — Ironic Role Reversal

- Category: Structural
- Status: ACTIVE
- Frequency: 1+
- Definition: A character’s narrative role reverses by the reveal, such as helper becoming threat, skeptic becoming cause, or rescuer becoming rescued.
- Primary Use: Deliver structural twist payoff.
- Common Subtypes:
  - hidden-in-plain-sight killer
  - rescuer/rescued reversal
  - skeptic/hoaxer reversal
- Related Patterns:
  - P-004 Trusted-Figure Betrayal
- Downstream Use: Use when the ending should reframe earlier information.
- Avoid When: Reveal depends on new information rather than reinterpreting existing setup.

## P-009 — False-Lead Suspect Ladder

- Category: Structural
- Status: ACTIVE
- Frequency: 1
- Definition: Sequential suspects are presented with credible weight, then cleanly eliminated before the actual answer emerges.
- Primary Use: Sustain investigation momentum and audience participation.
- Common Subtypes:
  - forensic elimination
  - alibi collapse
  - behavioral misdirection
- Related Patterns:
  - P-020 Unsolved Open Ending
- Downstream Use: Use for whodunit or cold-case structures.
- Avoid When: Story does not support multiple plausible suspects.

## P-013 — Time-Decay Investigation Arc

- Category: Structural
- Status: ACTIVE
- Frequency: 1
- Definition: A long unresolved time gap increases dread before a later structural trigger reactivates the case.
- Primary Use: Create weight from elapsed time and delayed resolution.
- Common Subtypes:
  - cold-case restart
  - technology-enabled reopening
  - witness resurfacing
- Related Patterns:
  - P-020 Unsolved Open Ending
- Downstream Use: Use when a story depends on delayed justice or historical reveal.
- Avoid When: Time gap does not change audience understanding.

## P-020 — Unsolved Open Ending

- Category: Structural
- Status: ACTIVE
- Frequency: 1
- Definition: Ends with strong evidence still failing to produce resolution, leaving the audience with dread from incompletion.
- Primary Use: Close with lingering uncertainty.
- Common Subtypes:
  - evidence-rich unsolved case
  - suspect description without capture
  - surviving witness without justice
- Related Patterns:
  - P-013 Time-Decay Investigation Arc
- Downstream Use: Use for grounded stories where unresolved danger is the final emotional hook.
- Avoid When: Story requires cathartic closure.

---

# PSYCHOLOGICAL PATTERNS

## P-004 — Trusted-Figure Betrayal

- Category: Psychological
- Status: ACTIVE
- Frequency: 2+
- Definition: Threat emerges from someone previously established as safe, helpful, familiar, or emotionally trusted.
- Primary Use: Reframe safety as danger.
- Common Subtypes:
  - friend betrayal
  - family-adjacent betrayal
  - support-circle betrayal
  - authority betrayal
- Related Patterns:
  - P-002 Ironic Role Reversal
- Downstream Use: Use when horror should come from intimacy or proximity.
- Avoid When: Betrayer lacks meaningful prior trust.

## P-015 — Reality-Dissonance Horror

- Category: Psychological
- Status: ACTIVE
- Frequency: 1
- Definition: Horror emerges from a gap between a character’s perceived reality and externally verified reality.
- Primary Use: Create dread through delusion, hallucination, denial, or impossible certainty.
- Common Subtypes:
  - hallucinated response
  - false survival belief
  - impossible interpretation
- Related Patterns:
  - P-014 Authentic Artifact Embedding
- Downstream Use: Use when psychological instability should feel grounded rather than supernatural.
- Avoid When: The story needs the impossible event to remain genuinely supernatural.

## P-018 — Public Persona Collapse

- Category: Psychological
- Status: ACTIVE
- Frequency: 1
- Definition: A curated public identity is established before hidden private reality reverses audience perception.
- Primary Use: Turn social surface into dramatic irony.
- Common Subtypes:
  - social media optimism reversal
  - perfect family collapse
  - public confidence hiding threat
- Related Patterns:
  - P-017 Self-Quotation Death Frame
- Downstream Use: Use in modern stories involving public image, posts, videos, or reputation.
- Avoid When: Public persona is not meaningfully established.

---

# REALISM / AUTHENTICITY PATTERNS

## P-006 — Documentary Anchor Stamping

- Category: Realism
- Status: ACTIVE
- Frequency: 1
- Definition: Specific date, location, age, role, or occupation signals documentary credibility.
- Primary Use: Ground the story quickly in reality.
- Common Subtypes:
  - date/place opening
  - age/occupation ID
  - location-specific incident setup
- Related Patterns:
  - P-014 Authentic Artifact Embedding
- Downstream Use: Use in opening setup for believable narration.
- Avoid When: Excess metadata slows momentum.

## P-014 — Authentic Artifact Embedding

- Category: Realism
- Status: ACTIVE
- Frequency: 1
- Definition: A real-seeming artifact such as a 911 call, livestream, news clip, diary, or recording becomes the narrative spine.
- Primary Use: Increase immediacy and believability.
- Common Subtypes:
  - emergency call
  - livestream
  - news broadcast
  - personal recording
- Related Patterns:
  - P-006 Documentary Anchor Stamping
  - P-017 Self-Quotation Death Frame
- Downstream Use: Use when the story benefits from primary-source realism.
- Avoid When: Artifact would feel gimmicky or slow the story.

## P-017 — Self-Quotation Death Frame

- Category: Realism
- Status: ACTIVE
- Frequency: 1
- Definition: A victim’s own prior words are later reframed by their fate.
- Primary Use: Create emotional irony and hindsight dread.
- Common Subtypes:
  - optimistic post before death
  - praise of future threat
  - warning unknowingly aimed at self
- Related Patterns:
  - P-014 Authentic Artifact Embedding
  - P-018 Public Persona Collapse
- Downstream Use: Use sparingly for emotionally devastating reversals.
- Avoid When: It risks melodrama or exploitation.

---

# EVIDENCE / DETAIL PATTERNS

## P-011 — Domestic Object Dread

- Category: Detail
- Status: ACTIVE
- Frequency: 1
- Definition: Ordinary household items become evidence of intrusion, violence, or hidden threat.
- Primary Use: Make horror feel grounded through specific objects.
- Common Subtypes:
  - object out of place
  - everyday item as forensic clue
  - domestic normalcy turned evidence
- Related Patterns:
  - P-001 Mundane-to-Catastrophic Escalation
- Downstream Use: Use for grounded crime scenes and domestic horror.
- Avoid When: Object detail does not change interpretation.

## P-012 — Body Discovery Detail

- Category: Detail
- Status: ACTIVE
- Frequency: 1
- Definition: One controlled anatomical or forensic detail carries the visceral weight of discovery.
- Primary Use: Add realism without gore overload.
- Common Subtypes:
  - decomposition detail
  - injury marker
  - visible aftermath detail
- Related Patterns:
  - HOLD: Active Corpse Handling
- Downstream Use: Use once, briefly, for impact.
- Avoid When: Detail becomes gratuitous.

## P-019 — Children Named and Aged

- Category: Detail
- Status: ACTIVE
- Frequency: 1
- Definition: Children affected by the event are identified with specific names and ages to make stakes concrete.
- Primary Use: Increase emotional specificity.
- Common Subtypes:
  - named collateral victims
  - children present during threat
  - age-specific aftermath
- Related Patterns:
  - P-017 Self-Quotation Death Frame
- Downstream Use: Use sparingly and respectfully.
- Avoid When: Detail feels manipulative or unnecessary.

---

# HOLD PATTERNS

## H-001 — Cold-Open Frame Selection
- Status: HOLD
- Reason: Multiple variants observed, but parent pattern not yet stable.
- Possible Subtypes:
  - thesis hook
  - forensic artifact hook
  - diary/bookend hook
- Needed Confirmation: One more distinct transcript showing cold-open choice as reusable mechanic.

## H-002 — Active Corpse Handling
- Status: HOLD
- Reason: Related to P-012 but function differs from passive discovery detail.
- Needed Confirmation: Additional example where perpetrator body manipulation drives dread.

## H-003 — Self-Elimination Perpetrator Resolution
- Status: HOLD
- Reason: Observed but may be outcome-specific rather than reusable mechanic.
- Needed Confirmation: Another case where perpetrator self-removal shapes narrative closure.

## H-004 — Greed-to-Dollar Compression
- Status: HOLD
- Reason: Strong in systemic-failure stories, limited broader applicability.
- Needed Confirmation: Additional example of specific monetary amount crystallizing institutional negligence.

## H-005 — Survivor Lucky-Moment Anchor
- Status: HOLD
- Reason: Common true-crime convention; not yet distinct enough.
- Needed Confirmation: Higher-impact usage across another transcript.
