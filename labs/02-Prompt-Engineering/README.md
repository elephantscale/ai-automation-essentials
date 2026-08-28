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

## Instructor Flow

Open with the chain diagram: raw item → extract → classify → draft → human gate. Make the
hand-off visible — Step 1's JSON is literally pasted into Step 2. Keep the chain to three
steps; depth of understanding beats a longer pipeline.

Recommended timing:

| Activity | Minutes |
|----------|---------|
| Chain concept + live demo (rows 5 then 2) | 15 |
| Chain design on the template | 10 |
| Build & run Step 1 and Step 2 | 12 |
| Build & run Step 3 (draft + route) | 10 |
| Run the sensitive/ambiguous rows | 8 |
| Debrief | 5 |

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

## Teacher's Playbook

Read this the night before you teach. It gives you one fully worked chain on the exact sample
data students have, realistic output for every step and every row, a live-demo script, the
mistakes you *will* see, and the debrief. Nothing here needs an automation platform — the
whole lab runs in a chat assistant, and this playbook runs the same way.

### The one idea to land

A **prompt chain** is steps that hand **structured output** forward: Step 1's JSON is literally
Step 2's input. If students leave thinking a chain is "a longer prompt," the lab failed. If they
leave able to say *"Step 2 could branch because Step 1 gave it named fields with pinned values,"*
it succeeded. The chain is the bridge from chat-window prompting to AI-as-a-workflow-step.

### The reference chain (worked end to end)

Built entirely on `labs/assets/sample-support-requests.csv`. Five rows, chosen to exercise every
case at once — keep the CSV on screen throughout.

```text
id  customer          request (abbreviated)                          this row exercises...
1   Acme Logistics    "set up an AI assistant to summarize reports"  happy path (technical)
2   Northstar Health  "upload patient records into a public AI tool" SENSITIVE DATA → review
3   River City Events "draft a sponsor email AND make an image"      AMBIGUOUS (two asks)
4   Metro Finance     "missing dates and duplicate categories"       MISSING / MESSY DATA
5   Summit Retail     "classify store issues and route urgent items" happy path (sales)
```

**The chain we build:**

```text
RAW REQUEST  (one CSV row = one "request arriving" = the trigger)
   │
   ▼
STEP 1  EXTRACT  → JSON {customer, product, issue, dates}
   │             (missing values = "not specified", never a guess)
   ▼
STEP 2  CLASSIFY → JSON {category, priority, sensitive_data, confidence, human_review_required}
   │             (values pinned to closed lists so the next step can branch)
   ▼
STEP 3  DRAFT    → a reply under 90 words  +  route: "Review queue" | "Ready to send"
   │             (drafts only — nothing is ever sent)
   ▼
HUMAN   A person reads the Review queue, edits, and sends by hand.
```

Say it loudly: **no step in this chain sends anything.** The most consequential action is
"write a draft." That is what "safe for class" — and safe for production — looks like.

### The worked output — all five rows (answer key)

Run each row through the three steps. Students' output should match the **shape** and the
**flags**, even if wording differs. The flags are what matter.

