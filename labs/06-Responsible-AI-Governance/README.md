# Lab 06 - Responsible AI, Enterprise Governance & Connector Readiness

## Goal

Turn governance into concrete controls you can apply in ChatGPT Enterprise. You will fix a
biased prompt, redesign a data-leaky workflow, audit project/file sharing risks, and complete
a connector-readiness assessment for a future integration.

No external connector is required. The VM only needs ChatGPT Enterprise and the course files.

## Time

75-90 minutes

## Tools

- ChatGPT Enterprise
- `labs/assets/sample-support-requests.csv`
- `labs/assets/sample-help-center.md`
- `course-materials/ai-use-policy-template.md`
- `course-materials/connector-readiness-checklist.md`
- `course-materials/review-queue-template.md`

## Steps

1. Run a flawed hiring-screen prompt and name the risks before fixing it.
2. Rewrite it with job-relevant criteria, no proxy variables, evidence, and human ownership.
3. Run an identity-swap test and check whether scores move.
4. Redesign a leaky workflow for an approved enterprise workspace.
5. Audit project/file/sharing risks in a ChatGPT Enterprise workflow.
6. Complete connector readiness for a future source system.
7. Draft a one-page team AI-use policy.

## Prompt Starter

Use this frame when rewriting people-facing prompts:

```text
Score each item ONLY on the stated, job-relevant criteria below.
Use only information explicitly present. Do NOT infer from or consider name, gender, age,
ethnicity, school prestige, address, photo, hobbies, club affiliations, or employment gaps.
Quote the evidence for each score. If a criterion is not addressed, write "not stated".
Do not rank, recommend, hire, reject, approve, deny, or make the people-decision.
The human reviewer owns the decision.
```

## Detailed Exercise

### Part 1 - Fix A Flawed, Biased Prompt

Run this flawed prompt once so you can see the failure:

```text
You are a hiring expert. Look at these candidates and tell me who to interview.
Rank them from best to worst culture fit, and tell me who seems the most reliable
and hardworking. Give me your gut read on each person.
```

Paste these fictional candidates:

```text
A) Jordan Rivera - State University, 6 yrs ops experience, led a 4-person team,
   two-year gap 2021-2023, captain of the women's soccer club.
B) Chris Bauer - Ivy College, 5 yrs ops experience, no gaps, rowing team.
C) Sam Okafor - City College evening program, 7 yrs ops experience, managed
   vendor budgets, volunteers with a youth mentoring group.
```

Before fixing it, name the problems:

- "Culture fit," "reliable," "hardworking," and "gut read" invite stereotypes.
- School prestige, gaps, hobbies, and names are proxy variables.
- No job-relevant criteria are defined.
- No evidence is required.
- The prompt asks AI to make a people decision.

Now rewrite it:

```text
You are helping a human screener organize candidates for a first-pass review of an
Operations Coordinator role. You do NOT make the interview decision.

Score each candidate 1-5 on these job requirements only:
1. Operations experience
2. Team or people leadership
3. Budget or vendor management

Rules:
- Use only information explicitly stated.
- If a requirement is not addressed, write "not stated".
- Do not infer from or consider name, gender, ethnicity, age, school prestige, address,
  photo, hobbies, club affiliations, or employment gaps.
- Quote the exact evidence for each score.
- Return a table: Candidate | Operations | Leadership | Budget/vendor | Evidence quotes.
- Do not rank or recommend who to interview. The human screener decides.
```

Identity-swap test: change only names and club affiliations. Scores should not move. If they
move, the prompt still leaks proxy bias.

### Part 2 - Redesign A Data-Leaky Workflow

Read the leaky workflow:

```text
TRIGGER   New customer support email arrives. It may contain name, email, order number,
          payment details, health information, or anything the customer typed.

[1] The full raw email is pasted into a personal AI account to summarize and draft a reply.
[2] The AI draft, possibly repeating PII, is written to a shared spreadsheet any employee can open.
[3] The automation auto-sends the AI draft to the customer.
[4] The full email text is copied into a public prompt-log doc so the team can reuse examples.
```

Find the leaks:

- Full PII into a personal/unapproved account.
- Customer email treated as trusted instructions, creating prompt-injection risk.
- Draft with PII stored in a broadly shared location.
- Auto-send with no human gate.
- Raw PII stored in a reusable prompt log.

Redesign for ChatGPT Enterprise:

