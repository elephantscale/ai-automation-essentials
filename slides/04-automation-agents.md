# No-Code Automation & AI Agents

Elephant Scale

---

## Why This Module

* So far AI has lived *inside* the chat window — you paste in, read out, copy the result to wherever it goes.
  * That works right up until the work arrives faster than you can babysit it.
* This module: AI stops being a place you *visit* and becomes a **step that runs on its own**.
  * A support email lands → AI reads it, labels it *Billing / Urgent*, drafts a reply, drops it in the right queue with a summary — before anyone opens the inbox. No code; wired in a browser.
* This is the leap from *using* AI to *deploying* it — the step most "prompting" courses skip.
* By the end you will be able to:
  - Read the **no-code automation landscape** — which tool fits which job.
  - Wire a real **trigger → action** recipe, then drop an **AI step** in the middle.
  - Make AI return **structured output** the next step can act on.
  - Make a workflow **reliable** — test it, handle bad input, catch errors.
  - Say what turns an automation into an **agent**, and when you'd actually want one.
  - Keep a **human in the loop** so nothing consequential runs unsupervised.

> The safest first automation is narrow, visible, and human-reviewed. We build exactly that
> in the lab — everything in this module aims at making it *trustworthy*, not clever.

---

## Tool-Flexible, On Purpose

* This course is **not** locked to one vendor. Everything here works the same whether your class runs on:
  - **An assistant** — Claude, ChatGPT, or Gemini (we say "your AI assistant").
  - **An automation platform** — Zapier, Make, Power Automate, Copilot Studio, or n8n.
* The *pattern* is identical everywhere; only the buttons differ.
  - A trigger is a trigger; an AI step is an AI step; a human gate is a human gate.
* Two ways to run the lab, both taught here:
  - **On a platform** — build the live trigger → AI step → routing in whatever tool you're given.
  - **By hand in your assistant** — paste an "orchestrator prompt" and run the whole workflow inside the chat. No platform account required.

> Learn the shape, not the logo. Products rename and reprice every quarter; "when this,
> insert AI, then that, with a human gate" has outlived all of them.

---

## Part 1 — The No-Code Automation Landscape

> Five tools own this space in 2026. They overlap, but they are *not* interchangeable.
> Picking the wrong one is the #1 reason a first automation stalls.

---

## The Five Tools You'll Actually Meet

* You don't need all five — know which one you're in front of and what it's good at.
* **Zapier** — friendliest on-ramp.
  - Thousands of connections; linear "when this, then that" builder.
  - Describe it in a sentence → build it in an afternoon. Best for individuals and small teams gluing SaaS apps together.
* **Make** (formerly Integromat) — same idea, but **visual**.
  - The whole workflow is a map of connected bubbles — branches, loops, data on the wires.
  - More power, steeper curve. Best when the logic gets complicated.
* **Microsoft Power Automate** — automation baked into Microsoft 365.
  - Outlook, Teams, SharePoint, Excel — it already knows your data and permissions. Best inside a Microsoft shop.
* **Copilot Studio** — Microsoft's builder for **custom AI copilots and agents**, not just linear flows.
  - Where "automation" turns into "assistant that takes actions." Best when the client runs Microsoft AI and wants a branded, tool-using assistant.
* **n8n** — **open-source and self-hostable**, visual like Make, developer-friendly but still no-code.
  - Runs on your own servers, so data never leaves your walls; node-based canvas anyone can drag together. Best when privacy, cost control, or on-prem hosting matters.

> Pick by *where your data already lives* and *who's allowed to hold it*, not the logo you've
> heard of. A regulated shop that can't send data to a third party should look hard at n8n or
> Power Automate long before Zapier.

---

## How They Actually Differ

* All five speak the same grammar — trigger, steps, action. What bites in practice:
* **Shape of the builder.**
  - Zapier / Power Automate = *lists*, top to bottom. Make / n8n = a *canvas* seen all at once.
  - Five-step branch → canvas wins; two-step "email me on a form" → list is faster.
