---
description: Log bugs, technical debt, or feature ideas into the tracking system.
---

# /log — Capture without implementing

Categorize: **Bug/Debt** → `docs/BUGS.md` active table. **Feature/Idea** → `PROJECT_ROADMAP.md`.

**Bug/Debt format**: `| [ID] | Description | Severity (Critical/High/Medium/Low) | Active | Note |`
- For debt items that move code, use: `"Move X from file A (line N) to file B. Update imports in: file C, file D."` — this lets an agent fix it without any investigation step.

**Feature format**: Add to the current phase section if it's a small UX tweak; add to a future phase if it's a new capability.

**Hard stops**: No root cause investigation. No fix proposal. No new branch. No reading beyond what's needed to categorize.

Confirm with: `"Added [ID] to [File]. Not starting work on this."`
