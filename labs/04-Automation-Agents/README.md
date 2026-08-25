# Lab 04 - No-Code Automation & AI Agents

## Goal

Build a no-code automation that uses AI to process an incoming item (a support request) **end
to end** — read it, classify it, draft a reply, route it — with a **human approval checkpoint**
before anything leaves the building. You will either build it on an automation platform or run
the whole workflow **by hand in your AI assistant** using an orchestrator prompt. Same logic
either way.

## Time

90 minutes

## Tools

Tool-flexible — use whatever your class provides:

- **An automation platform** — Zapier, Make, Power Automate, Copilot Studio, or **n8n**. Build the
  live trigger → AI step → routing → approval.
- **An AI assistant** — Claude, ChatGPT, or Gemini. Run the identical workflow by hand with the
  orchestrator prompt in Part 3b. No platform account required.

> **Which path do I take?** If you were given a platform account, build it there (Parts 1-5).
> If not, run it by hand in your assistant (Part 3b) — you still practice trigger → AI step →
> structured output → routing → human approval, and you produce the same deliverable. The
> instructor demos a live platform build so everyone sees a real trigger fire. Nothing in this
> lab depends on you personally having a paid automation seat.

## Sample assets

- `labs/assets/sample-support-requests.csv` — five support requests, chosen to exercise all four
  test cases (happy, sensitive, ambiguous, messy). Open it and keep it beside you.
- `course-materials/automation-design-canvas.md` — the one-page design template you fill out first.

## Steps

1. Fill out `course-materials/automation-design-canvas.md`.
2. Choose a trigger — a form submission, an email, a spreadsheet row, or (by-hand) a pasted request.
3. Add an AI step that classifies, summarizes, extracts, and drafts — returning fixed fields.
4. Route the result to a destination (a sheet, a queue, or a running table in the chat).
5. Add a human approval checkpoint before any external action.
6. Test the happy-path, missing-data, sensitive-data, and ambiguous-input cases.

> **Where's the trigger when you run this by hand?** There isn't an automatic one — your
> assistant can't watch an inbox or a sheet, so **you are the trigger.** You simulate each "new
> request arriving" by **pasting one row of `sample-support-requests.csv`** into the chat (that's
> what the `{{trigger.request}}` placeholder stands for). A real automatic trigger — *new email /
> new row fires the workflow on its own* — only exists on an automation platform; that's the
> instructor demo. Your assistant just runs the **AI step** on whatever text you hand it.

## Prompt Starter

Type it with Shift+Enter for new lines and Enter to send, or just paste the whole block at once.

```text
Classify the incoming item for workflow routing.

Return ONLY a JSON object with these keys:
- category
- priority
- summary
- draft_reply
- confidence: high, medium, or low
- human_review_required: yes or no

If the item includes sensitive data or is ambiguous, set human_review_required to yes.
```

(The full, production-grade version of this prompt is in Part 3 below — use that one for the exercise.)

## Deliverable

- Completed automation design canvas
- Workflow screenshots / configuration notes — or the by-hand chat transcript
- The AI-step prompt you used
- Four test-case results (one per case)
- A one-line human-approval-and-logging plan

## Review

Keep permissions limited. Do not let the workflow send, publish, delete, purchase, or change
records without human review unless explicitly approved. In this lab the most consequential
action is "write a draft to a sheet" — keep it that way.

## Instructor Flow

Open with a diagram: trigger → AI step → human review → action → log. Keep the build narrow.
The goal is a reliable workflow *pattern*, not a complex enterprise integration.

Recommended timing:

| Activity | Minutes |
|----------|---------|
| Workflow pattern demo | 15 |
| Canvas completion | 15 |
| Tool setup or by-hand simulation | 15 |
| AI step configuration | 20 |
| Approval / logging step | 15 |
| Test cases and debrief | 10 |

## Detailed Exercise

### Part 1 - Pick A Workflow

Good class workflows:

- New form submission becomes a summarized intake
- New email becomes a draft response
- New row becomes a categorized request
- New support ticket gets a priority and routing
- New document gets a summary and a review task

