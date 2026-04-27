# Packaging Scorecard System

## Purpose
Canonical scoring system for YouTube packaging outputs.

This file is the ONLY source of packaging scorecard logic.
Other files may reference this file but must not redefine the scoring rules.

## Authority
- Core Dev Controller routes packaging work.
- Packaging & Growth generates packaging outputs.
- System QA validates packaging outputs.
- This file defines scoring criteria and pass/fail expectations.

## Score Categories
Each title, thumbnail, or packaging concept is scored from 1–5 across:

1. Curiosity Gap
2. Specificity
3. Emotional Trigger
4. Clarity
5. Novelty
6. Scroll-Stopping Power

## Scoring Rules
- Use full category-level scoring.
- Include a short justification for each category.
- Average must be traceable from category scores.
- Max two scores of 5 per title unless explicitly approved by System QA.
- Avoid clustered averages across three or more options.
- Scores must reflect real tradeoffs.
- Specificity requires concrete anchors such as time, place, object, action, or consequence.
- Clarity cannot compensate for weak curiosity.
- Novelty must be judged against niche familiarity, not general creativity.
- Final recommendation must be supported by score and rationale.

## Pass Threshold
A packaging output may pass only if:
- At least one option averages 4.5 or higher.
- Final selection is one of the strongest scored options.
- No score inflation is detected.
- Category justifications are present.
- Scores meaningfully differentiate options.

## Failure Conditions
Packaging scorecard output fails if:
- Scores are arbitrary or untraceable.
- Most options receive nearly identical averages.
- Category scores are missing.
- More than two 5s appear repeatedly without justification.
- Final recommendation contradicts the scorecard.
- Scoring logic is duplicated outside this canonical file.

## Required Output Shape

```md
## Packaging Scorecard

### Option 1: [title/concept]
- Curiosity Gap: [1-5] — [reason]
- Specificity: [1-5] — [reason]
- Emotional Trigger: [1-5] — [reason]
- Clarity: [1-5] — [reason]
- Novelty: [1-5] — [reason]
- Scroll-Stopping Power: [1-5] — [reason]
- Average: [score]

## Top Options
1. [option]
2. [option]
3. [option]

## Final Recommendation
- [selected option]
- Reason: [compact rationale]
```

## Non-Duplication Rule
Any audit, QA, prompt, or agent file must reference this file instead of restating scoring logic.
