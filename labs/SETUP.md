# Lab Setup - AI Automation Essentials

The labs are browser-based. You do not need Python, Docker, a code editor, or local
development tools.

## Required

- Modern browser: Chrome, Edge, Firefox, or Safari
- Internet access
- Access to a current **AI assistant** (Claude, ChatGPT, or Gemini)
- The sample files in `labs/assets/` and the templates in `course-materials/`

## Optional

- A **no-code automation platform** (Zapier, Make, Power Automate, Copilot Studio, or n8n —
  a free tier is enough) for Module 4 and the capstone. **Not required:** the instructor
  demos a live platform build, and students run the same logic by hand in their AI assistant
  (Module 4 Part 3b; capstone by-hand simulation). The design is what's graded, not the wiring.

## Tool Choices

The course is tool-flexible — use whichever your organization has approved. Where a lab
shows a prompt or a workflow, it works the same across assistants and platforms; only the
buttons differ.

| Category | Examples |
|----------|----------|
| AI assistant | Claude, ChatGPT, Gemini |
| Automation platform | Zapier, Make, Microsoft Power Automate, Copilot Studio, n8n |

## Data Rules

- Use only approved sample data unless the instructor confirms otherwise.
- Do not paste confidential, regulated, or client-private data into a public tool.
- Keep a human review step in any workflow that sends, publishes, deletes, or buys.
- Verify important facts before using AI output in a decision.

## Sample files in `labs/assets/`

- `sample-support-requests.csv` — 5 support requests (classification / automation / analysis)
- `sample-meeting-notes.md` — meeting notes (summarize / extract / prompt chains)
- `sample-help-center.md` — fictional help-center doc (grounding, guardrails)
- `sample-vendor-invoices.csv` — a deliberately messy vendor export (data clean-up)
- `sample-dashboard.png` — a small dashboard image for "read the numbers" tasks

## Verify Your Machine

```sh
./labs/verify-setup.sh
```
