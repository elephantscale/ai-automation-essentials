# Lab 01 - Rules Automation vs AI Interpretation

## Goal

Run the same routing task two ways:

1. A **rules engine** that applies exact keyword rules.
2. An **AI routing assistant** that interprets what the request means.

This is an automation lab, not a security lab. You are proving a practical workflow idea:

```text
Rules automate stable, explicit conditions.
AI handles messy language and implied intent.
Good workflows use the right tool for each part.
```

## Time

35-45 minutes

## Tools

- ChatGPT Enterprise in the class VM
- `labs/assets/lab01-routing-requests.csv`

No automation platform is required.

## Sample Asset

Use:

```text
labs/assets/lab01-routing-requests.csv
```

This file has six fictional support requests. Some contain obvious routing keywords. Others
mean something clear to a person, but do not use the exact words the rules engine expects.

## Steps

1. Open `lab01-routing-requests.csv`.
2. Ask ChatGPT to run the **rules-engine pass** using the exact keyword rules.
3. Ask ChatGPT to run the **AI interpretation pass** using meaning, not just keywords.
4. Compare the two tables.
5. Write one sentence: which parts of this workflow should be rules, and which should be AI?

## Part 1 - Rules-Engine Pass

Start a fresh ChatGPT chat. Copy this whole block into one message:

```text
You are simulating a simple rules-based routing engine.

Apply these rules exactly as written. Do not infer intent. Do not use common sense.
Only route based on the literal keywords listed below.

Inspect only the request column.
keyword hit = the exact rule keyword found in the request column.
If no exact rule keyword appears, keyword hit = none.

Rules:
- If the request contains "invoice", "payment", or "refund" -> Finance
- If the request contains "login", "password", or "account" -> Account Support
- If the request contains "demo", "pricing", or "quote" -> Sales
- If the request contains "bug", "error", or "crash" -> Technical Support
- Otherwise -> General

Return a Markdown table:
id | customer | keyword hit | rules route

CSV data:
id,customer,request,channel,submitted_at
1,Brightline Books,"My invoice shows a duplicate payment for this month.",email,2026-07-15
2,Oak Valley Clinic,"I can't get into my workspace after the reset.",web,2026-07-16
3,Northstar Manufacturing,"Can someone walk us through options for 50 users?",web,2026-07-17
4,Harbor Analytics,"The app shows the word crash when I export the report.",email,2026-07-18
5,Summit Retail,"Please send a quote for the enterprise plan.",web,2026-07-19
6,Acme Logistics,"We need help setting up an AI assistant to summarize weekly operations reports.",web,2026-07-20
```

If your result has only five rows, or includes Northstar Health / River City Events / Metro
Finance, you used the wrong dataset. Restart with the six rows above.

Expected pattern:

| id | Expected Rules Route | Why |
|----|----------------------|-----|
| 1 | Finance | Has `invoice` and `payment` |
| 2 | General | Means access problem, but no `login/password/account` keyword |
| 3 | General | Means sales interest, but no `demo/pricing/quote` keyword |
| 4 | Technical Support | Has `crash` |
| 5 | Sales | Has `quote` |
| 6 | General | Means implementation/setup, but no matching keyword |

## Part 2 - AI Interpretation Pass

In the same chat, paste:

```text
Now route the same requests as an AI routing assistant.

Read the meaning of each request, not just the keywords.

For each request, return:
id | customer | AI route | one-sentence reason | confidence

Allowed routes:
- Finance
- Account Support
- Sales
- Technical Support
- Implementation / Automation Help
- General

Use confidence high, medium, or low.
If the request could reasonably belong in more than one route, say so in the reason.
```

Expected pattern:

| id | Expected AI Route | Why |
|----|-------------------|-----|
| 1 | Finance | Explicit billing/payment issue |
| 2 | Account Support | Access/workspace problem, even without the keyword |
| 3 | Sales | Asking about options for 50 users |
| 4 | Technical Support | Crash/export problem |
| 5 | Sales | Quote request |
| 6 | Implementation / Automation Help | Wants help setting up an AI assistant |

## Part 3 - Compare

Ask ChatGPT:

```text
Compare the rules-engine table and the AI routing table.

Return:
id | rules route | AI route | what this row teaches

Focus on automation design:
- Where were keyword rules sufficient?
- Where did keyword rules miss implied intent?
- Where did AI add value?
- What would you automate with rules vs AI in a real workflow?
```

The main takeaway should be:

```text
Rules worked when the request used the expected operational keywords.
Rules missed paraphrases and implied intent.
AI handled messy language better.
A real workflow might use rules for obvious cases and AI for requests that fall through to
General or need interpretation.
```

## Deliverable

- Rules-engine routing table.
- AI interpretation routing table.
- Comparison table.
- One sentence describing a hybrid workflow.

Example hybrid sentence:

```text
Route obvious invoice/payment/quote/crash requests with rules, send General or uncertain
requests to AI for interpretation, and have a human review low-confidence cases.
```

## Review

Do not make this about whether rules are better than AI. They are not competing as general
intelligence. The design question is:

```text
Which parts of the work are stable enough for rules, and which parts need AI interpretation?
```


## Troubleshooting

- **Students ask why ChatGPT is running the rules pass.** Because we are simulating a rules
  engine inside the only tool available in the VM. The logic is still rules-based: exact
  keywords only, no interpretation.
- **ChatGPT interprets during the rules pass.** Re-run and emphasize: "Do not infer intent.
  Only route based on literal keywords."
- **The rules pass feels too easy.** Good. The point is not difficulty. The point is seeing
  the failure mode clearly before building workflows later.
- **Students ask where security fits.** Say: "Security guardrails come later. This first lab is
  about automation fit: rules for stable signals, AI for messy interpretation."
- **The AI route differs slightly.** Fine if the reason is defensible. The important rows are
  2, 3, and 6, where AI should improve on `General`.

## Completion Criteria

The lab is complete when the student has:

- A rules-engine table using literal keyword matches.
- An AI routing table using meaning.
- A comparison table that identifies where rules were sufficient and where AI added value.
- A one-sentence hybrid workflow design.
