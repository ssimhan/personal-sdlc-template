---
description: Perform a combined technical and UX audit of newly built code.
---

# /audit

Use this workflow to ensure code is production-ready and aesthetically perfect before merging. This replaces separate code review and UX verification steps.

## 1. Technical Audit (The "Engine" Check)
Inspect the implementation for reliability and performance.
*   **P0 Standards**: Consult `.agent/REFERENCE.md` for the Technical Reliability checklist (Timeouts, Idempotency, etc.).
*   **Test Verification**: Run the test suite. If tests are missing or failing, the audit is **FAILED**.
*   **Test Data Parity**: If any core validation rules (e.g., UUID formats, token shapes, or required fields) were changed during development, visually verify that Vitest `.mockResolvedValue` stubs and test objects reflect the new strict shapes BEFORE running `npm test`, preventing cascading false-positive failures.
*   **Schema Integrity**: Run `npm test tests/infrastructure/schema.test.ts`. If columns are missing or data types have drifted without a migration, the audit is **FAILED**.
*   **Filter String Wildcards**: If any new code uses Supabase `.or()` with inline filter strings, verify `ilike` patterns use `*` (not `%`). Example: `url.ilike.*linkedin.com*`. The `%` form silently returns no rows when used inside a filter string.
*   **Hooks-in-Lists**: Grep new list-rendering components for hook calls (`use`) inside `.map()` callbacks. Any hook called inside a loop is a Rules of Hooks violation — extract to a sub-component.
*   **Dead Component Check**: For every new component added this phase, verify it is imported and rendered somewhere. Search for its name — if the only match is its own file, it is not wired in. Treat this as a Critical bug.
*   **Path Sanitation**: Verify no URL-encoded directories (e.g., `%5Bid%5D`) exist in the `src/app` tree. These cause silent routing conflicts.
*   **CSS Variable Integrity**: Grep new CSS/HTML files for self-referencing variables (e.g., `--var: var(--var)`) or undefined fallbacks. Example: `grep -n "var(--[a-z-]*): *var(--[a-z-]*)" src/**/*.{css,html}`. Any hit is a P0 (invisible/broken UI).
*   **CLI Entry Points**: For any tool with a `main()` or entry point handler, verify it uses ESM-safe detection (`import.meta.url` + `fileURLToPath()`) or CommonJS-safe detection (`require.main === module`), not substring matching on `process.argv[1]`. Substring patterns are fragile and break if the script is renamed or wrapped.

### Clean Code (Entropy Review)
Spawn a fresh subagent with **only** the changed files as context — no plan doc, no conversation history, no justification. Use `git diff --name-only HEAD~N` to identify files modified this phase. Give the subagent this prompt:

> "Review these files as a senior engineer seeing them for the first time. Identify: (1) code that solves a problem that doesn't exist yet (YAGNI), (2) duplicated logic that should be a shared utility (DRY), (3) abstractions introduced for a single use case (premature abstraction), (4) functions or components doing more than one job (single responsibility), (5) anything that will be confusing to the next person reading this. Be specific — name the file and line. Do not praise what's working."

Triage findings into three buckets:

| Bucket | Definition | Action | Symptom Patterns |
|---|---|---|---|
| **Blocking** | Violates DRY, YAGNI, or SRP in a way that will cause real future pain | Fix before proceeding | "code that solves a problem that doesn't exist yet" / "duplicated 3+ times" / "doing more than one job" / logic should be extracted |
| **Improvement** | Valid point, non-urgent | Log to `BUGS.md` as Low DEBT | "undocumented", "should be", "fragile", "magic number without comment", "inconsistent with existing pattern" |
| **Nitpick** | Style, naming preference, minor | Acknowledge, skip | "why", "next person will wonder", "naming inconsistency", "could use shorter name", "comment might help" |

Fix all Blocking issues and re-run tests. If blocking issues were fixed, re-run the subagent on the updated files until its highest-severity finding is Improvement or lower. Note: the subagent will sometimes critique intentional simplicity as "missing abstraction" — the right amount of complexity is the minimum needed for the current task.

## 2. UX & Aesthetic Audit (The "Chassis" Check)
Verify the interface and user interaction.
*   **Design Standards**: Consult `.agent/REFERENCE.md` for Visual and Interaction standards (Teal anchor, Spring physics).
*   **Documentation Freshness**: Grep `NEXT.md` and `docs/` for stale status markers: `grep -n "Ready to Build\|In progress\|Pending\|Blocked" NEXT.md docs/*.md`. Cross-check against git history and current branch state. If a phase shows as "Ready" or "In progress" but commits exist for that phase from this session, mark as debt and update status.
*   **Manual Verification**: 
    1. Run `npm run dev`.
    2. Open [http://localhost:3000].
    3. Verify responsiveness, Dark Mode parity, and "The Librarian" brand voice.

## 3. Results & Remediation
*   **Small Fixes**: Correct minor typos, spacing, or color variables immediately.
*   **Blocking Issues**: Add any bugs or UX debt to `BUGS.md` with `/log`. For debt items that involve moving code, use this template for maximum agent-fixability:
    ```
    Move X from file A (line N) to file B. Update imports in: file C, file D.
    ```
    Include: what moves, exact source location, destination, and every affected import site. An agent given this template can execute the fix without any investigation step.
*   **Audit Status**:
    *   ✅ **PASS**: Specs met, P0s satisfied, Aesthetics verified.
    *   ❌ **FAIL**: Known bugs, P0 violations, or UX drift.

**Next Step**: Once audit is passing, run `/kaizen` followed by `/closeout`.
