---
description: Create a detailed, TDD-first implementation plan from an approved design.
---

# /plan

Use this workflow once a design has been approved to create a bite-sized, executable path forward.

## Core Principles
- **TDD-First**: Every chunk must start with a failing test.
- **Architectural Rigor**: Apply Clean Architecture, SOLID, and Domain-Driven Design (DDD) to ensure maintainability and high quality.
- **Bite-sized Granularity**: Each chunk should take 2-5 minutes to implement.
- **Zero Ambiguity**: Use exact file paths and specify line ranges when modifying.
- **Goals & Success Criteria**: Every block must have measurable outcomes.

## Terminology
- **Block**: A logical grouping of related work within this plan (e.g., "Data Schema", "Core Logic", "UI"). Do NOT use the word "phase" inside the plan — the outer project phase is the only level that uses that term.
- **Chunk**: A single bite-sized unit of work inside a block. Each chunk = one RED-GREEN-REFACTOR-COMMIT cycle.

## Process (Before Generating Plan)

**IF FRONTEND CHANGES ARE REQUIRED:**
1. **Mockup First**: You MUST create a single-file HTML prototype (e.g., `public/prototype_<feature_name>.html`) to mimic functionality and aesthetics.
   - Use standard HTML/CSS/JS (no build step required).
   - Ensure it matches `BRAND_GUIDELINES.md`.
   - Mimic interactions (modals, transitions, states) using vanilla JS.
2. **User Validation**: Present this mockup to the user for "look and feel" approval.
3. **Iterate**: Refine the mockup until the user says "Yes, build this."
4. **Data First Check**: Before planning UI, define the data source.
   - WHERE does the data come from? (API? Local Storage? File?)
   - IF the source doesn't exist, create a task to build it.
   - *Tip*: "Mocking" in the UI component is technical debt. Mock at the source/API level instead.
5. **Infrastructure Safety Checks**:
    - **Remote Schema Verification**: Verify that every database column referenced in new code has actually been applied to the live Supabase project. Run `npm test tests/infrastructure/schema.test.ts` and `node scripts/status-quovadis.js` to ensure the live DB matches expectations.
    - **Environment Parity**: Ensure your local `.env.local` has the exact same secrets as Vercel before testing begins.
    - IF columns are missing, keys are missing, or data types are wrong, create a **Safety/Migration** task as the first bite-sized task.
    - **Environment & Secrets Setup**:
      - [ ] List every required env var and confirm which file loads it (`.env`, `.env.local`, etc.)
      - [ ] If using dotenv, specify load order explicitly: `.env.local` first (local overrides), then `.env` (shared defaults)
      - [ ] Confirm all secret-holding files are in `.gitignore` before the first test run
      - [ ] If the feature calls an external API: define idempotency strategy upfront — cache file, fixture, or mock flag. Never rely on re-running the live API call for dev/test iteration.
6. **Reliability Pre-flight**: Before finalizing the plan, map all external interactions.
    - [ ] **Timeout Mapping**: Identify every `fetch` or `supabase` call and assign a timeout (10s for standard UI actions, 30s for heavy AI/TTS operations).
    - [ ] **Error Toasts**: Ensure every `catch` block includes both a `toast.error` for the user and a `console.error` for technical debugging.
    - [ ] **Live-Service Test Gate**: Any test that calls a real external service must be gated behind `describe.skipIf(!process.env.MY_TEST_FLAG)` so CI passes without that service running.
7. **Conventions Check**: Before writing the plan, read 1-2 existing files in each category you'll be creating (test, component, API route). Scan `.agent/gotchas.md` for patterns relevant to this work. Document key conventions as constraints in the plan:
     - [ ] **Auth Architecture Guard**: Ensure the Sign In page and API routes use the exact same auth provider. Review project history and existing wrappers.
     - [ ] **Test Style**: What assertion library? What mock patterns?
     - [ ] **File Patterns**: How are imports structured? Named exports or defaults? Where do types live?
     - [ ] **Error Handling**: What's the existing `catch` pattern? Toast + console, or something else?
     - [ ] **Reuse Audit**: For every new function the plan calls for, search the codebase first. If an existing function covers ≥80% of the need, the plan task must say "call `X`, don't re-implement." State "No existing equivalent found" explicitly if the search came up empty. Agents will not look for helpers unless told to.
8. **Plan**: ONLY then, proceed to write the Implementation Plan below, referencing the approved mockup as the "Spec".

## Plan Structure (MUST include these sections)

1. **Header**
   - **Goal**: One sentence describing what this builds.
   - **Architecture**: 2-3 sentences about the approach.
   - **Design Patterns**: Specify if using Factory, Observer, Repository, etc.
   - **Tech Stack**: Libraries or frameworks involved.

2. **Blocks**
   - Break work down into logical blocks (e.g., Block 1: Data Schema, Block 2: Core Logic, Block 3: UI).
   - Never call a block a "phase" — that word is reserved for the outer project level.
   - For each block, list **Success Criteria** using checkboxes.

3. **Chunks** (inside each Block)
   For each chunk, provide:
   - **Files**: Create: `path/to/new.ts`, Modify: `path/to/old.ts:L10-20`.
   - **Step 1: Write failing test**: Provide the minimal test code.
   - **Step 2: Verify failure**: Specify the command and expected error.
   - **Step 3: Implement minimal code**: Provide the smallest implementation.
   - **Step 4: Verify pass**: Specify command and expected output.
   - **Step 5: Commit**: Provide the bash command and atomic message.

4. **Technical Debt Strategy**
   - Identify any known shortcuts or "hacks" being introduced to meet the goal.
   - List them explicitly so they can be added to `BUGS.md` if the plan is approved without addressing them immediately.

5. **Production & Design Standards (P0)**
   - Before finalizing the plan, ensure the design satisfies the standards in **.agent/REFERENCE.md**.
   - **Timeout Mapping**: Identify every `fetch` or `supabase` call and assign a timeout (10s for standard UI, 30s for AI).
   - **Error Handling**: Plan for `toast.error` + `console.error` on every async path.
   - **Loading States**: Every new route MUST include a `loading.tsx` with skeleton loaders.

6. **For UI Features**
   - Check for `.interface-design/system.md`
   - If exists: Load and apply established patterns in implementation plan
   - If not: Include design system creation as a chunk in the plan

## Persistence
- Save the plan directly to the project repository path `docs/plans/YYYY-MM-DD-<feature-name>.md`. Do NOT use internal AI artifact systems for this document.
- Ask the user: "Ready to start building? Use `/build`."

## Completion Requirements

The outer project phase is NOT complete until the following workflow sequence is executed:

1. **`/build`** - Execute the implementation plan
2. **`/audit`** - Perform combined technical and UX verification
3. **`/closeout`** - Document and commit

Skipping `/audit` is not permitted. The project phase remains open until BUGS.md shows zero active items for it.
