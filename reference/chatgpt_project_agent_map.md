# Reference — ChatGPT Project Agent Map

STATUS: FUTURE / NON-RUNTIME / REFERENCE ONLY

## Boundary Rule
This file documents ChatGPT project/workspace routing only.
It does NOT activate repository runtime agents.
Do NOT load this file during transcript execution.

## Purpose
Prevent confusion between ChatGPT project agents and future repository `/agents/` runtime configs.

## Current Project Routing
- Claude Dev Assistant: repository control, phase governance, patch planning
- Transcript Intelligence: transcript formatting and stage-specific transcript tasks
- Pattern System: future pattern extraction/promotion only after validation gates
- QA/Validation: regression checks and PASS/FAIL validation
- Prompt Engineering Lab: prompt refinement before execution
- Production Pipeline: story → scenes → shotlist → image prompt production
- Image Prompt System: visual prompt rules and style locks
- Packaging & Growth: titles, thumbnails, channel research, manual trend notes
- Automation & Scripts: PowerShell/API/connector work after validation

## Rule
If a task belongs outside the current agent, route it explicitly instead of expanding local scope.
