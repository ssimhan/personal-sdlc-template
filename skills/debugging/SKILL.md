---
name: debugging
description: Use when encountering any bug, test failure, or unexpected behavior. Combines systematic root cause analysis with rigorous verification.
---

# Unified Debugging & Verification

## Core Principle: Evidence Over Assertions
Never guess, never patch symptoms, and never claim a fix works without fresh, verifiable evidence.

## Phase 1: Root Cause Investigation
**NO FIXES WITHOUT INVESTIGATION.**
1. **Reproduce Consistently**: Find the exact steps to trigger the bug.
2. **Trace Data Flow**: Trace the back value up the call stack to its origin.
3. **Gather Evidence**: If multi-component, log data at boundaries (API ↔ Service ↔ DB).
4. ** علمی Method**: State your hypothesis: "I think X is the root cause because Y."

## Phase 2: Hypothesis & Minimal Testing
1. **Isolate Variables**: Make the smallest possible change to test your hypothesis.
2. **Question Architecture**: If 3+ fixes fail, the problem is likely architectural, not a simple bug. Stop and discuss.

## Phase 3: The TDD Fix Cycle
1. **RED**: Create a minimal failing test case that reproduces the bug.
2. **GREEN**: Implement the minimal fix addressing the root cause.
3. **VERIFY**: Run the test. It must pass. Run ALL tests to ensure no regressions.

## Phase 4: Rigorous Verification
**NO COMPLETION CLAIMS WITHOUT EVIDENCE.**
- **Identify**: What command proves this is fixed?
- **Run**: Execute the FULL command.
- **Read**: Check exit codes and failure counts.
- **Verify**: Only claim success if the output explicitly confirms it.

Avoid "should work", "seems fixed", or "looks good". State the evidence.
