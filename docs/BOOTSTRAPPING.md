# Bootstrapping New Projects

This guide explains how to transfer the skills, workflows, and "agentic brain" from this repository to a new project.

## 1. Directory Structure

To enable agentic capabilities, your new repository needs the following structure:

```text
new-repo/
├── .agent/
│   └── workflows/      # Slash commands (/brainstorm, /plan, /build, etc.)
├── skills/             # Technical "how-to" guides
└── CLAUDE.md           # The operating manual Claude reads every session
```

## 2. Transferring Skills & Workflows

1. **Workflows**: Copy the `.agent/workflows/` folder from this repo to your new repo's root.
2. **Skills**: Copy the `skills/` folder to your new repo's root.
3. **Operating manual**: Copy `CLAUDE.md` to your new repo's root and update it with your project's goals.

## 3. How Claude Uses These Files

`CLAUDE.md` is the first file Claude reads at the start of every session. It sets the rules, workflow, and context for your project.

The `skills/` directory gives Claude domain-specific knowledge for each phase of work. The `.agent/workflows/` directory defines what each slash command does.

## 4. Verification

Once files are copied, verify by asking Claude in the new repo:
- "What slash commands do you have available?"
- "Can you summarize the skills you have access to?"

If Claude can list `/brainstorm`, `/plan`, `/build`, etc. and explain the skills, your setup worked.