Use sample data only. For this lab we all use **support-request triage** so the answer key lines up.

### Part 2 - Complete The Canvas

Open `course-materials/automation-design-canvas.md` and fill out:

- Business goal
- Trigger
- Inputs
- AI step
- Output fields
- Approval rule
- Destination
- Log location
- Test cases (the four in the table at the bottom of the canvas)

Do this **before** you touch any tool. Thirty minutes on paper saves an hour of flailing in the builder.

### Part 3 - Configure The AI Step

This is the heart of the automation. **Prompt — copy this into the AI action** (or, for the
by-hand path, paste it into your assistant and replace `{{trigger.request}}` with one row of
`sample-support-requests.csv`). Paste it whole, or type it with Shift+Enter for the line breaks:

```text
You are a support-triage assistant for a B2B software company.
Read the incoming request and return a decision the workflow can act on.

Return ONLY a JSON object with exactly these keys:
{
  "category": one of ["billing", "technical", "account", "sales", "other"],
  "priority": one of ["urgent", "normal", "low"],
  "summary": one sentence, max 20 words,
  "draft_reply": a polite 2-3 sentence first reply,
  "confidence": one of ["high", "medium", "low"],
  "human_review_required": "yes" or "no"
}

Rules:
- priority = "urgent" only for outage, data loss, security, or a blocked customer.
- If the request mentions patient records, financial data, passwords, or other
  sensitive data, set human_review_required to "yes".
- If the request contains more than one distinct ask, or is otherwise unclear,
  set confidence to "low" and human_review_required to "yes".
- Do not invent names, numbers, or facts not present in the request.

Request:
"""
{{trigger.request}}
"""
```

Returning **ONLY** a JSON object is what lets the next step branch reliably. In a live tool, map
each field to the next step from a dropdown; by hand, keep the returned JSON in a running table.

### Part 3b - Run the Whole Workflow by Hand (assistant only)

To run the *entire* automation inside your assistant — trigger, AI step, routing, and a log —
encode the "what happens next" as rules in one **orchestrator prompt**. **Paste this once at the
start of a new chat:**

```text
You are running a support-triage workflow. I'll paste one support request at a time.
For EACH request I paste:
1. Classify it — return JSON: category, priority, summary, draft_reply, confidence,
   human_review_required (use the triage rules: urgent only for outage/data-loss/
   security/blocked customer; sensitive data or more than one ask → human_review_required
   = "yes" and confidence = "low"; never invent facts).
2. Apply these routing rules:
   - if priority = "urgent"                → route = "Notify on-call (#support-urgent)"
   - else if human_review_required = "yes" → route = "Review queue"
   - else                                  → route = "Log only (draft ready)"
3. Append a row to a running Markdown table with columns:
   customer | category | priority | route | summary
Show the JSON, the routing decision, and the updated table after each request.
Drafts only — never "send." Then wait for the next request.
```

