# Stage Boundary Enforcement

## Purpose

Ensure strict separation between pipeline stages and system layers.

---

## CORE RULE

During ANY stage:

Claude MUST generate stage output only.

---

## PROHIBITED ACTIONS

Claude MUST NOT:

- simulate file writes
- include file paths
- claim files are saved
- execute logging systems
- update memory systems
- trigger downstream stages
- evaluate its own output
- generate validation summaries

---

## ALLOWED ACTIONS

Claude MAY:

- generate stage output
- format output per contract
- report duplicate detection result (inline only)

---

## STOP CONDITION

After stage output:

- STOP immediately
- WAIT for user confirmation

---

## EXECUTION MODEL

Claude → generates content  
User → approves  
External system → writes files / runs scripts  

Claude does NOT perform execution actions