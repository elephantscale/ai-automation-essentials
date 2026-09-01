# Lab 05A - Real Automation: Scheduled Executive Brief with ChatGPT Work

## Goal

Create an optional real automation in ChatGPT Work: a scheduled task that produces a recurring
executive brief from an approved support-data snapshot, flags risky claims, and keeps a human
review step before anything is shared.

This lab exists to show that the manual analysis pattern from Lab 05 can become a real
automation. It is optional because ChatGPT Work, Scheduled Tasks, workspace agents, and connected
apps depend on account and admin settings.

## Time

30-45 minutes

## Tools

- ChatGPT Work
- Scheduled Tasks in ChatGPT
- Course files in `labs/assets/`
- `course-materials/scheduled-executive-brief-task.md`
- `course-materials/executive-brief-template.md`
- Optional: connected Gmail, Slack, or GitHub app if enabled by the workspace

No external connector is required for the main path.

## Important Limitation

Do not assume a scheduled task can read files uploaded to a ChatGPT Project. For this lab, paste a
small approved data snapshot directly into the scheduled task instructions. That makes the
automation self-contained and reliable in the class environment.

If your workspace supports connected apps or workspace agents, you may use the optional connected
track after instructor approval.

## What You Automate

The scheduled task produces a short support-triage executive brief.

```text
Scheduled trigger
   |
ChatGPT Work runs the saved task instructions
   |
Analyzes the pasted support-data snapshot
   |
Produces an executive brief with evidence and caveats
   |
Human reviews before sharing
```

## Source Snapshot

Use the safe sample rows from `labs/assets/sample-support-requests.csv`. Paste the rows into the
task instructions, not as a separate uploaded file.

Use this snapshot if you need a compact copy:

```csv
id,customer,request,channel,submitted_at
1,Acme Retail,"We want to set up AI to summarize weekly store reports.",web,2026-07-15
2,Northstar Health,"Can someone explain whether our team can upload patient records into a public AI tool?",email,2026-07-16
3,Metro Finance,"Our vendor invoice categories are messy. Can AI clean and group them?",email,2026-07-17
4,BrightPath Services,"We need a workflow that routes incoming requests by topic and urgency.",web,2026-07-18
5,Greenfield Co-op,"Can AI draft customer emails from product notes and approval rules?",web,2026-07-19
```

## Part 1 - Create The Scheduled Work Task

Open ChatGPT, choose **Work**, then create a scheduled task from a new Work chat or from
**Scheduled** if that is available in the sidebar.

Paste this full prompt into ChatGPT Work:

```text
Create a scheduled task for this classroom demo.

Task name: Weekly Support-Triage Brief

Run once 5 minutes from now. Do not repeat every 5 minutes.

Use only this sample data:

id,customer,request,channel,submitted_at
1,Acme Retail,"We want to set up AI to summarize weekly store reports.",web,2026-07-15
2,Northstar Health,"Can someone explain whether our team can upload patient records into a public AI tool?",email,2026-07-16
3,Metro Finance,"Our vendor invoice categories are messy. Can AI clean and group them?",email,2026-07-17
4,BrightPath Services,"We need a workflow that routes incoming requests by topic and urgency.",web,2026-07-18
5,Greenfield Co-op,"Can AI draft customer emails from product notes and approval rules?",web,2026-07-19

Every time it runs:
1. Count requests by channel.
2. Classify themes.
3. Flag any health, privacy, legal, financial, or sensitive-data request for human review.
4. Draft a short executive brief under 200 words.
5. Do not send, publish, approve, or change anything.

Output exactly these sections:
- Counts
- Risk flags
- Executive takeaway
- Human review needed
```

If ChatGPT asks for confirmation, approve the scheduled task. The five-minute delay is only
for the classroom demo so you can see one run happen live. For a real pilot later, change the
schedule to weekly or daily.

## Part 2 - Paste The Task Instructions

The prompt above is the fast classroom version. If you want the fuller reusable version, use
`course-materials/scheduled-executive-brief-task.md` and replace the `{{support_rows}}`
placeholder with the compact CSV snapshot above.

Before scheduling, check that the task instructions include:

- source boundary
- row-backed evidence
- no trend claims from five rows
- sensitive-data flag
- human-review section
- draft-only rule

## Part 3 - Review The First Run

When the task runs, review the output.

To find the run result:

1. Click **Scheduled** in the left sidebar.
2. Open **Weekly Support-Triage Brief**.
3. Confirm it says **Completed** or **Last run Today**.
4. Read the latest output in the right panel.
5. Click **Open chat** if you want the full run view.

Expected content:

- total requests: 5
- channel count: web 3, email 2
- themes with row IDs
- Northstar Health flagged for human review
- no confident trend claim
- one executive takeaway
- "human must decide" section

If ChatGPT claims a trend from five rows, ask it to revise:

```text
Revise the brief. Do not claim a trend from five rows. Keep the counts, row IDs, and caveat.
```

## Part 4 - Human Review Gate

Copy the brief into your review queue or write a review note with:

```text
Status: Needs human review
Reviewer:
Reason: recurring AI-generated brief; contains business recommendations
Decision needed: investigate the Northstar Health privacy question and validate any trend before action
```

Do not send, publish, or post the brief automatically.

## Optional Connected-App Track

Use this only if the instructor confirms the workspace has the needed app enabled.

Possible real event-triggered versions:

- Gmail: when a message with subject containing `Support Summary` arrives, draft a brief.
- Slack: when a new message appears in an approved class channel, summarize the update.
- GitHub: when a pull request changes, summarize review status.

Rules:

- read-only first
- no auto-send or write-back
- no confidential, regulated, or live customer data
- human approval before posting externally
- complete the connector-readiness checklist

## Deliverable

- Scheduled task title and schedule.
- Task instructions used.
- First generated executive brief.
- Human-review note.
- One sentence describing whether this should remain static, become connected read-only, or not be automated.

## Completion Criteria

The lab is complete when:

- a real ChatGPT Work scheduled task was created or attempted,
- the task produced or was ready to produce a source-backed brief,
- the output avoided unsupported trend claims,
- sensitive-data review was flagged,
- a human approval step was documented.

If Scheduled Tasks or Work is unavailable, document that limitation and complete the same prompt as a
manual run in ChatGPT Enterprise. The design still counts as an automation-ready artifact.
