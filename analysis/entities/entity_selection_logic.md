# System — Entity Selection Logic

## Metadata
- Type: System
- Domain: Decision / Entity Selection
- Purpose:
  - determine which entity or combination to use
  - align entity choice with story context
  - control escalation through entity progression
- Status: active
- Priority: high

---

## Core Principle

Entity selection is driven by:

1. Environment  
2. Narrative Phase  
3. Psychological Goal  
4. Behavior Class  
5. Escalation Driver  

NOT random choice.

---

## Input Factors

---

### 1. Environment Type

| Environment | Preferred Behavior Classes |
|------------|--------------------------|
| home / apartment | mimic, intrusive, unseen |
| hallway / corridor | observer, follower, environmental |
| open space | follower, unseen |
| confined space | intrusive, unseen |
| distorted / unfamiliar | environmental |

---

### 2. Narrative Phase

| Phase | Behavior Class |
|------|--------------|
| early | observer, unseen |
| mid | mimic, follower, environmental |
| late | intrusive, adaptive entities |
| climax | intrusive, hybrid |

---

### 3. Psychological Goal

| Goal | Behavior Class |
|-----|--------------|
| paranoia | mimic, observer |
| dread | observer, unseen |
| anxiety | follower |
| disorientation | environmental |
| panic | intrusive |

---

### 4. Presence Channel Mapping

| Channel | Use Case |
|--------|---------|
| auditory | isolation, off-screen tension |
| visual | distance-based tension |
| spatial | navigation, movement |
| environmental | distortion, control of space |

---

### 5. Boundary Progression Model

Default escalation path:

external → threshold → internal

Mapped to:

| Stage | Boundary |
|------|---------|
| early | external |
| mid | threshold |
| late | internal |

---

## Selection Rules

---

### Rule 1 — Environment First
Always select entities compatible with the environment.

---

### Rule 2 — Phase Alignment
Do not introduce intrusive entities before late stage.

---

### Rule 3 — Behavior Class Over Flavor
Selection is based on behavior class, not aesthetic.

---

### Rule 4 — Start With One Primary Entity
Avoid multiple entities early.

---

### Rule 5 — Escalate Through Behavior Shift

Valid transitions:

- observer → follower  
- unseen → mimic  
- mimic → intrusive  
- environmental → intrusive  

---

### Rule 6 — Match Escalation Driver to Scene

| Scene Type | Driver |
|-----------|-------|
| static | repetition |
| movement | proximity |
| exploration | environment |
| awareness | awareness |

---

### Rule 7 — Maintain Consistency

Once an entity is introduced:
- do not change its rules
- escalate its behavior instead

---

## Combination Logic

---

### Valid Pairings

- observer + unseen  
- unseen + follower  
- mimic + unseen  
- environmental + follower  
- mimic + intrusive  

---

### Avoid

- multiple intrusive entities  
- conflicting behavior classes  
- unrelated escalation patterns  

---

## Example Selection Flow

### Scenario:
- environment: apartment  
- phase: early  
- goal: dread  

→ select:
- unseen presence OR hallway observer  

---

### Escalation:

early → unseen  
mid → voice mimic  
late → room intruder  

---

## Fallback Logic

If input is unclear:

1. use unseen presence  
2. introduce observer  
3. escalate through proximity  

---

## Compression Summary

Select by environment + phase + goal → apply behavior class → escalate through proximity and boundary violation
