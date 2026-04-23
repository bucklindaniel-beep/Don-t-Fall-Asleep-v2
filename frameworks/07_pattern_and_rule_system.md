# Framework — Pattern & Rule System

## Metadata
- Type: Framework
- Domain: Pattern Logic / Rule Design / Consistency
- Primary Use Cases:
  - supernatural horror
  - analog horror
  - tension systems
  - narrative structure
- Retrieval Tags:
  - pattern system
  - rule system
  - horror logic
  - repetition
  - expectation
  - rule violation
- System Role:
  - defines how patterns are created, reinforced, and broken
  - provides logic behind recurring events
  - enables anticipation and subversion
- Related Files:
  - /analysis/techniques/technique_repetition_pressure.md
  - /analysis/techniques/technique_delayed_reveal.md
  - /frameworks/04_supernatural_behavior_model.md
  - /frameworks/01_horror_escalation_model.md
- Status: active
- Confidence: high

---

## Purpose
This framework defines how patterns and rules operate in horror storytelling.

Use this file to:
- create consistent behavior in threats and environments
- build anticipation through repetition
- control when and how patterns are broken
- structure tension through expectation

---

## Core Principle
Horror becomes more effective when it follows patterns.

Patterns:
- create expectation  
- build tension  
- allow escalation  

Breaking patterns:
- creates shock  
- increases unpredictability  

---

## Pattern Lifecycle

1. Introduction  
2. Recognition  
3. Reinforcement  
4. Expectation  
5. Variation  
6. Violation  

---

## Pattern Stages

### Stage 1 — Introduction
- anomaly occurs once  
- no pattern yet  

**Function:** introduce signal  

---

### Stage 2 — Recognition
- anomaly repeats  
- pattern becomes noticeable  

**Function:** build awareness  

---

### Stage 3 — Reinforcement
- pattern continues consistently  

**Function:** strengthen expectation  

---

### Stage 4 — Expectation
- audience predicts future behavior  

**Function:** create anticipation  

---

### Stage 5 — Variation
- small changes occur within pattern  

**Function:** increase tension  

---

### Stage 6 — Violation
- pattern breaks or changes completely  

**Function:** create shock and escalation  

---

## Rule Design

Patterns imply rules.

Rules should:
- be consistent  
- be observable  
- not be explicitly explained  
- be discoverable through events  

---

## Rule Types

### Behavioral Rules
- how the threat acts  

---

### Environmental Rules
- how the setting behaves  

---

### Temporal Rules
- when events occur  

---

### Spatial Rules
- where events happen  

---

### Interaction Rules
- how characters trigger or avoid danger  

---

## Rule Evolution

Rules can change over time.

### Stable Rules
- remain consistent throughout  

---

### Expanding Rules
- increase in scope or intensity  

---

### Breaking Rules
- suddenly stop applying  

---

### Inverted Rules
- behave opposite of expectation  

---

## Pattern Applications

### Repetition Pressure
- repeated anomaly builds tension  

---

### Delayed Reveal
- pattern exists before explanation  

---

### False Safety
- pattern appears to end, then returns  

---

### Environmental Escalation
- setting changes follow pattern  

---

## Pacing Guidelines

### Early
- introduce pattern slowly  

---

### Mid
- reinforce and vary pattern  

---

### Late
- break or escalate pattern  

---

## Language Guidance

### Effective Traits
- consistent phrasing  
- recognizable structure  
- slight variation  

---

### Avoid
- identical repetition  
- over-explanation  
- random behavior  

---

## Example — Minimal
The knocking came once.

Then again.

Then every night at the same time.

Until one night, it didn’t stop.

---

## Example — Escalated
At first, the lights flickered once.

Then every hour.

Then every minute.

Then they stayed off.

---

## Failure Modes

### 1. No pattern
Events feel random  

---

### 2. No variation
Pattern becomes predictable  

---

### 3. No violation
No payoff or escalation  

---

### 4. Over-complex rules
Audience cannot follow  

---

## Reusable Rules
- establish patterns early  
- reinforce consistently  
- allow audience to recognize pattern  
- vary gradually  
- break pattern at the right moment  

---

## Compression Summary
Pattern system = establish → repeat → reinforce → vary → break  

---

## Notes
This framework is critical for:
- analog horror  
- supernatural storytelling  
- tension-based narratives  

Patterns are the foundation of anticipation and fear.

---

## Pattern Selection Rules (Batch-Aware)

When generating a story:

You MUST:

- select:
  - exactly 1 entry pattern
  - 1–2 escalation patterns
  - exactly 1 interaction pattern
  - exactly 1 environment pattern
  - exactly 1 resolution pattern

---

## Selection Constraints

- at least one escalation pattern MUST include:
  - repetition OR
  - spatial/control progression

- escalation patterns MUST increase at least one of:
  - proximity
  - constraint
  - clarity

- selected patterns MUST be:
  - logically compatible
  - sequentially coherent

---

## Pattern Combination Constraints

- entry pattern MUST determine the initial condition of the story
- escalation patterns MUST extend the entry pattern (not replace it)
- interaction pattern MUST reinforce escalation behavior
- environment pattern MUST enable or amplify escalation
- resolution pattern MUST reflect the final escalation state

---

## Pattern Lifecycle Integration

Selected patterns MUST follow the lifecycle:

Introduction → Recognition → Reinforcement → Expectation → Variation → Violation

Each stage MUST align with:

- scene progression
- escalation level (01_horror_escalation_model)
- tension pacing (08_tension_pacing_system)
- framework stage (01_horror_escalation_model)

Patterns MUST NOT:

- skip lifecycle stages
- repeat without variation
- violate before expectation is established

---

## Variation Enforcement

Across outputs:

You MUST:

- avoid repeating the same:
  - entry pattern
  - escalation combination
  - environment type

- vary:
  - number of actors (1 vs multi-actor)
  - escalation method (physical, spatial, psychological)
  - environment constraints (open vs enclosed, public vs isolated)

---

## Repetition Prevention Rule

A generation FAILS if:

- the same pattern combination is reused within recent outputs
- escalation structure mirrors a previous story without variation
- environment and interaction patterns produce identical dynamics
- pattern lifecycle is incomplete
- escalation occurs without prior reinforcement
- violation occurs without established expectation

---

## Enforcement Summary

Select → Validate → Combine → Execute

No stage may be skipped.