* **Where it lives.**
  - Power Automate / Copilot Studio live in Microsoft's tenant — they inherit company identity and security.
  - **n8n** you host yourself — nothing leaves your servers; you own the box and the upkeep.
  - Zapier / Make are third-party services you connect *to* your apps — great reach, but one more vendor holding your tokens.
* **Automation vs. agent.**
  - Zapier, Make, Power Automate, n8n build **automations** — predefined paths.
  - Copilot Studio (and newer "agent" features across all of them) build **agents** — assistants that decide their own next step. We draw that line sharply in Part 5.

> For this course any of the five will do. If a platform is provided, build in it; if not, run
> the whole thing by hand in your assistant (Part 5 shows how). The *pattern* is identical.

---

## Part 2 — Triggers and Actions

> Every automation, in every tool, is the same two-word sentence: *when this, do that.*
> Master those two words and the rest is vocabulary.

---

## The Trigger — What Starts It

* A **trigger** is the event that wakes the automation. Nothing runs until it fires — the whole workflow is downstream of this one choice.
* Common triggers:
  - **New email** (a mailbox, or one matching a filter/label)
  - **New form submission** (Typeform, Google Forms, a contact form)
  - **New spreadsheet row** (Google Sheets, Excel)
  - **New file** in a folder (Drive, SharePoint, Dropbox)
  - **New ticket or record** in a help desk / CRM
  - **A schedule** — every morning at 8:00
  - **A manual button** — press it when you want it

> Choose a trigger you can **fire on demand with sample data**. "New email to support@" is
> perfect — send yourself a test any time. "New customer churns" is a nightmare to test.

---

## The Action — What It Does

* An **action** is a step performed after the trigger. A workflow = trigger + one or more actions in order.
* Common actions:
  - **Send a message** — email, Slack, Teams
  - **Create a record** — a task, a ticket, a calendar event
  - **Add or update a row** in a spreadsheet
  - **Generate a document** from a template
  - **Call an AI step** — summarize, classify, draft, extract (our star, Part 3)
  - **Ask for approval** — pause and wait for a human

> In a classroom, prefer actions that **draft, log, or notify** over ones that **send,
> publish, or delete**. A draft-writer is safe to run a hundred times while you tune; a
> customer-emailer is not.

---

## A Worked Wiring — Support Email Triage

* Business problem: support emails pile up in a shared inbox; urgent ones get buried for hours.
* The whole automation as a trigger/action recipe:

```text
TRIGGER  New email in support@company.com
STEP 1   AI step — classify & summarize
         → category, priority, summary, draft_reply, confidence, human_review_required
STEP 2   Add a row to the "Support Log" sheet (customer, category, priority, summary…)
STEP 3   IF priority = "urgent"  → post to #support-urgent, tag the on-call rep
                          else    → leave it in the queue; the log row is enough
STEP 4   IF human_review_required = "yes"  → send draft_reply to a REVIEW queue,
                                             never anywhere it could auto-send
```

> No code anywhere — every box is a menu choice. The only thing we *write* is the AI step's
> prompt: the next part, and the part that earns its keep.

---

## Conditions — Where the Logic Lives

* The `IF` boxes are where an automation gets *smart* instead of mechanical.
  - Zapier "Paths," Make / n8n "Routers," Power Automate "Conditions" — all ask the same question: *given what we know, which way?*
  - Urgent → notify on-call. Low confidence → human. Billing → finance. Sensitive data → stop and flag.

> A condition is only as good as the data feeding it. `IF priority = "urgent"` works only if
> an earlier step reliably produced a field literally named `priority` = `urgent`. That
> reliability is why the next part matters.

---

## Part 3 — Inserting an AI Step

> This is the difference between 2019 automation and 2026 automation. The old kind only moved
> data that was already labeled. The new kind *reads* a raw email and decides what it is.

