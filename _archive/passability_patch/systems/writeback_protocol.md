# System — Write-Back Protocol

## Purpose
Define the mandatory lifecycle for pattern updates to prevent duplicate writes, ensure auditability, and maintain canonical integrity.

---

## UPDATE LIFECYCLE (MANDATORY)

PENDING → PROMOTED / MERGED → COMPLETED → CLOSED

---

## CRITICAL RULES

- Automation MUST ignore COMPLETED and CLOSED entries
- Automation MUST NOT re-process completed entries
