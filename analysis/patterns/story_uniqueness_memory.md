# System — Story Uniqueness Memory

## Purpose
Tracks previously generated stories to prevent repetition across outputs.

Ensures:
- pattern variation
- structural diversity
- long-term uniqueness

---

## Memory Rules

Every generated story MUST log:

- entry pattern  
- escalation patterns  
- interaction pattern  
- environment pattern  
- resolution pattern  
- escalation type (linear / staggered / spike / delayed)
- actor count (single / multi)
- environment type (indoor / outdoor / mixed)

---

## Entry Format Note

All entries SHOULD include Usage Notes to support rarity weighting and selection logic.

---

## Memory Entry Format

### Story ID: [auto or timestamp]

Entry Pattern:
- 

Escalation Patterns:
- 
- 

Interaction Pattern:
- 

Environment Pattern:
- 

Resolution Pattern:
- 

Escalation Type:
- 

Actor Count:
- 

Environment Type:
- 

Notes:
- (optional short description)

Usage Notes:
- pattern rarity impact: low / medium / high
- combination freshness: fresh / repeated / constrained

---

## Repetition Prevention Rules

A new story MUST NOT:

- reuse the same combination of:
  - entry pattern + escalation patterns + environment pattern

- reuse the same escalation structure AND environment type

- replicate the same actor configuration AND interaction pattern

---

## Soft Variation Rules

The system SHOULD:

- rotate environment types frequently  
- alternate between single and multi-actor scenarios  
- vary escalation types across outputs  

---

## Enforcement Logic

Before generating a story:

1. Check recent memory entries  
2. Identify recently used combinations  
3. exclude them from selection  

---

## Memory Window

Default:
- last 5–10 stories

Extended:
- larger window for batch generation

---

## Pattern Cooldown System

### Purpose
Prevents overuse of specific patterns across recent generations.

Ensures:
- distribution of pattern usage
- long-term variation
- avoidance of subtle repetition

---

## Cooldown Rules

Each pattern enters a cooldown period after use.

Default cooldown:

- Entry Patterns → 2 stories  
- Escalation Patterns → 2 stories  
- Interaction Patterns → 3 stories  
- Environment Patterns → 2 stories  
- Resolution Patterns → 2 stories  

---

## Cooldown Enforcement

A pattern MUST NOT be selected if it:

- appears within its cooldown window  
- would result in repeated pattern dominance  

If no valid combination exists:

- relax cooldown ONLY for the least recently used pattern  
- NEVER relax escalation diversity constraints  

---

## Weighted Pattern Rarity System

### Purpose
Biases pattern selection toward underused patterns across the full memory log.

Ensures:
- long-term diversity
- balanced pattern distribution
- reduced pattern dominance over time

---

## Core Rule

When multiple valid pattern selections are available, the system MUST prefer:

1. patterns never used
2. patterns used least often
3. patterns used least recently

---

## Rarity Priority

Pattern selection priority:

- highest priority → unused patterns
- medium priority → low-frequency patterns
- lowest priority → high-frequency patterns outside cooldown

---

## Frequency Tracking

Each pattern category SHOULD be monitored for total usage:

- Entry Patterns
- Escalation Patterns
- Interaction Patterns
- Environment Patterns
- Resolution Patterns

The system SHOULD prefer lower-frequency options within each category.

---

## Rarity Constraints

The system MUST NOT:

- repeatedly favor the same high-frequency pattern just because it is outside cooldown
- overuse common pattern pairings when rarer valid pairings exist
- default to familiar structures when underused structures remain available

---

## Selection Tie-Break Rule

If multiple valid patterns pass:

- uniqueness check
- cooldown check
- compatibility check

Then select the pattern set with the lowest overall historical usage.

---

## Diversity Protection Rule

If one pattern becomes dominant across recent or total generations, the system MUST deprioritize it until other patterns are represented more evenly.

---

## Priority Order

When selecting patterns:

1. Prefer unused patterns  
2. Prefer patterns outside cooldown  
3. Avoid patterns used in the last story  

---

## Global Failure Conditions

A generation FAILS if:

- pattern combination matches a recent entry  
- escalation structure is reused without variation  
- environment and interaction patterns produce identical dynamics  
- high-frequency patterns are repeatedly selected while lower-frequency valid options exist  
- the same small subset of patterns dominates the memory log  
- rarity weighting is ignored during final pattern selection  
- the same pattern appears in consecutive stories (unless unavoidable)  
- interaction patterns repeat within 2 stories  
- escalation patterns repeat without variation  

---

## Compression Summary

Log → Compare → Filter (Cooldown + Rarity) → Generate
