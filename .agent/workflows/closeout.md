---
description: Update documentation, commit and push to the latest branch
model: haiku
---

# /closeout

Use this workflow to wrap up a development session and maintain a clean project history.

> **Model note**: Use the Haiku model for all doc-writing and file-editing steps in this workflow — it is fast and sufficient for structured documentation tasks. Only escalate to Sonnet/Opus if you encounter ambiguous content decisions that require judgment.

## Prerequisites
- `/audit` has been completed and passed
- `/fix` has been completed with zero remaining bugs/debt
- `docs/BUGS.md` shows all items resolved for current phase

## The Process

### 1. Integration of Learnings
- **Pull Lessons**: Retrieve the "Lessons Learned" established in the recent `/kaizen` session.
- **Update Lessons Artifact**: Ensure `docs/lessons_learned.md` is current — prepend a new dated entry at the top.
- **Update Gotchas**: If any new failure pattern was identified this session (a new "Tell", a silent bug, a wrong assumption), append it to `.agent/gotchas.md` in the appropriate section. Include: the pattern name, a code example showing wrong vs. right, and the "Tell" that signals the problem. Update the "Last updated" line at the bottom of the file.

### 2. Documentation Update
- **Project History**: Update `PROJECT_HISTORY.md` — prepend a new dated entry at the top with:
    - Date and Phase name
    - Key Accomplishments (bullet points)
    - Key Learnings (from Step 1)
- **Roadmap**: Update `PROJECT_ROADMAP.md` — mark the just-completed phase with ✅ and check off all completed items.
- **Bugs**: Ensure `docs/BUGS.md` — active table is clean (resolved items moved to Resolved section).
- **README**: Update `README.md` to reflect the current state of the project:
    - Move the just-completed phase from the "Future Roadmap" section to the "Core Features" section (or update existing feature bullets to include Phase additions).
    - Update the "Future Roadmap" section so the *next* phase is listed first.
    - Keep the README as a live "what does this app do today" document — not a historical log (that's `PROJECT_HISTORY.md`'s job).

### 3. Workflow Synchronization
- Run the `/sync-workflows` workflow to ensure local workflow improvements are upstreamed to the quickstart repo (if applicable) or synced down.
    - *Note*: If any workflow file (`~/.claude/commands/*.md`) was modified this session, push those changes.

### 4. Git Hygiene + CI Check
- **CI Smoke Test**: `npm run lint && npm test && npm run build` — must be clean before committing docs.
- **Commit**: Stage and commit all documentation updates with a clear `docs(phase-N): closeout` message.
- **Push**: Push the current feature/phase branch to remote.
- **Secret Hygiene**: If the phase added new env vars, confirm they exist in GitHub → Settings → Secrets → Actions.

### 5. Phase Transition (If Applicable)
- **Check Roadmap**: Did we just complete a Phase?
- **Branch**: If yes, ask the user if they want to start the next phase or stay in the current branch. If starting next phase, create: `git checkout -b phase-N` where N is the next phase number from the roadmap.
- **Notify**: Inform user of the new active branch and what Phase N contains.

### 6. Summary
- Provide a concise final summary (5–8 bullets max) covering: what shipped, what was deferred, test count delta, and next phase name.
