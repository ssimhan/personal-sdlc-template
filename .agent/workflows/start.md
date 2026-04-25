---
description: First-time setup guide. Run this when you're new to this repo or starting a brand new project.
---

# /start

Welcome! This command walks you through getting oriented and kicks off your first project session.

## The Process

### Step 1 — Read the room

Before saying anything, silently check:
- Does `PROJECT_HISTORY.md` have real content, or is it still the blank template?
- Does `CLAUDE.md` describe a real project, or is it still generic?
- Are there any existing source files in the repo beyond the quickstart scaffolding?

Use this to determine if this is a **first-time setup** or a **returning session**.

---

### Step 2 — Greet and orient

Introduce yourself warmly and briefly. Explain what this repo is and what you can help with. Keep it to 3-4 sentences — no walls of text.

Then ask the first question:

> **What are you trying to build?**

Wait for their answer. Don't ask multiple questions at once.

---

### Step 3 — Ask three focused questions, one at a time

After they describe their project, ask these in order — one at a time, waiting for each answer:

1. **"Do you have any existing code, or are we starting from scratch?"**
   - If existing code: ask them to describe it briefly or point you to the key files
   - If scratch: note this and move on

2. **"What does success look like for you — what do you want to be able to do when this is done?"**
   - Listen for the outcome, not the technical solution

3. **"Have you used Claude Code (or a similar AI coding tool) before?"**
   - If yes: skip the orientation, go straight to `/brainstorm`
   - If no: give a one-paragraph plain-English explanation of how the workflow works before continuing

---

### Step 4 — Update project files

Once you have their answers, do the following without asking permission:

1. **Update `CLAUDE.md`**: Fill in the project goal, audience, and any constraints they mentioned. Keep the structure intact — just replace the placeholder sections.

2. **Update `PROJECT_HISTORY.md`**: Fill in the Project Goal and Target Audience fields with what they told you.

3. **Confirm** what you wrote in one short message: "I've updated your project files with what you told me. Here's what I captured: [2-3 bullet summary]. Does that look right?"

---

### Step 5 — Route to the right next step

Based on the conversation:

- **If they have a clear idea but no plan** → "Great — let's run `/brainstorm` to turn this into a solid design before we write any code."
- **If they already have a design or spec** → "Sounds like you're ready to plan. Let's run `/plan` to break this into tasks."
- **If they have existing code and want to improve it** → "Let's start with `/audit` to see where things stand."
- **If they're not sure what they want yet** → "No problem — `/brainstorm` is exactly the right place to start. It'll help us figure that out together."

Always end with a clear next step. Never leave them wondering what to do.
