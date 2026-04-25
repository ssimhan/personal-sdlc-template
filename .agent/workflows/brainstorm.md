---
description: Brainstorm and design a new feature or complex change. Uses the Socratic method to explore intent and constraints.
---

# /brainstorm

Use this workflow BEFORE starting any creative work to turn ideas into fully formed designs and specs through natural collaborative dialogue.

## Core Principles
- **Design for Failure Modes**: Always identify what happens when things go wrong. Build in fallbacks.
- **Constraints Create Freedom**: Clearly define what we NOT building.
- **One Question at a Time**: Don't overwhelm. Guide the user through the design process.
- **Incremental Validation**: Present the design in 200-300 word chunks and ask for feedback.
- **The 3PB Philosophy**: Build in three distinct layers:
  1. **Make it Work**: The minimal viable logic (The Emergency Exit).
  2. **Make it Right**: The clean implementation (Architecture & P0 Standards).
  3. **Make it Fast**: The high-performance layer (Optimistic UI & native feel).
- **Design for Flow**: Prefer inline inputs and contextual elements over disruptive modals or popups to keep the user in the context of their work.

## The Process

1. **Discovery**
   - **Pre-read context first**: Before asking any questions, read `PROJECT_ROADMAP.md` and `docs/BUGS.md`. Summarize in 3 bullets: (1) what phase we're closing out or starting, (2) what's already decided, (3) what actually needs a decision. Only ask questions about the undecided parts — never re-litigate what the roadmap already documents.
   - Read the current project state (`CLAUDE.md`, `README.md`, recent logs).
   - Ask Socratic questions one at a time to refine the idea. Focus on:
     - **Purpose**: Why are we building this?
     - **Audience**: Who is the user? How will they access it? (REQUIRED for UI work, see `ui-development` skill).
     - **Failure Modes**: What are the edge cases? How do we handle errors?
     - **Success Criteria**: What does "done" look like?
   - **If UI/Frontend Work Detected** — run the UI Architecture Process before any design decisions:
     1. **Interpret Intent**: Summarize the user goal and the workflow it implies.
     2. **Translate to UI Architecture**: Identify the likely page shell (dashboard, list/detail, settings, wizard, etc.), layout structure, and primary interaction model (read display, inline edit, form submission, drill-down, etc.).
     3. **Propose UI Options**: Present **2–3 UI patterns** that could solve the problem. For each option describe: layout, key components, interaction pattern, and when it works best. Use **canonical component names** throughout — table, drawer, modal, tabs, filter bar, command palette, card grid, data grid, sidebar nav, breadcrumb, stepper, toast, skeleton loader, empty state, etc. Never use vague terms like "popup" or "box."
     4. **Frontend Vocabulary**: Include a short "Frontend vocabulary used" section that briefly explains any components mentioned so the user learns the terms passively through repeated exposure.
     5. **Recommendation**: Recommend the best pattern and explain why it fits this specific workflow. Prefer standard SaaS patterns over novelty. Keep cognitive load low. Separate primary workflows from advanced configuration.
     6. **User Confirmation**: Get explicit approval on the pattern before proceeding.
     - After pattern is confirmed: Trigger `ui-development` skill, run domain exploration (concepts, color world, signature, defaults), and capture design direction in the design doc.

2. **Exploration**
   - **Library Landscape**: Before proposing approaches, use `WebSearch` to find open-source libraries that already solve the core problem. For each candidate, evaluate: maintenance health (last commit, stars, open issues), license (MIT/Apache preferred), bundle size, and API fit with the existing stack. Present a short **Build vs. Borrow** table. If a well-maintained library covers ≥80% of the need, default to it over a custom implementation.
   - **Batch Task Detection**: If any part of the feature involves processing more than ~10 items of the same type (files, records, API calls, assets), flag it — the implementation should use a CLI script, not manual or UI-driven steps. Note this in the PRD so `/plan` creates a dedicated script task.
   - Propose 2-3 different approaches with trade-offs, incorporating viable libraries where appropriate.
   - Lead with a recommendation and explain your reasoning.

3. **Presentation**
   - Present the validated design in sections (Architecture, Components, Data Flow, Error Handling).
   - After each section, pause for user confirmation: "Does this look right so far?"

4. **Persistence**
   - Write the final output as a **PRD** (Product Requirements Document) to `docs/plans/YYYY-MM-DD-<topic>-design.md`. Structure it with: Goal, Audience, Scope (what we're NOT building), Core Requirements, Success Criteria, Edge Cases & Failure Modes.
   - The PRD is the **context-reset anchor** — any time Claude's context runs out mid-build or the project stalls, re-reading the PRD restores alignment with the original intent. Reference it explicitly at the top of `/plan` and `/build` sessions.
   - **Append to `.agent/decisions.log`**: For each significant design decision made this session, append one line in this format:
     ```
     [YYYY-MM-DD] [Phase/Feature] — Decision: <what was chosen>. Rejected: <what was considered and not chosen>. Because: <the reason>.
     ```
     This log is read by `/plan` at the start of every planning session to prevent re-litigating past decisions.
   - Update `PROJECT_HISTORY.md` to reflect the design phase.

5. **Visual Validation (If UI Needed)**
   - Create a mockup (ONLY in static HTML files, never with Gemini image generation).
   - **Confirm the mockup with the user BEFORE moving to planning.**

**Next Step**: Once design and mockup are approved, use `/plan` to create an implementation plan.