Now **paste one row of `sample-support-requests.csv`** (that's your trigger). Your assistant
replies with the JSON, the routing decision, and the updated table — then paste the next row.
**Reading the chat is how you watch it run:** each reply is one item flowing through the workflow,
and the growing table is the live log (your "destination"). Paste the Northstar / patient-records
row and watch it land in **Review queue** — the human gate firing, visibly. Capture your results
right in the chat; no separate app needed.

### Part 4 - Add Human Review

Add a review point before any external action:

- An approval email or Slack/Teams approval message
- A draft-only message (best for class)
- A manual review queue
- A spreadsheet status column ("NEEDS REVIEW" / "APPROVED")

For class, **draft is better than send.** Sending stays manual for the whole lab.

### Part 5 - Test Four Cases

Run all four against the sample CSV and record what each returned:

| Case | Sample row | Purpose |
|------|-----------|---------|
| Happy path | Row 1 or 5 | Normal input, sails through |
| Missing data | Row 4 | Required field messy/absent |
| Sensitive data | Row 2 | Should trigger review |
| Ambiguous request | Row 3 | Should lower confidence |

The proof your workflow is safe: **row 2 must flag for review, and row 3 must come back low
confidence.** If they don't, tighten the prompt and re-run.

## Expected Result

You should understand how to insert AI into a workflow safely. A successful lab does **not** need
a polished production automation; it needs a clear trigger, an AI step, a review gate, and test
evidence — with rows 2 and 3 correctly escalated.

## Troubleshooting

- If the automation-tool account isn't ready, run the by-hand path in your assistant (Part 3b) —
  or simulate with a spreadsheet and manual copy/paste.
- If AI output changes shape between runs, make the format stricter: "Return ONLY the JSON with
  exactly these keys," and pin every value to a closed list.
- If a live trigger fires repeatedly during testing, disable it after the test.
- If students connect production apps, stop and switch to sandbox / sample data.
- If approval is hard to configure, fall back to a draft message or a spreadsheet review column.
- If everything comes back "urgent," tighten the priority rule in the prompt (define what urgent
  *means*), or the field is useless for routing.

## Completion Criteria

The lab is complete when you have:

- A completed design canvas
- A workflow build or a clear by-hand simulation
- The AI prompt / configuration you used
- A human review checkpoint before any external action
- Four test-case results (rows 2 and 3 correctly escalated)
- A logging or audit plan

---

## Teacher's Playbook

This is the section to read the night before you teach. It gives you one fully worked automation,
built on the exact sample data students have, plus a live-demo script, the mistakes you *will*
see, and how to run the debrief. If platform accounts aren't ready, the same worked example runs
by hand in the assistant or as a spreadsheet dry-run — nothing here depends on a live Zapier/Make
seat.

### The reference automation (worked end to end)

Everything below is built on `labs/assets/sample-support-requests.csv`. That file has five rows
chosen to exercise all four test cases at once — keep it open on screen throughout.

```text
id  customer          request (abbreviated)                          this row exercises...
1   Acme Logistics    "set up an AI assistant to summarize reports"  happy path (technical)
2   Northstar Health  "upload patient records into a public AI tool" SENSITIVE DATA → review
3   River City Events "draft a sponsor email AND make an image"      AMBIGUOUS (two asks)
4   Metro Finance     "missing dates and duplicate categories"       MISSING/MESSY DATA
5   Summit Retail     "classify store issues and route urgent items" happy path (sales)
```

**The workflow we build:**

```text
TRIGGER   New row added to the "Incoming Requests" sheet
          (mirrors sample-support-requests.csv)
   │
   ▼
STEP 1    AI step — classify + summarize + draft (prompt in Part 3)
   │
   ▼
STEP 2    Add a row to the "Triage Log" sheet
          (id, customer, category, priority, confidence, review_flag, timestamp)
   │
   ▼
STEP 3    CONDITION — human_review_required = "yes"  OR  confidence = "low"?
          ├── YES → write draft to "Review Queue" sheet, status = "NEEDS REVIEW"
          │         (nothing is sent)
          └── NO  → write draft to "Ready to Send" sheet, status = "DRAFT — approve to send"
   │
   ▼
HUMAN     A person reads the queue, edits if needed, flips status to "APPROVED".
          Sending stays manual for the whole lab.
```

Point out loudly: **no step in this workflow sends anything to a customer.** The most consequential
action is "write a draft to a spreadsheet." That is deliberate, and it is what "safe for class"
looks like. The same shape works identically in Zapier, Make, Power Automate, or n8n — the boxes
just look different.

### The exact AI-step prompt (paste this into the AI action)

The paste-ready AI-step prompt is in **Part 3** above. In a live platform demo, map
`{{trigger.request}}` to the trigger's field from the dropdown; running by hand, replace it with
one CSV row.

### The orchestrator prompt (the by-hand path, one prompt runs the whole workflow)

The paste-once orchestrator prompt is in **Part 3b** above. It encodes the trigger, the AI step,
the routing rules, and the running-table log as instructions, so pasting one CSV row at a time
runs the *entire* automation inside a single chat. Use this when students have an assistant but no
platform seat — it teaches the identical logic and produces the same deliverable.

### The structured output it returns (all five rows)

Run each sample row through the prompt. This is the answer key — students' output should match the
*shape* and the *flags*, even if the wording differs.

```text
Row 1 — Acme Logistics
{
  "category": "technical",
  "priority": "normal",
  "summary": "Customer wants help setting up an AI assistant to summarize weekly ops reports.",
  "draft_reply": "Happy to help! Summarizing weekly operations reports is a great first
                  use case. I'll share a quick setup guide and can walk your team through it.",
  "confidence": "high",
  "human_review_required": "no"
}

Row 2 — Northstar Health   ← the one that must escalate
{
  "category": "account",
  "priority": "normal",
  "summary": "Customer asks whether patient records can be uploaded to a public AI tool.",
  "draft_reply": "Thanks for checking first. Uploading patient records to a public tool
                  raises privacy concerns; let me connect you with our security team before
                  you proceed.",
  "confidence": "medium",
  "human_review_required": "yes"      ← sensitive data (patient records) caught the rule
}

Row 3 — River City Events   ← ambiguous, two asks
{
  "category": "other",
  "priority": "normal",
  "summary": "Customer wants both a sponsor follow-up email drafted and an event image created.",
  "draft_reply": "Great — we can help with both the sponsor email and the announcement
                  image. To get these right, could you confirm the sponsor and the event date?",
  "confidence": "low",              ← two distinct asks → low confidence
  "human_review_required": "yes"
}

Row 4 — Metro Finance   ← messy / missing data
{
  "category": "technical",
  "priority": "normal",
  "summary": "Customer needs a clean summary of a spreadsheet with missing dates and duplicate categories.",
  "draft_reply": "We can help clean that up. Could you share the file (with any sensitive
                  columns removed) so we can flag the missing dates and merge the duplicate
                  vendor categories?",
  "confidence": "medium",
  "human_review_required": "no"
}

Row 5 — Summit Retail   ← clean happy path
{
  "category": "sales",
  "priority": "normal",
  "summary": "Customer wants an AI workflow to classify store issues and route urgent ones.",
  "draft_reply": "This is right in our wheelhouse — classifying and routing store issues is
                  a common first automation. I'll connect you with a specialist to scope it.",
  "confidence": "high",
  "human_review_required": "no"
}
```

The teaching moment: **rows 2 and 3 route to the review queue; rows 1, 4, and 5 route to
ready-to-send drafts.** If a student's row 2 comes back `human_review_required: "no"`, their prompt
is broken — that's the single most important thing this lab proves.

### Live demo script

Aim for 12-15 minutes. Build in front of the class; narrate every click. (On the by-hand path,
"clicks" become "paste the orchestrator prompt, then paste a row" — same beats.)

1. **Show the problem (1 min).** Open the CSV. "Five requests. One is about patient records, one is
   two requests jammed together. If a bot auto-replied to all five, which two would get us in
   trouble?" Let them answer. That's the whole point of the lab.
2. **Create the trigger (2 min).** In your platform, new Zap/Scenario/Flow → trigger *New
   Spreadsheet Row* on your "Incoming Requests" sheet. Test it; show the row data pulled in. (By
   hand: paste the orchestrator prompt and explain "you are the trigger now.")
3. **Add the AI step (4 min).** Add the AI action (Zapier: *AI by Zapier* / *Extract*; Make / n8n:
   the OpenAI/Claude structured module; Power Automate: the AI Builder / GPT action). Paste the
   Part 3 prompt. Map `{{trigger.request}}` from the dropdown — say out loud "this is not code, I'm
   picking a field from a menu."
4. **Run row 5, then row 2 (3 min).** Row 5 returns clean JSON, review = no. Then run row 2 and
   *stop* on `human_review_required: "yes"`. "The AI caught the patient records. Now the workflow
   has to actually respect that flag."
5. **Add the condition + queues (3 min).** Add a Path/Router/Condition: review-flag yes → Review
   Queue sheet; else → Ready-to-Send sheet. Run both rows; show them landing in different sheets.
6. **Point at the gate (1 min).** "Notice: nothing was sent. A human opens Ready-to-Send, approves,
   and sends by hand. That's the safe pattern — build everything else, keep that gate."

**If accounts aren't available — narrated dry-run:** put the CSV in a projected spreadsheet. Add
three tabs: Triage Log, Review Queue, Ready to Send. Paste the prompt into an assistant
(Claude/ChatGPT/Gemini), feed it each row, and *by hand* copy the returned JSON into the right tab
based on the review flag. Students see the identical logic; the spreadsheet *is* the automation.
This is a perfectly legitimate way to run the whole lab.

### Common student mistakes and how to redirect

- **No test data — they build against a live inbox.** Redirect: stop, switch to the sample sheet.
  "You can't debug what you can't trigger on demand. Fire the CSV rows instead."
- **No human gate — the workflow ends in 'Send Email'.** Redirect: "Change Send to Create Draft.
  Where does a person say yes?" Make them name the approval step out loud.
- **Unstructured AI output breaks the next step.** Symptom: the condition never matches because the
  AI wrote a paragraph, not fields. Redirect: add *"Return ONLY the JSON with exactly these keys"*
  and pin the values to closed lists. Re-run and show the condition now firing.
- **Only testing the happy path.** They run row 5, it works, they declare victory. Redirect: "Run
  row 2. Now run row 3. A workflow is judged by the messy inputs, not the clean one."
- **Priority inflation — everything comes back 'urgent'.** Redirect: tighten the rule in the prompt
  (define what urgent *means*), or the field is useless for routing.
- **Over-reaching into an agent.** A student wants the AI to "just figure out and reply to
  everything." Redirect: "That's an agent, and it can send things you didn't approve. For this lab,
  fixed path plus a human gate. Add autonomy only when a fixed path truly can't cope."

### Debrief questions with model answers

1. **Why force JSON with exact keys instead of asking for a nice summary?**
   Because the *next step* is a machine reading fields, not a person reading prose. A condition like
   `IF priority = "urgent"` only works if `priority` is always literally there with a known value.
   Structured output is what makes the branch reliable.
2. **Row 2 (patient records) and row 5 (store issues) both look like normal requests. Why does one
   need a human and the other doesn't?**
   Row 2 touches *sensitive data* — an irreversible-if-wrong domain (privacy, compliance). The test
   isn't "is the AI confident," it's "is the action reversible and low-stakes." Some categories
   always route to a person regardless of confidence.
3. **Where exactly is the human in the loop in your workflow, and what would break if you removed
   it?**
   Between the drafted reply and any send. Remove it and the AI's occasional wrong draft — or a
   reply to a sensitive request — goes straight to a customer with no chance to catch it.
4. **What turns this automation into an agent, and would you want that here?**
   Give the AI tools and let it choose its own steps toward a goal ("handle this ticket") instead of
   following our fixed path. Not here — the path is always the same and we want it auditable. Agents
   earn their keep when the path genuinely varies.
5. **Your automation ran overnight and one row failed silently. What was missing?**
   An error path. Every workflow needs a catch branch that notifies a human and a dead-letter queue
   so nothing vanishes. Fail loud, never silent.

### What good looks like

A strong deliverable is *not* a fancy multi-branch integration. It is a small, safe, tested one.
Concretely:

- **Design canvas filled out first** — goal, trigger, AI fields, approval rule, and the four test
  cases named *before* any building.
- **A structured AI prompt** with named fields, pinned values, and the sensitive-data / ambiguity
  rules — not "summarize and classify this."
- **A real human gate** before anything consequential: draft-only, a review queue, or an approval
  message. Sending stays manual.
- **Four test results shown**, and critically, **row 2 flagged for review and row 3 marked low
  confidence.** That evidence is the proof the workflow is safe, not just functional.
- **A one-line logging plan** — where runs are recorded and how a failure reaches a person.

> The best deliverable in the room is usually the *narrowest* one that survives all four test
> cases. Praise the student who automated 70% cleanly and escalated the rest over the student who
> tried to automate everything and can't say what happens on row 2.
