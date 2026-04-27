# Scoring Audit Rules

## Required Scorecard Categories
For Packaging & Growth title validation, each scored title must include all six categories:

1. Curiosity Gap
2. Specificity
3. Emotional Trigger
4. Clarity
5. Novelty / Uniqueness
6. Scroll-Stopping Power

## Traceability Rule
A final average must be traceable to the six category scores.

If only final averages are provided, QA must FAIL unless the task explicitly allowed summary-only scoring.

## Distribution Rule
Scores should show meaningful differentiation.

FAIL if:
- All scores are nearly identical without justification.
- Final selection contradicts the highest-supported score.
- Multiple inflated 4.7–4.9 averages appear with no category support.

## PASS Threshold Rule
If the system requires at least one title ≥ 4.5 average, QA must verify the average from category-level scores.

Unsupported threshold claims fail.

## Inflation Flags
Downgrade or FAIL when:
- Generic title receives high novelty.
- Vague title receives high specificity.
- Fully revealed twist receives high curiosity gap.
- Familiar structure receives high scroll-stopping score.
- Repeated wording receives high uniqueness.

## Hard Rule
A score is not valid unless it is justified by observable output features.
