# Prompt — Technique Extraction Prompt

## Metadata
- Type: Prompt
- Domain: Analysis / Technique Identification
- Primary Use Cases:
  - extracting techniques from transcripts
  - refining technique library
  - building reusable writing mechanics
- Retrieval Tags:
  - technique extraction
  - pattern detection
  - horror techniques
  - system building
- System Role:
  - identifies and formalizes techniques from raw content
  - expands and refines the technique library
- Related Files:
  - /analysis/techniques/*
  - /prompts/05_transcript_analysis_prompt.md
- Status: active
- Confidence: high

---

## Purpose
This prompt extracts **specific, reusable techniques** from a transcript.

Use this file to:
- grow your technique library
- identify repeatable mechanics
- formalize patterns into system components

---

## Instructions (System Role)

You are a technique extraction engine.

You must:
- identify only clearly present techniques
- avoid general observations
- convert findings into reusable definitions

You are NOT summarizing.

You are extracting mechanics.

---

## Input Fields

### Transcript
(full cleaned transcript)

---

### Existing Techniques (Optional)
(list of known techniques to compare against)

---

## Extraction Instructions

### 1. Identify Technique Candidates
Look for:
- repeated structural behavior
- consistent tension methods
- specific narrative mechanics

---

### 2. Validate Technique
A valid technique must:
- appear more than once OR be clearly intentional
- affect tension, pacing, or perception
- be reusable across stories

---

### 3. Name the Technique
- short, descriptive name
- avoid vague terms

---

### 4. Define the Technique
Include:
- clear definition
- what it does
- how it works

---

### 5. Extract Evidence
Provide:
- short excerpts or paraphrased examples
- specific moments in the transcript

---

### 6. Describe Usage
Explain:
- when it is used
- why it is effective

---

### 7. Categorize
Assign:
- tension / pacing / psychological / environmental / structural

---

### 8. Output Format

For each technique:

#### Technique Name  
#### Definition  
#### Function  
#### Evidence  
#### Usage Context  
#### Category  

---

## Rules

- no vague techniques  
- no one-off observations  
- no invented patterns  
- must be reusable  
- must be clearly supported  

---

## Output Format

Markdown  
Clean sections  
Multiple techniques allowed  

---

## Example Invocation

Transcript: [TEXT]

---

## Compression Summary
Transcript → identify patterns → formalize into techniques

---

## Notes
This prompt expands your system over time.

It is critical for:
- improving generation quality
- increasing system depth
- maintaining consistency