```text
ROW 1 — Acme Logistics   (happy path)
 Step 1: {"customer":"Acme Logistics","product":"not specified",
          "issue":"wants help setting up an AI assistant to summarize weekly ops reports",
          "dates":"not specified"}
 Step 2: {"category":"technical","priority":"normal","sensitive_data":"no",
          "confidence":"high","human_review_required":"no"}
 Step 3: "Happy to help! Summarizing your weekly operations reports is a great first use
          case. I'll send a short setup guide and can walk your team through it whenever
          you're ready. — Northwind Support"
          route: Ready to send

ROW 2 — Northstar Health   ← the one that MUST escalate
 Step 1: {"customer":"Northstar Health","product":"not specified",
          "issue":"asking whether patient records can be uploaded to a public AI tool",
          "dates":"not specified"}
 Step 2: {"category":"account","priority":"normal","sensitive_data":"yes",
          "confidence":"medium","human_review_required":"yes"}   ← patient records caught
 Step 3: "Thanks for checking before uploading anything. Patient records are sensitive, so
          they shouldn't go into a public AI tool — let me connect you with our security
          team to confirm an approved, compliant option. — Northwind Support"
          route: Review queue

ROW 3 — River City Events   ← ambiguous, two asks
 Step 1: {"customer":"River City Events","product":"not specified",
          "issue":"wants a sponsor follow-up email drafted AND an event announcement image",
          "dates":"not specified"}
 Step 2: {"category":"other","priority":"normal","sensitive_data":"no",
          "confidence":"low","human_review_required":"yes"}   ← two distinct asks → low
 Step 3: "Great — we can help with both the sponsor email and the announcement image. To get
          these right, could you confirm the sponsor name and the event date? — Northwind Support"
          route: Review queue

ROW 4 — Metro Finance   ← messy / missing data, but not sensitive
 Step 1: {"customer":"Metro Finance","product":"not specified",
          "issue":"spreadsheet has missing dates and duplicate vendor categories; wants a clean summary",
          "dates":"not specified"}
 Step 2: {"category":"technical","priority":"normal","sensitive_data":"no",
          "confidence":"medium","human_review_required":"no"}
 Step 3: "We can help clean that up. If you can share the file with any sensitive columns
          removed, we'll flag the missing dates and merge the duplicate vendor categories for
          you. — Northwind Support"
          route: Ready to send

ROW 5 — Summit Retail   ← clean happy path
 Step 1: {"customer":"Summit Retail","product":"not specified",
          "issue":"wants a workflow that classifies store issues and routes urgent ones for approval",
          "dates":"not specified"}
 Step 2: {"category":"sales","priority":"normal","sensitive_data":"no",
          "confidence":"high","human_review_required":"no"}
 Step 3: "This is right in our wheelhouse — classifying and routing store issues is a common
          first automation. I'll connect you with a specialist to scope it with you.
          — Northwind Support"
          route: Ready to send
```

The teaching moment: **rows 2 and 3 route to the review queue; rows 1, 4, and 5 are ready-to-send
drafts.** If a student's row 2 comes back `human_review_required: "no"`, their chain is broken —
that's the single most important thing this lab proves.

### One-prompt orchestration (optional, for a fast class)

If a class is moving quickly, show that the whole chain can run from **one setup prompt** — the
same shape an automation platform's AI step uses. Paste once at the start of a new chat:

```text
You run a 3-step support-triage chain. For each request I paste:
STEP 1 Extract JSON: {customer, product, issue, dates}  (missing = "not specified")
STEP 2 Classify JSON: {category, priority, sensitive_data, confidence, human_review_required}
       - sensitive_data "yes" for patient records / financial data / passwords → review "yes"
       - more than one distinct ask → confidence "low" and review "yes"
STEP 3 Draft a reply under 90 words signed "— Northwind Support" (never send), then a line:
       route = "Review queue" if review = "yes" else "Ready to send".
Show all three steps, then wait for the next request.
```

Then paste rows one at a time. This is a nice preview of the Module 4 "AI step" — but have
students build the **three separate prompts** first, so they feel the hand-off between steps.

### Live demo script

Aim for 12-15 minutes. Build in front of the class; narrate every paste.

1. **Show the problem (1 min).** Open the CSV. "Five requests. One is about patient records,
   one is two requests jammed together. If a bot auto-replied to all five, which two get us in
   trouble?" Let them answer — that's the whole lab.
2. **Run Step 1 on row 5 (2 min).** Paste the Extract prompt with the Summit row. Point at the
   JSON: "Four named fields. `product` and `dates` came back 'not specified' — it didn't invent
   them. That's the fallback."
3. **Run Step 2 on that JSON (2 min).** Paste Step 2, feed it Step 1's output. "I'm handing one
   step's output straight into the next — that's the chain. Look: `human_review_required: no`,
   and every value is from a fixed list, so a later step could branch on it."
4. **Run Step 3 (2 min).** Get the draft + `route: Ready to send`. "It drafted; it did not send.
   The route line is the workflow's instruction to a human."
5. **Now run row 2 through all three (3 min) and STOP on Step 2.** `sensitive_data: yes` →
   `human_review_required: yes` → `route: Review queue`. "The chain caught the patient records and
   sent it to a person. Same three prompts, different — correct — routing."