---

## What an AI Step Is For

* An **AI step** hands text to a model and gets an answer back.
  - Zapier, Make, Power Automate, and n8n all ship built-in AI actions; you can also plug in a connected assistant.
* Inside a workflow, AI does one of a handful of jobs:
  - **Summarize** — a long email or doc → two sentences.
  - **Classify** — category, priority, sentiment.
  - **Extract** — customer name, order number, due date.
  - **Draft** — a first-pass reply, status update, announcement.
  - **Route** — which team or queue this belongs to.
* The trick: the AI step is **in the middle** — its output is for the *next step* to act on, not for a human to read. That changes how you prompt.

> A chat prompt can be loose. An automation prompt cannot — the next step is a machine
> mapping fields; if the shape wobbles, the whole workflow breaks.

---

## The Exact Prompt You'd Paste In

* The real AI-step prompt for support triage — role, fields, pinned format. First, the **role and exact schema** it must return:

```text
You are a support-triage assistant for a B2B software company.
Read the incoming support request below and return a decision the
workflow can act on automatically.

Return ONLY a JSON object with exactly these keys:
{
  "category": one of ["billing", "technical", "account", "sales", "other"],
  "priority": one of ["urgent", "normal", "low"],
  "summary": one sentence, max 20 words,
  "draft_reply": a polite 2-3 sentence first reply,
  "confidence": one of ["high", "medium", "low"],
  "human_review_required": "yes" or "no"
}
```

---

## The Exact Prompt You'd Paste In (cont.)

* Then the **rules** that make the decision safe, plus the input where the tool drops the incoming request:

```text
Rules:
- Set priority to "urgent" only for outage, data-loss, security, or
  a customer explicitly blocked from working.
- If the request mentions patient records, financials, passwords, or
  other sensitive data, set human_review_required to "yes".
- If unsure of the category or the request is ambiguous, set
  confidence to "low" and human_review_required to "yes".
- Do not invent order numbers, names, or facts not present.

Support request:
"""
{{trigger.request}}
"""
```

> `{{trigger.request}}` isn't code — it's how the tool *inserts* the incoming item (you pick
> it from a dropdown). The triple quotes are the delimiter trick from Module 2: they keep the
> customer's words from being read as instructions.

---

## Forcing Structured Output

* The single most important instruction: **"Return ONLY a JSON object with exactly these keys."** Everything downstream depends on it.
* Why: the next step does `IF priority = "urgent"`.
  - AI must return a field literally named `priority`, every time, with an exact value.
  - If today it's `"priority": "urgent"` and tomorrow *"This one looks pretty urgent to me!"* → the condition silently fails and urgent tickets sit.
* Three habits that make output stable:
  - **Name the fields and pin the values.** Not "give a priority" but `"priority": one of ["urgent", "normal", "low"]`. Closed lists beat open-ended.
  - **Say "return ONLY the JSON."** Ban the "Sure! Here's the classification:" chatter.
  - **Use the tool's structured/extract action** — Zapier *Extract*, Make / n8n *structured* modules predefine the fields and enforce the shape. It's the closest thing no-code has to a guarantee.

> This is the same idea as forcing structured output back in Module 2 — trading "the model
> *might* give clean data" for "the model *must*." That trade is what makes an automation
> reliable instead of just a demo.

---

## What the AI Step Returns

* Given request #5 from our sample data —

```text
"Build a workflow that classifies incoming store issues and routes
 urgent items for approval." — Summit Retail
```

* — the AI step returns something like this; the workflow reads each field straight off it:

```text
{
  "category": "sales",
  "priority": "normal",
  "summary": "Retail customer wants an AI workflow to triage and route store issues.",
  "draft_reply": "Thanks for reaching out! Building an AI triage-and-routing workflow
                  is right in our wheelhouse. I'll connect you with a solutions
                  specialist to scope it this week.",
  "confidence": "high",
  "human_review_required": "no"
}
```

