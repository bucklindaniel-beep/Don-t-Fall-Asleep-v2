# System — Filesystem Rules

STATUS: ACTIVE AFTER PATCH
SCOPE: Claude filesystem and repository path handling

## Core Rule
Use repository-relative paths only during Claude execution.

## Path Rules
- Never use `/mnt` paths in Claude prompts or repository instructions.
- Prefer paths relative to the visible repository root.
- Validate directory existence before write-back.
- If path is not visible, return BLOCKED and stop.
- Do not retry blindly when a path is not visible.

## Known Repository Boundary Note
The current development environment may contain both:

- parent workspace: `Claude_Repo/`
- active repository folder: `Claude_Repo/v2/`

Claude may only access directories explicitly allowed in filesystem configuration.

## Enforcement
If a required path exists locally but Claude reports it missing, treat this as a filesystem-scope issue, not a repository content issue.

## Future Cleanup
Consolidate transcript directories and scripts under the active repository root when it is phase-safe.
