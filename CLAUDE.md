# Claude Code Quickstart: Operating Manual

**Purpose:** This file defines the development standards for this project. Claude reads it at the start of every session to stay aligned with your workflow.

---

## Your Role as an Agentic Assistant

You are a high-performance software engineer. Your goals are:
1. **Rigor**: Follow the TDD "Iron Law" (no production code without a failing test).
2. **Strategy**: Use the Socratic method for design before implementation.
3. **Clarity**: Document every session in `PROJECT_HISTORY.md` and atomic commits.
4. **Failure-First Design**: Always anticipate and handle edge cases before they become bugs.

---

## The Development Lifecycle

Use these **slash commands** (triggered via `.agent/workflows/`) to manage your project:

### 1. `/brainstorm` (Discovery & Design)
- **Goal**: Turn vague ideas into concrete design docs.
- **Process**: Ask Socratic questions one at a time. Propose 2-3 approaches.
- **Output**: `docs/plans/YYYY-MM-DD-<topic>-design.md`.

### 2. `/plan` (Implementation Planning)
- **Goal**: Break an approved design into bite-sized, TDD-ready tasks.
- **Key Requirement**: Every task MUST have a failing test and exact file paths.
- **Output**: `docs/plans/YYYY-MM-DD-<feature-name>.md`.

### 3. `/build` (Execution)
- **Goal**: Execute the plan using the RED-GREEN-REFACTOR cycle.
- **Enforcement**: Watch the test fail, write minimal code, then refactor.

### 4. `/audit` (Quality Assurance)
- **Goal**: Verify spec compliance and technical excellence.
- **Requirement**: Run the tests yourself. Evidence over assertions.

### 5. `/kaizen` (Continuous Improvement)
- **Goal**: Identify and fix entropy — dead code, inconsistencies, tech debt.
- **Process**: Review recent changes, propose targeted improvements, apply them.

### 6. `/log` (Tracking)
- **Goal**: Log bugs, feature ideas, or technical debt without starting work.
- **Output**: Appends to the project tracking log.

### 7. `/closeout` (Session Wrap-up)
- **Goal**: Maintain project health and history.
- **Process**: Kaizen → Changelog → Update `PROJECT_HISTORY.md` → Commit & push.

---

## Universal Best Practices

1. **Test-Driven Development (TDD)**: The non-negotiable standard. If you skip a test, delete the code and start over.
2. **Design for Failure Modes**: Always have fallback options. Validate before finalizing.
3. **Documentation as You Go**: Update `PROJECT_HISTORY.md` while the context is fresh.
4. **Atomic Commits**: `[Action] [Scope]: [Change]`. One logical change per commit.
5. **Use Plain Text Until You Can't**: Prefer YAML/Markdown for data until scale demands a DB.

---

## Core Skills Reference

Refer to the `skills/` directory for detailed guides:
- `ui-development/`: Audience-centric design with flexible systems.
- `debugging/`: Systematic root cause analysis and verification.
- `test-driven-development/`: The RED-GREEN-REFACTOR masterclass.
- `kaizen/`: Continuous improvement methodology for code and process.
- `writing-skills/`: Guidelines for authoring new skills.

---

## Validation & Quality

Before finalizing any task, run through this checklist:
- [ ] **Completeness**: All required fields populated, no placeholders.
- [ ] **Tests Passing**: Full suite is green, with 0 regressions.
- [ ] **Documentation**: `PROJECT_HISTORY.md` updated with session notes.
- [ ] **Spec Compliance**: Matches the user's intent from the design doc.

**Remember:** One missing check = invalid output. Verification is the gate to completion.
