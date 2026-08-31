# Lab 02 - Build a Multi-Step Prompt Chain

## Goal

Build a **three-step prompt chain** that turns one messy support request into a
structured, reviewable result: **extract fields → classify & route → draft a reply**.
Each step returns structured output the *next* step consumes — the core move of "prompt
engineering for automation." By the end you have a reusable chain that another person (or
an automation platform) could run, and evidence that a sensitive request gets flagged for
a human.

## Time

50-60 minutes

## Tools

**ChatGPT Enterprise** in the class VM. No coding, no automation platform required: you run
the chain by hand in ChatGPT, one step at a time, which is exactly how a live automation would
run it — one step's output feeds the next.

> **Where's the automation platform?** You don't need one for this lab. A chain is just
> steps that hand structured output forward, and you can do that in a single chat window.
> In Module 4 you run the same shape inside ChatGPT Enterprise with a review queue and a
> connector-readiness assessment. Building the prompts before the plumbing is the right order.

## Sample assets

- `labs/assets/sample-support-requests.csv` — five incoming customer requests. This is your
  input; each row is one "request arriving." Open it and keep it on screen.
- `labs/assets/sample-help-center.md` — fictional help-center doc, used if you want the
  draft step grounded in reference material.
- `course-materials/prompt-chain-template.md` — the design grid you fill out in Part 1.
- `course-materials/prompt-template.md` — for saving the finished, parameterized chain.
- `course-materials/enterprise-project-setup.md` — optional setup for saving reusable prompts
  in a project-style workspace.

## Steps

1. Open `course-materials/prompt-chain-template.md` and map your three steps **before**
   writing any prompt: what each step does, its input, and its exact output format.
2. Write **Step 1 (Extract)** — pull named fields out of the raw request into JSON.
3. Write **Step 2 (Classify)** — read Step 1's JSON, add category, priority, and a review flag.
4. Write **Step 3 (Draft)** — read Steps 1-2, write a reply, and never send it.
5. Run one request through all three steps by hand, pasting each step's output into the next.
6. Run the remaining requests; confirm the **patient-records** row routes to human review.
7. Save the chain as a reusable, parameterized asset.
8. Add a short prompt-library note: what this prompt is for, what it is not for, and how to
   test it before reuse.

## Prompt Starter

Copy these three prompts. **Type multi-line prompts with Shift+Enter for new lines and
Enter to send, or just paste each one in whole.** Run them in order in the same chat, so
the assistant can see each previous answer.

**Step 1 — Extract (paste one request into the `"""` fence):**

```text
You are a careful support-intake analyst.
Extract fields from the request below. Return ONLY this JSON:
{
  "customer": string,
  "product":  string,   "not specified" if none is named,
  "issue":    string,   one plain sentence describing what they want,
  "dates":    string    "not specified" if no date is stated — do not guess one
}
Do not add any text before or after the JSON.

Request:
"""
[paste one row of sample-support-requests.csv here]
"""
```

**Step 2 — Classify (feed it the Step 1 JSON):**

```text
Read the extracted request JSON below and return ONLY this JSON:
{
  "category":              one of ["billing","technical","account","sales","other"],
  "priority":              one of ["urgent","normal","low"],
  "sensitive_data":        "yes" or "no",
  "confidence":            one of ["high","medium","low"],
  "human_review_required": "yes" or "no"
}
Rules:
- priority = "urgent" only for outage, data loss, security, or a blocked customer.
- sensitive_data = "yes" if it mentions patient records, financial data, passwords,
  or other regulated/confidential data. If sensitive_data = "yes", set
  human_review_required = "yes".
- If the request contains more than one distinct ask, set confidence = "low" and
  human_review_required = "yes".
Do not add any text before or after the JSON.

Extracted request:
[paste the Step 1 JSON here]
```

**Step 3 — Draft (feed it both JSON objects):**

```text
Using the two JSON objects below, write a first reply for a support agent to review.
- Warm, plain-language, under 90 words. Sign "— Northwind Support."
- Acknowledge the customer's specific issue. Promise nothing not stated in the input.
- Do NOT send anything — this is a draft for human review.
After the draft, on its own line, output:
route: "Review queue" if human_review_required = "yes", otherwise "Ready to send".

Extracted request:
[paste Step 1 JSON]
Classification:
[paste Step 2 JSON]
```

## Deliverable

- A completed prompt-chain design (three steps, each with its exact output format) in
  `course-materials/prompt-chain-template.md`.
- The three prompts you used.
- The structured output for **at least two** sample requests, all three steps each.
- Evidence that request #2 (Northstar Health, patient records) came back
  `human_review_required: "yes"` and routed to the review queue.
- The chain saved as a reusable asset (parameterized with `{{slots}}`).

## Review

The chain **drafts**; it never sends. Confirm that no step performs an external action, that
every "missing" field reads `"not specified"` (not an invented value), and that the sensitive
and ambiguous rows route to a human. A chain that auto-replies to row #2 is a failed lab.