6. **Run row 3 (2 min).** Show `confidence: low` because there are two asks. "Ambiguity is a
   reason to involve a human, same as sensitivity."
7. **Point at the gate (1 min).** "Nothing was sent anywhere. The chain produces drafts and a
   routing decision. Build everything else; keep that gate."

**If you prefer paper:** project a spreadsheet with three tabs (Extracted, Classified, Drafts).
Paste each step's output into the right tab by hand. Students see the identical hand-offs; the
spreadsheet *is* the chain. Perfectly legitimate.

### Common student mistakes and how to redirect

- **Prose instead of JSON in Step 1.** Symptom: Step 2 can't read it. Redirect: add "Return ONLY
  this JSON" and "no text before or after." Re-run and show Step 2 now parsing cleanly. This is
  the #1 chain-breaker — make the fix visible.
- **One giant prompt instead of a chain.** They try to extract, classify, and draft in a single
  ask. Redirect: "Split it. When one step is wrong you want to see *which* step broke — and a
  real automation routes on the middle step's output, so it has to stand alone."
- **Guessed values instead of "not specified."** A made-up date or product appears. Redirect:
  strengthen the fallback and re-run row 1. "A guessed date ships as a silent error; 'not
  specified' is something a human can catch."
- **Row 2 not flagged.** The sensitive-data rule is missing or too narrow. Redirect: name the
  categories explicitly and tie the review flag to them. Re-run and show it escalate.
- **Only testing the happy path.** They run row 1, it works, they stop. Redirect: "Run row 2,
  then row 3. A chain is judged by the messy inputs, not the clean one."
- **Draft over-promises.** The reply invents a refund or a date. Redirect: add "promise nothing
  not stated in the input," and for facts, ground Step 3 in `sample-help-center.md`.

### Debrief questions with model answers

1. **Why three prompts instead of one that does everything?**
   Each step does one job, so each is easy to write, test, and trust; the hand-off is a clean
   structured interface; and when output is wrong you can see *which* step failed. In a real
   automation the middle step's output is what the workflow branches on, so it has to stand
   alone as structured data.

2. **What makes Step 1's output usable by Step 2 — and what would break it?**
   Named fields in a fixed shape (JSON), with missing values as "not specified." A paragraph, or
   fields that appear one run and vanish the next, breaks Step 2. The *format of the hand-off* is
   the contract.

3. **Row 2 and row 5 both read like ordinary requests. Why does one need a human and the other
   doesn't?**
   Row 2 touches *sensitive data* (patient records) — an irreversible-if-wrong domain. The test
   isn't "is the AI confident," it's "is the action reversible and low-stakes." Some categories
   always route to a person regardless of confidence.

4. **Where exactly is the human in the loop, and what breaks if you remove it?**
   Between the drafted reply and any send. Remove it and the AI's occasional wrong or
   over-promising draft — or a reply to a sensitive request — goes straight to a customer with no
   chance to catch it.

5. **You parameterized the chain with `{{slots}}`. What are those slots, once this becomes a real
   automation?**
   They're the fields a trigger or human operator supplies — `{{incoming_request}}` is the new
   email, ticket, row, or pasted item. Parameterizing the prompt is what makes it a workflow
   step instead of a one-off.

### What good looks like

A strong deliverable is *not* a long pipeline. It is a small, safe, tested three-step chain.
Concretely:

- **The chain designed on the template first** — three steps, each with an exact output format,
  and the hand-off rules written down *before* any prompt.
- **Step 1 and Step 2 return real structured output** — named fields, values pinned to closed
  lists, missing data as "not specified" — not "summarize and classify this."
- **A genuine human gate** — Step 3 drafts only and emits a `route:` line; nothing is sent.
- **The messy rows tested and shown**, and critically **row 2 flagged for review and row 3 marked
  low confidence.** That evidence is the proof the chain is safe, not just functional.
- **The chain saved as a reusable, parameterized asset** anyone could re-run next week.

> The best deliverable in the room is usually the *narrowest* chain that survives rows 2 and 3.
> Praise the student who extracted and classified cleanly and escalated the hard cases over the
> student who built five steps but can't say what happens on the patient-records row.