* Step 2 writes `category`, `priority`, `summary` to the log. Step 3 checks `priority` (normal → no Slack ping). Step 4 checks `human_review_required` (no → fine). The draft waits for a rep. **Every branch is keyed off a field the AI produced.**

> Feed a *different* request through — the field *values* change, the *shape* doesn't. That
> stability — same shape, every time — is the whole game.

---

## Part 4 — Reliability

> A workflow that works once, on the email you built it with, is a demo. One you trust running
> unattended is a product. The gap between them is testing and error paths.

---

## Test With Sample Data First

* Never point a new automation at a live inbox and hope. Test on inputs *you* control, where you already know the right answer.
* `labs/assets/sample-support-requests.csv` is built for exactly this — five deliberately varied scenarios:

```text
1  Acme Logistics    — routine setup request        → normal, technical
2  Northstar Health  — asks about PATIENT RECORDS    → sensitive! review required
3  River City Events — two asks in one message       → ambiguous, lower confidence
4  Metro Finance     — "missing dates, duplicates"   → messy data, extraction test
5  Summit Retail     — clear workflow request        → happy path
```

* Run each row through the AI step and check the returned fields by hand *before* connecting any downstream action. If row 2 doesn't come back `human_review_required: "yes"`, the prompt isn't done.

---

## The Four Cases Every Workflow Must Survive

