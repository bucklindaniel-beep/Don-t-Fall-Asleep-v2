<<<<<<< HEAD
## OUTPUT TYPE ENFORCEMENT
=======
git add .\\systems\\output\_contract.md

git commit -m "add output contract system"

git push


## OUTPUT TYPE ENFORCEMENT

Claude MUST output ONLY the stage artifact.

Claude MUST NOT output:

- assessments
- evaluations
- compliance tables
- verdicts
- summaries about correctness

---

## STORAGE RULES

Claude MUST NOT:

- include "File:" fields
- include file paths
- simulate storage
- claim files are written

---

## CLEANED STAGE CONTRACT

### Filename

{source_name}_cleaned.md

- lowercase
- underscore-separated
- no dot notation

---

### Metadata (STRICT LIMIT)

Allowed:

- Source Name
- Source Type
- Source Category
- Date Cleaned

No other fields allowed.

---

### Text Rules

Claude MUST:

- preserve original wording exactly

Claude MUST NOT:

- paraphrase
- rewrite
- summarize
- generalize
- change perspective

---

### Output Content

Must include:

1. Metadata
2. Cleaned Transcript
3. Cleaning Notes

Must NOT include:

- file paths
- storage references
- correction notes
- meta commentary