```text
TRIGGER   New support email arrives.

[1] CLASSIFY DATA FIRST - decide public/internal/confidential/regulated.
[2] REDACT BEFORE AI - replace real identifiers with [NAME], [EMAIL], [ORDER], [CARD].
[3] APPROVED WORKSPACE - use only the approved ChatGPT Enterprise workspace/project.
[4] FENCE INPUT - customer text is untrusted data, not instructions.
[5] DRAFT ONLY - AI writes a draft with placeholders and source-grounded language.
[6] REVIEW QUEUE - restricted reviewer queue; no broad shared sheet.
[7] HUMAN GATE - reviewer edits, approves, and sends manually.
[8] SAFE LOG - log run ID, category, reviewer, outcome, timestamp; no raw PII.
```

Use `review-queue-template.md` for the queue fields.

### Part 3 - Enterprise Project And File Governance

Review the ChatGPT Project or chat workspace you used in Lab 04/05. Answer:

```text
1. What files are in the workspace?
2. Are any files real customer, employee, student, health, payment, legal, or confidential data?
3. Who can see the project/chat/output in a real workplace?
4. What should be deleted, redacted, or moved before sharing?
5. What project instruction prevents guessing, unsafe actions, and prompt injection?
6. What would need admin approval before a connector is enabled?
```

For this class, the expected answer is simple: only fictional sample data is allowed. In a real
organization, file visibility, retention, sharing, and audit needs must be checked before reuse.

### Part 4 - Connector Readiness Governance

Open `connector-readiness-checklist.md`. Assess this future workflow:

```text
Future workflow: ChatGPT reads new support tickets from a ticketing system, drafts replies
from an approved help-center file, logs a risk flag, and places drafts in a review queue.
```

Recommended controls:

- Start with read-only ticket access.
- Limit source fields to those needed for triage.
- Redact or avoid sensitive fields before AI drafting.
- Keep all replies draft-only.
- Require a restricted review queue.
- Log metadata and reviewer outcome.
- Do not enable write-back or auto-send until the pilot passes review.

### Part 5 - Draft Your Team AI-Use Policy

Open `ai-use-policy-template.md` and fill it for a realistic team.

Required additions:

- Name ChatGPT Enterprise as the approved assistant, if that is the client environment.
- State whether Projects may be shared, and with whom.
- State that class/sample files are safe, but real PII/regulatory data requires explicit approval.
- State that connectors/apps require admin approval and least-privilege access.
- Name a policy owner and review date.

## Deliverable

- Flawed prompt, fixed prompt, and identity-swap result.
- Leaky workflow, redesigned workflow, and leak -> control mapping.
- Project/file governance audit.
- Connector-readiness checklist.
- Completed one-page AI-use policy.

## Review

The strongest answers name a specific control for a specific risk. "Use guardrails" is too
vague. "Fence customer email as untrusted data and keep drafts in a restricted review queue"
is usable.

## Troubleshooting

- **The hiring output still ranks candidates.** Add "do not rank or recommend."
- **Scores change after the identity swap.** Remove or explicitly forbid whatever proxy moved.
- **Students want to paste real policy/customer files.** Stop and use sample files only.
- **Governance feels abstract.** Make them answer: where does the data go, who can see it,
  who approved it, and what happens when the AI is wrong?
- **Connector discussion turns into button-clicking.** Bring it back to risk: read-only vs
  write-back, least privilege, review, logging.

## Completion Criteria

The lab is complete when the student has:

- A people-facing prompt rewritten around evidence and human decision ownership.
- An identity-swap test result.
- A leaky workflow redesigned for an approved enterprise workspace.
- A project/file audit.
- A connector-readiness recommendation.
- A completed AI-use policy draft.

---

## Teacher's Playbook

This lab should feel practical, not legalistic. The class has ChatGPT Enterprise, so governance
must address the actual surface students use: projects, files, sharing, project instructions,
review queues, and future connectors.

Recommended timing:

| Activity | Minutes |
|----------|---------|
| Biased prompt before/after | 20 |
| Identity-swap test | 10 |
| Leaky workflow redesign | 20 |
| Project/file governance audit | 15 |
| Connector readiness | 10 |
| Policy draft + debrief | 15 |

The one idea to land:

```text
Enterprise access reduces risk, but it does not erase your responsibility to classify data,
limit access, verify outputs, and keep humans in charge of consequential actions.
```

Tie back to frameworks:

- Govern: approved workspace, owner, policy.
- Map: data fields, sensitivity, who can see output.
- Measure: tests, identity swap, source verification.
- Manage: redaction, review queue, least privilege, safe logging.
