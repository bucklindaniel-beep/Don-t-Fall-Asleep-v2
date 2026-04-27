# Fail Conditions

## Global Fail Conditions
System QA must fail any output that violates:
- agent separation
- repository authority hierarchy
- role boundaries
- token efficiency requirements
- continuity requirements
- canonical file authority

## Packaging Fail Conditions
Packaging outputs fail if they do not comply with:
`/systems/packaging_scorecard_system.md`

Do not duplicate scorecard logic here.

## Agent Boundary Fail Conditions
Fail if:
- Core Dev Controller generates content.
- System QA generates content instead of validating.
- Packaging & Growth validates or routes.
- Production Pipeline bypasses QA.
- Pattern System promotes too many new candidates.
- Transcript Intelligence copies source material.

## Required QA Response
Return only:
- Status
- Failures
- Required Fixes
- Repository Updates Needed
- Next Action
