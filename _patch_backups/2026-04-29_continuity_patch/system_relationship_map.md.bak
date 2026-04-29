# Map — System Relationship Map

## Purpose
This file defines how all major components of the repository connect.

It is designed for:
- system clarity
- Claude retrieval optimization
- development alignment
- debugging prompt behavior

This is a **high-level map**, not a detailed framework.

---

## Core Flow

Raw Data  
→ Cleaned Text  
→ Structured Analysis  
→ Extracted Patterns  
→ Framework Systems  
→ Execution Playbooks  
→ AI Prompts  
→ Output

---

## System Layers

### 1. Transcripts (Input Layer)
Location:
- /transcripts/raw
- /transcripts/cleaned
- /transcripts/structured
- /transcripts/distilled
- /transcripts/indexed

Role:
- Source material ingestion
- Initial transformation into usable data

---

### 2. Analysis (Knowledge Layer)
Location:
- /analysis/channel_profiles
- /analysis/techniques
- /analysis/patterns
- /analysis/style_profiles

Role:
- Extract meaning from transcripts
- Identify repeatable techniques and structures
- Build understanding of style and behavior

---

### 3. Frameworks (System Layer)
Location:
- /frameworks

Role:
- Convert analysis into reusable systems
- Define rules, flows, and models
- Provide structure for writing and generation

---

### 4. Wordbanks (Language Layer)
Location:
- /wordbanks

Role:
- Provide vocabulary for execution
- Support tone, immersion, and specificity
- Used by frameworks and prompts

---

### 5. Playbooks (Execution Layer)
Location:
- /playbooks

Role:
- Step-by-step guides for building scenes and stories
- Combine frameworks + wordbanks into action

---

### 6. Prompts (Automation Layer)
Location:
- /prompts

Role:
- Convert system knowledge into AI instructions
- Generate scripts, scenes, and outputs

---

### 7. Reference (Foundation Layer)
Location:
- /reference

Role:
- Provide foundational writing knowledge
- Feed into analysis and frameworks
- Define narrator voice examples and tone targets
- Define delivery formatting rules (ElevenLabs)

---

### 8. Systems (Enforcement Layer)
Location:
- /systems

Role:
- Define orchestration and pipeline control
- Enforce identity locks (character, environment, narrator)
- Enforce review passes (continuity, narration)
- Control visual pipeline systems (camera, lens, escalation, translation)
- Maintain consistency across all outputs

---

### 9. Templates (Structure Layer)
Location:
- /templates

Role:
- Standardize file creation
- Ensure consistency across all stages

---

### 10. Maps (Meta Layer)
Location:
- /maps

Role:
- Define relationships between systems
- Provide high-level visibility
- Control structural behavior across the system

Maps define:

- escalation progression (macro)
- scene structure (micro)
- system relationships (meta)

---

## Dependency Flow

Wordbanks → Frameworks  
Wordbanks → Prompts  
Analysis → Frameworks  
Reference → Analysis  
Reference → Prompts  
Frameworks → Playbooks  
Frameworks → Prompts  
Playbooks → Prompts  
Systems → Prompts  
Maps → Frameworks  
Maps → Playbooks  
Maps → Prompts  

---

## Example End-to-End Flow

1. Transcript added to /transcripts/raw  
2. Cleaned version created in /transcripts/cleaned  
3. Structured analysis created in /transcripts/structured  
4. Techniques extracted into /analysis/techniques  
5. Patterns added to /analysis/patterns  
6. Systems built in /frameworks  
7. Execution logic defined in /playbooks  
8. Prompts created in /prompts  
9. Output generated (scripts, scenes, visuals)

---

## Key Rules

- Do not mix layers (e.g., no raw data in frameworks)
- Each file should serve one purpose
- Systems should be built from repeated patterns, not single examples
- Prompts should rely on frameworks, not replace them
- Prompts must execute framework logic, not replace it
- Wordbanks must support execution, not drive structure

---

## Notes

This map should evolve as the system grows, but the core flow should remain stable.

---

## Map Enforcement Rule

Maps define structural truth.

You MUST:

- use maps to control escalation and progression
- ensure all outputs follow defined map structures

You MUST NOT:

- treat maps as optional
- override map-defined progression with improvisation

Maps control how the system behaves, not just how it is organized.

## Recent System Additions

- `/systems/transcript_duplicate_detection.md` prevents duplicate transcript intake, duplicate script analysis, and repeated pattern indexing.
- `/frameworks/15_narration_pacing_system.md` defines source-safe narration pacing mechanics.
- `/playbooks/05_narration_delivery_playbook.md` prepares approved scripts for voice generation without copying creator style.
- `/analysis/narration_patterns/` stores generalized narration mechanics only.