## Detailed Exercise

### Part 1 - Design The Chain First

Open `course-materials/prompt-chain-template.md` and fill the grid **before** writing prompts:

| # | Step | Input | Output format (be exact) |
|---|------|-------|--------------------------|
| 1 | Extract fields | one raw request | JSON: {customer, product, issue, dates} |
| 2 | Classify & flag | Step-1 JSON | JSON: {category, priority, sensitive_data, confidence, human_review_required} |
| 3 | Draft reply | Steps 1-2 JSON | a reply under 90 words + a `route:` line |

Also write your **hand-off rules**: each step returns only structured output; missing data
becomes `"not specified"`, never a guess; a human reviews before anything is sent.

> The interfaces between steps matter more than the prompts. If Step 2 can't reliably read
> Step 1's output, the chain is broken — design the *shape of the hand-off* first.

### Part 2 - Build And Run Step 1 (Extract)

Open a fresh chat. Paste the **Step 1** prompt, dropping **row 1 (Acme Logistics)** into the
`"""` fence. Run it. You should get four fields back as JSON, with `product` and `dates` as
`"not specified"` — that's the fallback firing, not a failure.

Capture the JSON right in the chat (no separate app needed).

### Part 3 - Build And Run Step 2 (Classify)

In the same chat, paste the **Step 2** prompt and paste Step 1's JSON where indicated. Run it.
You now have category, priority, and — the important part — a `human_review_required` flag the
next step and a workflow can branch on. Confirm the values come from the **closed lists** in
the prompt, not free text.

### Part 4 - Build And Run Step 3 (Draft + Route)

Paste the **Step 3** prompt with both JSON objects. You get a short, on-brand draft **and** a
`route:` line. Read the draft: does it promise anything the input didn't say? If so, tighten
"promise nothing not stated in the input" and re-run.

**Optional grounding:** to make the draft answer from real reference material, add the
help-center doc — *"Use ONLY the help center below; if the answer isn't there, say so and
route to a person,"* then paste `labs/assets/sample-help-center.md`.

### Part 5 - Run The Whole Set And Find The Trap

Run the chain on all five rows (rows 2 and 3 are the ones that matter). Keep a running table
in the chat — ask the assistant: *"Append a row to a Markdown table with columns: customer,
category, priority, human_review_required, route."*

| Row | Should route to | Because |
|-----|-----------------|---------|
| 1 Acme | Ready to send | clean, low-risk |
| 2 Northstar | **Review queue** | **patient records = sensitive** |
| 3 River City | **Review queue** | **two distinct asks → low confidence** |
| 4 Metro | Ready to send | messy data, but not sensitive |
| 5 Summit | Ready to send | clean happy path |

If your row 2 comes back `human_review_required: "no"`, your Step 2 prompt is broken — fix the
sensitive-data rule and re-run.

### Part 6 - Make It Reusable

Save the chain in `course-materials/prompt-template.md`, replacing the specifics with slots:
`{{incoming_request}}`, `{{brand}}`, `{{word_limit}}`. In class you fill those slots manually;
in a future connector workflow, those slots map from a trigger.

### Part 7 - Add It To A Prompt Library

In your ChatGPT Project or in the same chat, write a reusable prompt-library card:

```text
Prompt name:
Business task:
Inputs required:
Output format:
Do not use for:
Required human review:
Test cases:
```

The "do not use for" line matters. A support-reply drafting chain is not a legal, medical, or
compliance advisor.

## Troubleshooting

- **Step 2 can't read Step 1's output.** Step 1 returned prose, not JSON. Add "Return ONLY
  this JSON" and "Do not add any text before or after the JSON," then re-run.
- **Output shape drifts between runs.** Pin every field to a closed list (`one of [...]`) and
  keep fields in a fixed order.
- **The model invents a date or product.** Strengthen the fallback: "if no date is stated,
  write 'not specified' — do not guess." Re-run row 1.
- **Row 2 doesn't get flagged.** The sensitive-data rule is too weak or too narrow. Name the
  categories explicitly (patient records, financial data, passwords) and tie the flag to them.
- **The draft over-promises** (a refund, a date). Add "promise nothing not stated in the
  input" and, for facts, ground it in the help-center doc.
- **Everything comes back "urgent."** Define what urgent *means* in the prompt, or the field
  is useless for routing.

## Completion Criteria

The lab is complete when the student has:

- A three-step chain **designed on the template** before building.
- Three working prompts, each returning structured output the next step consumes.
- Structured output captured for at least two sample requests, all three steps.
- Row 2 flagged `human_review_required: "yes"` and routed to review — the proof the chain is safe.
- The chain saved as a reusable, parameterized asset.
- A prompt-library note with intended use, limits, and test cases.
- No confidential data used anywhere (sample data only).

---
