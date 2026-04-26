# Pattern Update Protocol

## Purpose

This protocol defines how new transcript outputs are converted into repository memory.

Use this only after transcript outputs have been audited.

---

## Update Sequence

1. Review DISTILLED output
2. Review INDEXED output
3. Compare promoted patterns against pattern_library.md
4. Merge duplicates
5. Add only approved canonicals
6. Update pattern_index_map.md
7. Log major changes in execution_log.md if applicable

---

## Do Not Update Repository When

- only one weak transcript was processed
- outputs are unstable
- patterns are generic
- duplication is unresolved
- naming is inconsistent

---

## Batch Update Rule

Repository updates should be grouped.

Do not patch the library after every small run unless the change is high-value.

---

## Required Review Questions

Before adding any pattern:

- Does it duplicate an existing canonical?
- Is it a subtype?
- Is the name clean?
- Is the pattern useful for generation?
- Has it appeared more than once or is it uniquely high-impact?

---

## Integration Rule

Pattern library updates must not change production pipeline behavior unless explicitly reflected in prompts, playbooks, or generation rules.

The pattern library informs generation.
It does not override stage logic.
