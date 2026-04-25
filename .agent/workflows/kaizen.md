---
description: Kaizen — review the last build session and suggest targeted edits to core SDLC workflows.
---

# /kaizen: Compound Engineering

Review the current or most recent build session and identify **3–5 specific edits** to the core SDLC workflow files (`/brainstorm`, `/plan`, `/build`, `/audit`, `/fix`, `/closeout`) that would have prevented friction, caught issues earlier, or produced better output automatically.

## The Process

1. **Scan the session** — look at what was built, what audit flagged, what fix resolved, and where the agent had to backtrack or iterate.

2. **Identify friction points** — where did things go wrong, get caught late, or require manual re-triage?

3. **Propose edits** — for each friction point, suggest a concrete change to a specific workflow file. Each suggestion must include:
   - **Target workflow**: which file to edit (`/audit`, `/fix`, etc.)
   - **Where**: the exact section or checklist it belongs in
   - **The edit**: the exact markdown text to add or replace

Output only the suggestions — no architecture lessons, no analogies, no teaching. Just the workflow edits.
