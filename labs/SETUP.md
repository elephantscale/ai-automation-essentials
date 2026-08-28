# Lab Setup - AI Automation Essentials

The labs are browser-based and run in the class VM with ChatGPT Enterprise. You do not need
Python, Docker, a code editor, Google Drive, Slack, email, or local development tools.

## Required

- Modern browser: Chrome, Edge, Firefox, or Safari
- Internet access
- Access to **ChatGPT Enterprise** in the class VM
- The sample files in `labs/assets/` and the templates in `course-materials/`

## Optional

- A no-code automation platform or connected app for instructor demo only. Student labs do
  not require external connectors.

## Tool Choices

The course materials remain conceptually tool-flexible, but this delivery uses ChatGPT
Enterprise as the default and only required student tool.

| Category | Examples |
|----------|----------|
| Required assistant | ChatGPT Enterprise |
| Optional instructor demo | Zapier, Make, Microsoft Power Automate, Copilot Studio, n8n, or connected apps |

## Data Rules

- Use only approved sample data unless the instructor confirms otherwise.
- Do not paste confidential, regulated, or client-private data into any AI tool without
  explicit approval, even an enterprise workspace.
- Keep a human review step in any workflow that sends, publishes, deletes, or buys.
- Verify important facts before using AI output in a decision.

## Sample files in `labs/assets/`

- `sample-support-requests.csv` — 5 support requests (classification / automation / analysis)
- `sample-meeting-notes.md` — meeting notes (summarize / extract / prompt chains)
- `sample-help-center.md` — fictional help-center doc (grounding, guardrails)
- `sample-vendor-invoices.csv` — a deliberately messy vendor export (data clean-up)
- `sample-dashboard.png` — a small dashboard image for "read the numbers" tasks

## ChatGPT Enterprise Setup

In ChatGPT, create a Project if the workspace allows it. If Projects are disabled, use a fresh
chat and paste the project instructions from `course-materials/enterprise-project-setup.md`.

All connector/app work in this course is planning-only unless the instructor explicitly demos
it. Students use upload, paste, Projects, data analysis, image reading, and review queues.

## Verify Your Machine

```sh
./labs/verify-setup.sh
```
