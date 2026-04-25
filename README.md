# Claude Code Quickstart

A plug-and-play starter kit for building real projects with Claude. Works with any tool that supports Claude — no special setup required.

---

## Works With Any Claude-Powered Tool

This repo doesn't care which tool you use. Just open your project in any of these and start talking to Claude:

| Tool | How to use this repo |
|------|----------------------|
| **Claude Desktop** | Open the folder as a project |
| **Claude Code** (terminal) | Run `claude` inside the repo folder |
| **VS Code + Claude extension** | Open the repo in VS Code |
| **Cursor / Windsurf** | Open the repo as your workspace |
| **Antigravity (Google)** | Open the repo in the Antigravity IDE |

Claude reads `CLAUDE.md` at the start of every session to understand your project and which commands are available. That's the only integration needed.

---

## Before You Start

**New to GitHub and the terminal?** Start here first:

**[ccforeveryone.com](https://ccforeveryone.com/)** — Learn the basics of GitHub, the terminal, and getting Claude Code set up. Once you're comfortable, come back here.

**[Github for non-technical roles](https://ben.balter.com/2023/03/02/github-for-non-technical-roles/)** - A slightly older guide with a lot more explanation just about Github which is useful to understand. You won't need to know the exact git commands they talk about here but it does a great job defining things. 

---

## Getting Started

### Step 1 — Fork this repo

Click **Fork** in the top-right corner of this page on GitHub. This creates your own copy to build on.

### Step 2 — Clone it to your computer

```bash
git clone https://github.com/YOUR-USERNAME/claude-code-quickstart.git
cd claude-code-quickstart
```

### Step 3 — Open it in your tool of choice

Then open the folder in whichever Claude-powered tool you use.

### Step 4 — Type `/start`

This is a first-time setup command. Claude will ask you a few questions about your project, update the config files, and point you to the right next step.

```
/start
```

---

## The 7-Step Workflow

Once you're set up, everything runs through this cycle:

| Step | Command | What It Does |
|------|---------|--------------|
| 0 | `/start` | First-time setup — orient Claude to your project |
| 1 | `/brainstorm` | Turn your idea into a clear design |
| 2 | `/plan` | Break the design into step-by-step tasks |
| 3 | `/build` | Write the code, test-first |
| 4 | `/audit` | Review what was built for quality |
| 5 | `/kaizen` | Clean up and improve what exists |
| 6 | `/log` | Track bugs, ideas, or tech debt |
| 7 | `/closeout` | Save progress, commit, and push |

Repeat this cycle for every feature or change.

---

## What's In This Repo

```
.agent/workflows/     # The slash commands above
skills/               # Reference guides Claude uses during each workflow
  debugging/          # Finding and fixing bugs systematically
  kaizen/             # Continuous improvement methodology
  test-driven-development/  # RED-GREEN-REFACTOR patterns
  ui-development/     # Building clean, user-centered interfaces
  writing-skills/     # How to write good prompts and skill files
tests/                # Example projects showing the full workflow in action
docs/                 # Plans, bootstrapping guide, release notes
plans/                # Your implementation plans (start with TEMPLATE.md)
PROJECT_HISTORY.md    # Your running log of decisions and progress
CLAUDE.md             # Operating manual — Claude reads this every session
```

---

## Example Projects

See `tests/subagent-driven-dev/` for two worked examples:
- **go-fractals** — a CLI app that generates fractal images
- **svelte-todo** — a simple to-do app in Svelte

Each includes a design doc, plan, and scaffold script showing the full cycle.

---

## Tips for Beginners

- **Run `/start` first** — it sets up your project context so Claude knows what you're building.
- **Start every new feature with `/brainstorm`** — it catches problems before they become code.
- **Let Claude ask questions** — the process feels slow but saves hours of rework.
- **Run `/closeout` at the end of every session** — it saves your progress and keeps history clean.
- **When in doubt, just ask** — type your question and Claude will tell you which command fits.

---

## Using This in an Existing Project

Already have code? You can drop this into any existing repo:

1. Copy `.agent/workflows/` into your project root
2. Copy `skills/` into your project root
3. Copy `CLAUDE.md` into your project root
4. Open in your Claude tool and run `/start`

See `docs/BOOTSTRAPPING.md` for details.

---

*Built on patterns from [obra/superpowers](https://github.com/obra/superpowers) and [Awesome Claude Skills](https://github.com/BehiSecc/awesome-claude-skills).*