* Test these four. If all four behave, you have something real.
  - **Happy path** — clean, normal input (row 5). Sails through, lands in the right place.
  - **Missing data** — a required field is blank (no body; row 4's "missing dates"). Must not crash; flag it or route to review.
  - **Sensitive data** — input that should never be auto-processed (row 2's patient records). Must **stop and escalate**, not summarize and send.
  - **Ambiguous request** — doesn't clearly fit one category (row 3's two-in-one). Confidence drops, a human gets pulled in.

> A workflow that only handles perfect inputs isn't 80% done — it's the easy 80% done and the
> important 20% missing. The messy cases are the whole reason you're automating.

---

## Handling Low Confidence and Missing Data

* `confidence` and `human_review_required` aren't decoration — they're the steering wheel. Wire them into conditions:

```text
IF confidence = "low"            → route to human review queue, don't act
IF human_review_required = "yes" → route to human review queue, don't act
IF a required field is empty     → send to an "exceptions" queue for a person
ELSE                             → proceed with the automated path
```

* The pattern: **AI handles the confident, ordinary cases; hand everything else to a person.**
  - You are not automating 100% of tickets. Automating the clean 70% and cleanly escalating the other 30% is a huge, safe win.

> Design the *uncertain* path first, not the happy path. The happy path takes care of itself.
> What makes an automation safe is what it does when it *doesn't* know.

---

## Error Paths — When a Step Fails

* Steps fail — an app is down, a field is malformed, the AI action times out.
  - Without an error path, a failure means the item silently vanishes — the worst outcome, because no one knows.
* Every serious workflow needs:
  - A **catch/error branch** — Make and n8n have explicit handlers; Zapier routes failed runs to a fallback. At minimum, **notify a human**.
  - A **dead-letter queue** — a sheet or channel where failed items land so nothing is lost.
  - **A log of every run** — what came in, what the AI decided, where it went. Your audit trail *and* your debugging tool.

> "Fail loud" beats "fail silent." An automation that emails you when it chokes is annoying
> once a week. One that swallows failures loses a customer and you never find out why.

---

## Part 5 — From Automation to Agent

> Everything so far follows a path *you* drew. An **agent** draws its own path. That's a real
> jump in power — and in risk. Here's exactly where the line is.

---

## What Makes Something an "Agent"

* An **automation** follows a fixed script: this trigger, then these steps, in this order, every time. You decided the path; the tool runs it.
* An **agent** is given a **goal** and a set of **tools**, and decides the steps *itself*, one at a time, looping until the goal is met.
* Three things together make it an agent:
  - **Tools** — it can *do* things: search, look up a record, send a message, run a query.
  - **Multi-step** — act, look at the result, decide the *next* action. A loop, not one call.
  - **Decisions** — *it* chooses which tool and which step, not you. The path isn't drawn in advance.

```text
AUTOMATION   trigger → step 1 → step 2 → step 3 → done      (path fixed by you)

AGENT        goal → [ pick a tool → act → observe → decide ] → done
                        ▲__________________________|
                             loop until goal met     (path chosen by the agent)
```

> "Run these steps" → "figure out the steps and keep going until done" is the entire idea
> behind every AI agent. Powerful because you *didn't* have to anticipate every path — risky
> for exactly the same reason.

---

## Where Agents Fit — and Where They Don't

* New tools tempt you to reach for the fanciest. Resist — most business problems are *automations*: easier to test, cheaper, safer.
* **Use a plain automation when:**
  - The steps are always the same (triage an email, log a form, route a ticket).
  - You can draw the whole flow on a whiteboard.
  - You want it predictable and auditable.
* **Reach for an agent when:**
  - The path genuinely varies per request and can't be pre-drawn.
  - The task needs several tools chosen dynamically ("research this company across three sources and summarize").
  - A rigid flow would need dozens of branches to cover the cases.

> Start with automation. Add agent behavior only when a fixed path genuinely can't do the
> job. A well-built automation beats a flaky agent every day of the week.

---

## Tool-Connected Assistants and MCP

* The bridge between a *chat* assistant and an *agent* is **tools** — reaching beyond text to touch real systems: your calendar, CRM, search, database.
* The problem: every assistant used to connect to every tool its *own* way — hundreds of one-off integrations, none reusable.
* The **Model Context Protocol (MCP)** is the open standard that fixes this — originally from Anthropic, now broadly adopted across assistants and platforms. Think of it as a **universal adapter**:
  - A tool or data source is exposed *once*, as an **MCP server** (your files, a database, a SaaS app).
  - Any AI assistant that speaks MCP connects to it — no custom glue per assistant.
  - The USB-C of AI tools: one shape of plug, and everything that speaks it fits.

> You won't configure an MCP server in this course. You just need to recognize the term: "we
> support MCP" means their tool plugs into AI assistants without a custom integration — a
> genuine buying signal in 2026.

---

## Assistant Connectors — Tools Without Leaving the Chat

* You don't always need a separate automation platform. Modern assistants (Claude, ChatGPT, Gemini) ship **connectors** that let the assistant reach the tools you already use — right inside the chat.
* Common business connectors:
  - **Gmail / Outlook** — read a thread, draft a reply, surface action items
  - **Google Drive / SharePoint & OneDrive** — find and summarize Docs, Sheets, files
  - **Slack** and other team apps
* This is a **tool-connected assistant** in the everyday sense — the same idea MCP standardizes, packaged for click-to-connect.

```text
Look across Slack and Google Drive to find the open items I need to
follow up on from last week, and summarize them in a short update.
```

> This turns the chat into a small **agent**: it reaches across apps and takes several steps on
> its own. Two rules always hold: an admin must **enable connectors**, and because they touch
> **real data**, keep a human reviewing the output — connect, then approve.

---

## Part 6 — Keeping a Human in the Loop

> The fastest way to lose trust in AI automation is to let it do something irreversible
> unsupervised. Safe automation comes down to one question: *what can it do without asking?*

---

## The Approval Checkpoint

* A **human-in-the-loop** step is a deliberate pause where the workflow waits for a person to say "go." AI does the *work*; the human owns the *decision*.
* In no-code tools it usually looks like one of these:
  - **Draft, don't send.** AI writes the reply → drafts folder → a person hits send. (For a classroom, *always* prefer this.)
  - **An approval message.** A Slack/Teams/email note with the proposed action and Approve / Reject buttons. The workflow waits for the click.
  - **A review queue.** Flagged items land in a sheet or task list with a status column. A person moves them to "approved."

> Put the human gate *before* the irreversible step, never after. "Draft → human approves →
> send" is safe. "Send → human reviews what already went out" is a fire drill.

---

## What Should Never Be Fully Automated

* Some actions always route through a person, no matter how confident the AI. Require review whenever the workflow would:
  - **Send external messages** to customers, partners, or the public
  - **Publish** anything — a post, a page, a listing
  - **Delete or edit records** in a real system
  - **Spend money** — purchases, refunds, payments
  - **Touch sensitive data** — health, financial, personal, legal (row 2, Northstar Health)
  - **Act on low confidence** — the AI told you it wasn't sure; believe it

> Notice how many of these are *irreversible*. That's the real test: **if undoing it is hard, a
> human approves it first.** A draft is reversible — delete it. A sent customer email is not.

---

## The Safe Pattern to Build By

* Every automation in this course — and most you'll build at work — should follow this spine:

```text
Trigger → AI drafts/classifies → log it → route by confidence
        → HUMAN approves the consequential step → action → log the outcome
```

* AI does the reading, sorting, and drafting — the tedious 90%. The human makes the call that matters. Most of the speed, almost none of the risk.

> This isn't training wheels you take off later. Mature teams *keep* the human gate on anything
> consequential — they just make the draft so good that approving takes three seconds. Fast
> *and* safe, not fast *or* safe.

---

## Design It Before You Build It

* Building live without a plan is how demos fall apart in front of a client.
* Before you touch the tool, fill out the **automation design canvas** (`course-materials/automation-design-canvas.md`).
  - On paper it pins down: the goal, the trigger (testable on demand?), the AI step and its fields, where results go, the approval rule, error handling, logging, and the four test cases from Part 4.

> The canvas is thirty minutes that saves an hour of flailing in the builder. Design on paper,
> build with confidence.

---

## Summary

- The **automation landscape** is five tools — Zapier (friendly), Make (visual), Power
  Automate (Microsoft), Copilot Studio (Microsoft agents), and n8n (open-source, self-hosted).
  Pick by where your data lives and who's allowed to hold it.
- Every automation is **trigger → action(s)**, with **conditions** branching. Pick a trigger
  you can test with sample data.
- An **AI step** in the middle summarizes, classifies, extracts, drafts, or routes — its output
  feeds the *next* step, so **force structured output**: named fields, pinned values, "return
  ONLY the JSON."
- **Reliability** = testing the four cases (happy, missing, sensitive, ambiguous) and building
  **error paths** that fail loud.
- An **agent** adds tools + multi-step + its own decisions. Automations for fixed paths; agents
  only when the path truly varies. **MCP** is the universal adapter linking any assistant to
  any tool.
- Keep a **human in the loop** on anything irreversible. The safe spine: *AI drafts → human
  approves the consequential step → action → log.*

---

## Lab 04 — No-Code Automation & AI Agents

**Stop here and run Lab 04.**

Build a no-code automation that uses AI to process an incoming item end to end — with a human
approval gate — using the sample support requests as test data. Build it on your platform, or
run the whole thing by hand in your assistant with the orchestrator prompt.

You will:

1. Fill out the **automation design canvas** for a support-triage workflow.
2. Choose a **trigger** you can fire on demand (new email / new row / a pasted request).
3. Add an **AI step** with a structured-output prompt that returns fixed fields.
4. Route by **confidence** and add a **human approval** checkpoint before any external action.
5. **Test all four cases** — happy, missing, sensitive, ambiguous — against the sample CSV.

**Deliverable:** a completed canvas, workflow screenshots or configuration notes (or the
by-hand chat transcript), the AI-step prompt, four test-case results, and a one-line
human-review-and-logging plan.
