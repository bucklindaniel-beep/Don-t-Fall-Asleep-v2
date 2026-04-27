# Scoring Audit Rules

## Purpose
Audit scoring outputs for traceability, differentiation, and inflation control.

## Canonical Reference
Packaging scoring logic is defined only in:
`/systems/packaging_scorecard_system.md`

This file audits compliance and must not duplicate the scorecard.

## Audit Checks
- Category scores are present.
- Justifications are present.
- Average is mathematically traceable.
- Final selection aligns with score and rationale.
- Score spread meaningfully differentiates options.
- Score inflation is not present.
- No local file redefines packaging scorecard categories or thresholds.

## Failure Response
If audit fails, return:
- failed checks
- required fixes only
- affected file or output area
