# PRD: Repo Generalization & Beginner-Friendly Quickstart

**Date:** 2026-04-24  
**Branch:** cleanup  
**Status:** Approved — ready for /plan

---

## Goal

Sanitize and generalize the `claude-code-quickstart` repo so any non-technical beginner can fork it and immediately run a full agentic development cycle on their own project using 7 core slash commands.

---

## Audience

Non-technical beginners who are:
- New to GitHub and the terminal (first learning via [ccforeveryone.com](https://ccforeveryone.com/))
- New to Claude Code
- Want to build real projects but need structure and guidance

---

## Scope: What We're NOT Building

- Not a tutorial or course — just a clean, working starter kit
- Not adding new skills or workflows — only simplifying what exists
- Not keeping specialized/advanced tools (image-generator, composio, c4, etc.)
- Not keeping personal history, plans, or org-specific references

---

## Core Requirements

### 1. Core Workflow — 7 Slash Commands Only

The entire repo is organized around exactly these commands, in order:

```
/brainstorm → /plan → /build → /audit → /kaizen → /log → /closeout
```

Everything else is cut.

### 2. Files to DELETE

- `docs/archive/` — entire directory
- `plans/` — entire directory (replaced by template)
- `.claude/worktrees/` — stale worktree artifact
- All `.DS_Store` files
- `skills/specialized/` — entire directory
- `skills/planning/` — not referenced by core workflows
- `skills/dispatching-parallel-agents/` — not referenced
- `skills/observability/` — not referenced (if present)
- `skills/git-ops/` — not referenced (if present)
- `.claude/skills/sandhya-frontend-designer/` — personal, not part of core workflow
- `.agent/workflows/` files NOT in the 7 core (e.g. `sync-workflows.md`, `careful.md`, `fix.md`)

### 3. Files to KEEP

- `.agent/workflows/`: `brainstorm.md`, `plan.md`, `build.md`, `audit.md`, `kaizen.md`, `log.md`, `closeout.md`
- `skills/test-driven-development/`
- `skills/debugging/`
- `skills/kaizen/`
- `skills/writing-skills/`
- `skills/ui-development/`
- `tests/subagent-driven-dev/go-fractals/` — good example
- `tests/subagent-driven-dev/svelte-todo/` — good example
- `lib/`, `hooks/`, `agents/`
- `docs/BOOTSTRAPPING.md`, `docs/RELEASE-NOTES.md`

### 4. Files to REWRITE

**`README.md`** — Full rewrite:
- Title: generic (e.g. "Claude Code Quickstart")
- Step 1: Learn GitHub basics at [ccforeveryone.com](https://ccforeveryone.com/)
- Step 2: Install Claude Code
- Step 3: Fork this repo
- Step 4: Open in Claude Code, start with `/brainstorm`
- Show the 7-command workflow clearly
- Keep it short — beginner-friendly, no jargon

**`CLAUDE.md`** — Strip all personal/org references, keep as generic operating manual

**`PROJECT_HISTORY.md`** — Replace with blank starter template (fill-in sections)

**`skills/ui-development/SKILL.md`** — Remove "by Sandhya Simhan" attribution line

### 5. Files to ADD

- `plans/TEMPLATE.md` — blank plan template for forkers to use

---

## Success Criteria

- Zero personal names or org-specific references anywhere in the repo
- A non-technical person can read the README and know exactly what to do next
- Only the 7 core workflow commands exist — nothing extra to confuse
- `git grep -i "sandhya\|women defining ai\|antigravity"` returns zero results

---

## Edge Cases & Failure Modes

- Some workflows may reference skills being deleted — check each `.agent/workflows/*.md` for skill references before deleting
- `lib/skills-core.js` may have path references to deleted skill directories — verify after cleanup
- `.claude/` directory may have settings referencing deleted skills — check `settings.json` if present
