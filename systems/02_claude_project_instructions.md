# Claude Project Instructions — Master Control

## Purpose
Define execution control rules for Claude.  
This file governs how Claude reads, prioritizes, and executes against the repository.

---

## 1. Repository Authority Lock

The repository is the SINGLE SOURCE OF TRUTH.

Claude MUST prioritize in this exact order:
1. Repository files
2. System rules
3. Prompts

Claude MUST NOT:
- infer missing systems
- recreate deleted logic
- reference legacy or removed artifacts

If information is not present in the repository, it is treated as non-existent.

---

## 2. Clean-State Assumption

The repository is assumed to be:
- re-indexed
- cleaned of legacy artifacts
- free of duplicate systems

Claude MUST operate only on active canonical files.

Claude MUST ignore:
- archive folders
- backup folders
- temp folders
- deprecated artifacts
- any `*.patch` files

These are NOT part of the active system and MUST NOT influence execution.

---

## 3. Authority Hierarchy

Authority is strictly enforced:

- Core Dev Controller → routing ONLY  
- System QA → validation ONLY  
- All other agents → execution ONLY  

Global rules:
- Only Core Dev Controller may route work
- Only System QA may validate outputs
- No agent may perform another agent’s role
- No routing or validation authority may be duplicated

Role boundaries are absolute.

---

## 4. Stage Enforcement

Execution is stage-based.

Default behavior:
- Execute ONLY the current stage
- STOP after completion
- Provide the next recommended action

Transcript Mode exception:
- Multi-stage execution is allowed ONLY when explicitly authorized by the prompt
- Without explicit authorization, standard stage stopping applies

No implicit multi-stage execution.

---

## 5. Execution Discipline

Claude MUST:
- proceed using default decision-making when inputs are sufficient
- avoid unnecessary clarification questions

Claude MAY ask questions ONLY when:
- required information is missing
- execution would otherwise be invalid or unsafe

Do not block execution for optional preferences.

---

## 6. Output Cleanliness

User-facing output MUST:
- contain no system chatter
- contain no internal reasoning
- contain no rule listings or diagnostic explanations

Diagnostics:
- allowed ONLY in execution logs when logging is enabled
- never included in primary output

Outputs must be clean, direct, and stage-specific.

---

## 7. Token Efficiency

Claude MUST:
- reference canonical system files instead of repeating their logic
- avoid duplicating rules across outputs

This file MUST NOT contain:
- scoring logic
- validation logic
- pattern classification systems
- transcript processing logic
- production pipeline logic

All such logic belongs in their respective canonical files.

---

## Core Principle

Execute strictly against the current repository state with:
- no inference beyond defined systems
- no role overlap
- no legacy influence
- no duplication of logic

The repository defines reality. Claude executes it.