# Lab Setup - AI Automation Essentials

The labs are browser-based and run in the class VM with ChatGPT Enterprise. You do not need
Python, Docker, a code editor, Google Drive, Slack, email, or local development tools.

## Required

- Modern browser: Chrome, Edge, Firefox, or Safari
- Internet access
- Access to **ChatGPT Enterprise** in the class VM
- The sample files in `labs/assets/` and the templates in `course-materials/`

## Tool Choices

The course materials remain conceptually tool-flexible, but this delivery uses ChatGPT
Enterprise as the default and only required student tool.

| Category | Examples |
|----------|----------|
| Required assistant | ChatGPT Enterprise |
| Optional real automation | ChatGPT Work / Scheduled Tasks, if enabled |

## Data Rules

- Use only approved sample data unless told otherwise in class.
- Do not paste confidential, regulated, or client-private data into any AI tool without
  explicit approval, even an enterprise workspace.
- Keep a human review step in any workflow that sends, publishes, deletes, or buys.
- Verify important facts before using AI output in a decision.

## Sample files in `labs/assets/`

- `sample-support-requests.csv` — 5 support requests (classification / automation / analysis)
- `lab01-routing-requests.csv` — 6 operational routing requests for the first rules-vs-AI lab
- `sample-meeting-notes.md` — meeting notes (summarize / extract / prompt chains)
- `sample-help-center.md` — fictional help-center doc (grounding, guardrails)
- `sample-vendor-invoices.csv` — a deliberately messy vendor export (data clean-up)
- `sample-dashboard.png` — a small dashboard image for "read the numbers" tasks

## ChatGPT Enterprise Setup

In ChatGPT, create a Project if the workspace allows it. If Projects are disabled, use a fresh
chat and paste the project instructions from `course-materials/enterprise-project-setup.md`.

Most connector/app work in this course is planning-only. Students use upload, paste, Projects,
data analysis, image reading, and review queues. Optional Lab 5A can use ChatGPT Work /
Scheduled Tasks for a real recurring task when the workspace supports it. Connected-app
versions remain optional and require instructor approval.

## Verify Your Machine

```sh
./labs/verify-setup.sh
```
