---
name: kaizen
description: Use during /closeout or between development iterations to apply continuous improvement (Kaizen) analysis to the codebase and process.
---

# Kaizen: Continuous Improvement

## Overview
Based on Japanese Lean methodology, Kaizen is the practice of continuous, incremental improvement. This skill ensures that every session doesn't just "finish" but also makes the system better, cleaner, and more efficient.

## The Kaizen Loop

**USAGE**: Trigger this during `/closeout` to identify one small improvement to make before finalizing.

### Focus Areas
1. **The 3Ms of Waste**:
   - **Muda (Waste)**: Remove dead code, redundant comments, or unused dependencies.
   - **Mura (Inconsistency)**: Standardize naming conventions or UI styles across related files.
   - **Muri (Overburden)**: Simplify over-complex functions or logic that "smells."

2. **Process Refinement**:
   - Did a tool call fail repeatedly? Update the skill or project context to prevent it.
   - Was a manual step tedious? Automate it or create a workflow.

## Implementing Improvements
Small, atomic changes are better than a single massive refactor. 
- "Refactor `auth.ts` to use helper" is a better Kaizen than "Rewrite auth system."

---

# Reducing Entropy

More code begets more code. Entropy accumulates. This section biases toward the smallest possible codebase.

**Core question:** "What does the codebase look like *after*?"

## The Goal
The goal is **less total code in the final codebase** - not less code to write right now.
- Writing 50 lines that delete 200 lines = net win.
- Keeping 14 functions to avoid writing 2 = net loss.

## Three Questions
1. **What's the smallest codebase that solves this?** Not the smallest change, but the smallest result.
2. **Does the proposed change result in less total code?** Count lines before and after. If after > before, reconsider.
3. **What can we delete?** Every change is an opportunity to remove obsolete code.

## Red Flags
- "Keep what exists" (Status quo bias).
- "This adds flexibility" (YAGNI).
- "Better separation of concerns" (separation isn't free, it costs lines).

---

# Artifact Management

Refactor bloated agent instruction files (CLAUDE.md, etc.) to follow **progressive disclosure principles** - keeping essentials at root and organizing the rest into linked, categorized files.

## Triggers
Use this when:
- Instruction files (like CLAUDE.md) exceed 500 lines.
- There are contradictions in the instructions.
- The root file is difficult to navigate.

## Process
1. **Analyze**: Find contradictions and redundant instructions.
2. **Extract**: Identify core instructions that *must* stay in the root file.
3. **Categorize**: Group remaining instructions into logical categories.
4. **Structure**: Create a file hierarchy (Root + linked files in `.agent/instructions/`).
5. **Prune**: Flag vague or obsolete instructions for deletion.

## Quick Reference
| Phase | Action | Output |
| :--- | :--- | :--- |
| 1. Analyze | Find contradictions | List of conflicts to resolve |
| 2. Extract | Identify essentials | Core instructions for root file |
| 3. Categorize | Group remaining instructions | Logical categories |
| 4. Structure | Create file hierarchy | Root + linked files |
| 5. Prune | Flag for deletion | Redundant/vague instructions |

---

## Verification Checklist
- [ ] Codebase is cleaner than it was at the start of the session.
- [ ] At least one instance of "Muda" (waste) identified and addressed.
- [ ] Process friction documented and mitigation proposed (or implemented).
- [ ] Improvements are atomic and TDD-verified.
- [ ] Net lines of code reduced (entropy check).
