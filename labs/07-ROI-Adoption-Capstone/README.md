# Lab 07 - ROI, Adoption & Capstone

## Goal

Build and present a working AI automation for a **real challenge from your own work** —
combining the pieces you built all course (a prompt chain from Module 2, an automation from
Module 4, guardrails from Module 6) into **one** workflow, with an **ROI estimate** and a
**30-day plan**. Narrow enough to explain in five minutes; safe enough to pilot on Monday.

## Time

2 - 2.5 hours

## Tools

Tool-flexible — use whatever your class is set up with:

- **An AI assistant** (Claude / ChatGPT / Gemini) — for the prompt, the grounded assistant,
  and any data analysis.
- **An automation platform** (Zapier / Make / Power Automate / Copilot Studio / n8n) — for
  the trigger → AI step → route → approval flow. *If you don't have a platform seat, you'll
  simulate it by hand in your assistant — see Part 3. The design is what's graded, not the wiring.*

> Provider-neutral: a prompt and a workflow work the same across tools; only the buttons
> differ. Build in whatever your seat provides.

## Sample assets

Use the provided sample data — **never live customer records**:

- `labs/assets/sample-support-requests.csv` — 5 inbound support requests (open it in the repo
  view and paste one row at a time as your "trigger").
- `labs/assets/sample-help-center.md` — a fictional help-center doc to ground a custom assistant.
- `labs/assets/sample-meeting-notes.md`, `labs/assets/sample-vendor-invoices.csv`,
  `labs/assets/sample-dashboard.png` — if your workflow fits one of these better, use it instead.

## Course-materials templates

- `course-materials/automation-design-canvas.md` — the design canvas (fill it first).
- `course-materials/roi-worksheet.md` — the ROI estimate.
- `course-materials/capstone-rubric.md` — how you're scored.

## Steps

1. Pick one narrow, real workflow that's safe to discuss with sample data.
2. Fill the **design canvas**: problem, user, trigger, AI task, tools, output, review gate,
   success metric, risk control.
3. Build the artifacts — combine **at least three** course tools, plus a **human-approval step**.
4. Add guardrails: privacy, verification, the approval gate, and logging.
5. Test two scenarios — a normal case and a tricky edge case.
6. Fill the **ROI worksheet** — time saved, cost, net per month, payback, one honest risk.
7. Draft your **30-day plan** and present the capstone in five minutes.

## Prompt Starter

Copy this into your assistant to build the AI classification step, then adapt the fields to
*your* workflow. Type it with Shift+Enter for new lines and Enter to send, or paste it all at
once:

```text
You are a triage classifier for [my workflow, e.g. inbound support requests].
For the item delimited by triple backticks, return ONLY a JSON object with:
  - category: one of [ ...your categories... ]
  - priority: one of [low, normal, high, critical]
  - summary: one sentence, <= 20 words
  - draft_reply: a polite 2-3 sentence first response
  - compliance_flag: true/false   (true if it involves regulated/personal/sensitive data)
  - human_review_required: "yes" or "no"

Rules:
  - Set human_review_required = "yes" if compliance_flag is true, or if the item is
    ambiguous, or has more than one distinct ask.
  - Do NOT invent names, numbers, or facts not present in the item.

Item: ```{paste one row / one item here}```
```

## Deliverable

- A working (or clearly simulated) no-code AI workflow — trigger, AI step, human gate.
- A completed **Capstone Design Canvas**.
- **Two test results** — a normal case and an edge case.
- A completed **ROI worksheet** (time saved, cost, net/month, payback, one risk).
- A completed **capstone rubric** (self-scored).
- A **30-day action plan**.
- A **five-minute presentation**.

Record everything in your assistant (keep a running note in the chat — no separate app needed)
or in a single doc. Screenshots of an automation canvas count as "the build."

## Review

Use `course-materials/capstone-rubric.md`. The strongest capstones are **narrow, practical,
reviewable, safe enough to pilot, and backed by one honest ROI number.** Most points are lost
on **Safety controls** and **Rollout plan** — the business half. Don't skip them.

## Instructor Flow

This is where students combine the course pieces into one shippable workflow. The single
biggest facilitation job is **stopping people from going too broad** — see the Playbook.

Recommended timing (adjust for class size):

| Activity | Minutes |
|----------|---------|
| Capstone briefing + worked-example demo (incl. the filled ROI worksheet) | 15 |
| Workflow selection (with instructor check-in per student/table) | 15 |
| Design canvas | 15 |
| Design and build | 45 |
| Testing (two scenarios) | 15 |
| ROI worksheet + 30-day plan | 15 |
| Presentation prep | 10 |
| Presentations and peer feedback | 30 |

## Detailed Exercise

### Part 1 - Choose A Workflow

Good capstones are narrow, frequent, reversible, and reviewed:

- Intake / support-request summarizer and router
- Sales follow-up drafter grounded in approved messaging
- Policy / HR FAQ assistant grounded in your handbook
- Vendor-invoice cleaner-and-flagger
- Meeting-notes-to-action-plan workflow
- Weekly-report summarizer

Avoid broad goals like "automate marketing" or "an AI assistant for everything." If you can't
name **one trigger and one output** in a sentence, it's too broad.

### Part 2 - Fill The Design Canvas

Open `course-materials/automation-design-canvas.md` and fill every line. Add these two
capstone-specific lines:

```text
CAPSTONE DESIGN CANVAS
  Problem        What painful workflow are you fixing?
  User           Who does this today, and how often?
  Trigger        What starts the workflow?
  AI task(s)     What does the AI do at each step?
  Tool stack     Which course tools, and why each one?
  Output         What comes out, and where does it go?
  Human review   Where exactly is the approval gate?
  Success metric How will you know it worked? (time saved, rework rate)
  Risk control   What's the biggest risk, and how do you contain it?
```

> If you can't fill **Human review** and **Risk control**, you have an idea, not a capstone.
> Fill the canvas *before* building — students who skip it build the wrong thing and run out of time.

### Part 3 - Build The Artifacts

Create **at least three**, plus the human-approval step:

- A structured prompt (start from the Prompt Starter above)
- A prompt chain or multi-step task (Module 2)
- A grounded assistant / project (ground it in `sample-help-center.md` or your own approved doc)
- Document or data analysis output (e.g. classifying the CSV rows)
- An automation canvas — **real** (screenshots) or **clearly simulated**
- A governance / guardrails note

**Reuse what you already built.** You don't start from scratch: bring your prompt chain from
Lab 02, your automation design from Lab 04, and your guardrails from Lab 06. The capstone is
where they combine.

**No automation-platform seat? Simulate it by hand in your assistant.** Paste this once at the
start of a new chat, then feed it one item at a time — the growing table is your live log:

```text
You are running a triage workflow. I'll paste one item at a time. For EACH item:
1. Classify it (return the JSON from my prompt: category, priority, summary,
   draft_reply, compliance_flag, human_review_required).
2. Apply routing rules:
   - if human_review_required = "yes"  -> route = "Review queue"
   - else                              -> route = "Ready to send (draft)"
3. Append a row to a running Markdown table: item | category | priority | route | summary
Show the JSON, the routing decision, and the updated table. Drafts only — never "send."
Then wait for the next item.
```

Now paste one row of `sample-support-requests.csv` as your trigger. Reading the chat *is*
watching it run.

### Part 4 - Add Guardrails

Before you test, confirm all four are in your workflow:

- **Privacy** — sample data only; the never-paste rule holds; no real PII.
- **Verification** — the prompt says "do not invent facts"; the grounded assistant answers only
  from its docs and escalates when it doesn't know.
- **Human approval** — a person reviews/edits before anything is sent or acted on. Draft-only.
- **Logging** — every run recorded (a tracker row, or the running table) for audit and the
  time-saved metric.

### Part 5 - Test Two Scenarios

Run **both** — the edge case is where the governance point lands:

- **Normal input** — the happy path. Confirm clean output and a sensible draft.
- **Edge case** — missing, ambiguous, or sensitive input (e.g. the patient-records row).
  Confirm the AI does **not** invent data and the human gate catches it (`human_review_required: yes`).

Record what happened and what you'd fix before a pilot.

### Part 6 - Estimate The ROI

Open `course-materials/roi-worksheet.md` and fill it for *your* workflow. Keep numbers honest
and conservative:

- **Time saved** — minutes before/after (include review time), runs per week → hours and $ saved.
- **Error reduction** — only if you can defend the error cost. Otherwise win on time alone.
- **Costs** — subscription (flat / per-seat / usage), one-time build, ongoing maintenance.
- **Bottom line** — monthly benefit − cost = net; setup ÷ net = payback; name one honest risk.

Don't have real numbers? Estimate from your own experience and *label them estimates*. A
transparent estimate beats a fake precision.

### Part 7 - Present

Five minutes, ending on the 30-day plan:

```text
1. Problem (one sentence)   2. Workflow diagram   3. Tools + why
4. Demo (normal + edge)     5. Controls           6. ROI number + payback
7. 30-day plan (the go/adjust/stop decision at day 30)
```

**Peer feedback:** one strength, one improvement, one next step — each anchored to a rubric criterion.

## Expected Result

A strong capstone is small enough to explain in five minutes and real enough to pilot. The
best projects assist or automate one narrow step, with a human review before the final action,
on sample data, with an honest measure of the win and a plan to make it real.

## Troubleshooting

- **Idea too broad?** Narrow to one trigger and one output. Force a single step.
- **No platform seat?** Simulate the workflow by hand (Part 3) and screenshot the config.
- **AI output inconsistent?** Tighten the format — demand JSON with fixed fields and closed lists.
- **Workflow touches sensitive data?** Switch to the provided sample data immediately.
- **No real ROI numbers?** Estimate from experience and label the estimates. Round savings
  down, costs up.
- **Presentation runs long?** Cut to problem, workflow, one control, ROI number, next step.

## Completion Criteria

The capstone is complete when you have:

- A completed design canvas
- At least three course artifacts plus a human-approval step
- Two test scenarios with recorded results (incl. the edge case flagged for review)
- A short governance / guardrails note
- A completed ROI worksheet (net/month, payback, one honest risk)
- A 30-day action plan
- A five-minute presentation

---

## Teacher's Playbook

This is the section to read the night before you teach. It gives you a **fully worked
capstone** — the inbound-support-triage workflow built on the exact sample data students have,
**with a filled-in ROI worksheet** — plus an instructor rehearsal checklist, a facilitation and
time-box script, how to grade with the rubric, the failure modes every cohort hits, a debrief,
and what a top-mark capstone looks like. Nothing here depends on a live automation seat.

### Instructor rehearsal checklist (run through this before class)

- [ ] **Pre-build the grounded custom assistant** on `sample-help-center.md` so you're not
      building it live. Rehearse the **"I don't know → escalate"** test — ask an out-of-scope
      question (the patient-records one) and confirm it *declines and routes to a human*. This
      is the most persuasive 30 seconds in the module; make sure it fires.
- [ ] **Rehearse the worked model end to end** — classification on the CSV, the grounded
      assistant, the by-hand automation (or a Zapier/Make canvas), and the **human-approval gate**.
- [ ] **Have paste-ready prompts open** — the classification prompt and the setup prompt — so
      demos start instantly.
- [ ] **Have the filled-in ROI worksheet ready to show** (below). This is new and central this
      module — walk the numbers live so students see how each line is derived.
- [ ] **Have a filled-in 30-day plan** ready to show as the model.
- [ ] **Practice the scope redirect** — the #1 failure is "automate all of marketing." One
      line: *"one trigger, one output, one human gate."* Plan a per-student/table check-in right
      after workflow selection.
- [ ] **Skim the capstone rubric** so presentation feedback is fast and consistent.
- [ ] **Confirm the seats are ready:** assistant with data-analysis / custom-assistant enabled;
      assets open in the VM (`sample-support-requests.csv`, `sample-help-center.md`).

### The worked model answer — Inbound Support Triage (demo this first)

Open the session by *showing* a finished capstone so students calibrate on scope and quality
before designing their own. Built on `labs/assets/sample-support-requests.csv`, it combines
**five** course tools plus a human gate — students only need three, so this sets a generous
ceiling, not a bar.

**The workflow, end to end:**

```text
TRIGGER   New support request arrives (here: a row of sample-support-requests.csv)
   |
[1] ANALYZE    Assistant classifies: category, urgency, sentiment, compliance flag
[2] EXTRACT    Structured fields pulled as JSON
[3] DRAFT      "Support Triage Assistant" writes a first-response reply from approved docs
[4] ROUTE      Automation logs a tracker row and notifies the right queue
[5] APPROVE    >>> HUMAN reviews & edits the draft before it sends <<<
   |
SEND + LOG     Approved reply goes out; outcome logged for the time-saved metric
```

**Piece 1 — the classification prompt (structured prompting + data analysis).** Paste a few
rows of the CSV into an assistant with this prompt:

```text
You are a support-triage classifier for a services company.
For the request delimited by triple backticks, return JSON with:
  - category: one of [setup_help, data_question, content, policy_question, other]
  - urgency: one of [low, normal, high, critical]
  - sentiment: one of [calm, frustrated, angry]
  - compliance_flag: true/false   (true if it involves regulated/personal data)
  - one_line_summary: <= 15 words
Rules:
  - Northstar Health's request mentions patient records -> compliance_flag = true, urgency >= high.
  - If information is missing, use "other"/"normal"; do NOT invent details.
Request: ```{request_text}```
```

**Model output** for row 2 (`Northstar Health` — "can our team upload patient records into a
public AI tool?"):

```text
{
  "category": "policy_question",
  "urgency": "high",
  "sentiment": "calm",
  "compliance_flag": true,
  "one_line_summary": "Asks whether patient records can go into a public AI tool"
}
```

Use this live to make the governance point land: the *content of the ticket itself* is a
privacy question, and the flag routes it to a human — the AI never answers it alone.

**Piece 2 — the grounded assistant (with an "I don't know" guardrail).** Build a custom
assistant (custom GPT / Claude Project / Gemini Gem) grounded in `sample-help-center.md` — open
it in the repo view inside the VM and upload it (or paste its text). It deliberately leaves some
topics out (HIPAA/patient data, legal, per-account balances) so the "I don't know" test works.
Instruct it:

```text
Answer ONLY from the provided help-center documents. Draft a friendly, concise
first-response email. If the answer is not in the documents, say so plainly and
route to a human owner. Never guess. Never promise refunds or timelines.
```

Demo the **"I don't know" test** live: ask it the patient-records question and show it
*declining and escalating* instead of inventing a policy. Single most persuasive 30 seconds in
the module.

**Model draft** for row 1 (`Acme Logistics` — weekly-report summarizer help):

```text
Hi Acme Logistics team,

Thanks for reaching out! Summarizing weekly operations reports is a great first
use case. Our setup guide walks through connecting your report folder and creating
a reusable summary assistant — I've linked it below. If you'd like, our team can
join a 20-minute call to set it up with you.

Happy to help,
Support
[This is a draft for human review before sending.]
```

**Piece 3 — the automation (Module 4).** Show a Zapier/Make canvas (or a screenshot, or the
by-hand simulation from Part 3): *Trigger: new row → run classification → create tracker row →
route to queue → **hold** draft for approval.* Emphasize the **hold step** — the automation
stops and waits for a person.

**Piece 4 — governance note.** One paragraph students should be able to write:

```text
Governance: Runs on sample data only. Never-paste rule enforced (no real customer
PII, no health records). Human approves every outbound reply. All actions logged to
the tracker for audit and time-saved measurement. Owner: Support Team Lead. Grounded
docs reviewed monthly.
```

Say out loud what makes it safe: **the AI reads, classifies, drafts, and routes — but a human
owns the send button.**

**Piece 5 — the filled-in ROI worksheet (NEW — the centerpiece this module).** Walk this on
screen line by line. It's the model students copy for their own workflow.

```text
ROI WORKSHEET — Inbound Support Triage

THE USE CASE
  Workflow:            Draft + route first-response to inbound support requests
  Who does it today:   2 support reps, ~40 requests/day, 5 days/week
  What AI changes:     AI classifies, drafts, and routes; a human reviews before send

TIME SAVED
  Minutes per run, before                        8
  Minutes per run, after (incl. review)          2
  Minutes saved per run                          6
  Runs per week          40/day x 5 days      =  200
  Hours saved per month  6 x 200 x 4.3 / 60   =  ~86 hrs/mo
  Loaded hourly cost                             $40/hr
  $ saved per month      86 x $40             =  $3,440/mo

ERROR REDUCTION
  Error rate before / after      12%  ->  4%   (misrouted / mishandled tickets)
  Volume per month               200/wk x 4.3  =  ~860 runs
  Errors avoided per month       (12%-4%) x 860 =  ~69
  Cost of a typical error        $25  (re-route, re-reply, apologize)
  $ saved per month              69 x $25      =  ~$1,720/mo

COSTS
  Tool subscription (AI seats + automation platform)   ~$140/mo
  Setup / build time (one-time)   12 hrs x $40         =  $480 once
  Ongoing maintenance             2 hrs/mo x $40        =  $80/mo

BOTTOM LINE
  Monthly benefit    $3,440 + $1,720   =  $5,160/mo
  Monthly cost       $140 + $80        =  $220/mo
  Net per month      $5,160 - $220     =  $4,940/mo
  Payback period     $480 / $4,940     =  ~0.1 month (about 3 days)
  One honest risk:   Volume is seasonal — in a slow month hours saved fall with it.
```

Teaching points to say out loud while you walk it:
- **The lever is runs, not minutes.** 6 minutes x 200 runs = 86 hours. Frequent-and-boring wins.
- **Review time is already inside "minutes after" (2 min)** — so it isn't a separate cost line.
  Count each cost once.
- **Only claim error reduction you can defend.** If a student can't name the error cost, drop
  the block and win on time alone — still $3,440/mo net.
- **Stress-test it:** "halve every benefit, double every cost — it still pays back in under a
  week." That's the sentence that wins a skeptic.

### The filled-in 30-day plan (show as the model)

```text
Week 1  Get tool approval; pick SAFE sample data; name the reviewer (Support Lead);
        MEASURE the baseline — 8 min/ticket, 40/day, 12% rework.
Week 2  Build the real flow on approved data; test happy path + the patient-records
        edge case; confirm the approval hold fires every time.
Week 3  Two volunteers run it on real work for the week; log minutes/ticket and rework
        rate against Week 1.
Week 4  Compare to baseline; finish the ROI worksheet; standardize (prompt, tool, review
        step, owner); DECIDE: expand / adjust / stop — with a reason.
```

### Facilitating the build-and-present session

**Briefing (15 min).** Demo the worked example end to end, **including the ROI worksheet** —
this module the numbers *are* the point. State the rule: combine three-plus tools, one human
gate, one governance note, one ROI number, narrow enough to explain in five minutes. Show the
rubric on screen — grading is not a surprise.

**Selection + canvas (30 min).** This is where you earn your keep. Walk the room during
selection and *challenge every broad idea* before anyone builds. Ask each student: "What's the
one trigger, and the one output?" If they can't answer in a sentence, it's too broad. Require
the design canvas *before* building.

**Build (45 min).** Circulate. Keep a countdown visible. At the halfway mark, announce it and
tell anyone still choosing tools to start building now. Push people toward *simulating* pieces
(screenshots, pasted outputs, the by-hand run) rather than perfecting a live automation — the
learning is in the design, not the plumbing.

**Test (15 min).** Make everyone run the edge case, not just the happy path. The edge case is
where the governance point lands: does the AI invent data? does the human gate catch it?

**ROI + plan (15 min).** Walk the room with the worksheet. The two lines people fumble are
**runs per week** (they guess instead of using real volume) and **costs** (they forget build +
maintenance). Fix those two and the number is credible.

**Prep + present (40 min).** Hard-cap presentations at five minutes with a visible timer. For a
class of 10-12, five-minute slots plus quick feedback fills ~30-45 min — if larger, run a
lightning round (problem + one control + ROI number + next step, 90 seconds each) and pick a
few for full presentations.

### Giving feedback with the rubric

Score each capstone live on the six criteria (Business fit, Prompt quality, Tool selection,
Artifact quality, Safety controls, Rollout plan). Keep it fast and concrete:

- **One strength, one improvement, one next step** per project — no more. Fill the rubric's
  Feedback Notes block as you go.
- Anchor every comment to a criterion: "Strong on safety — the approval gate is explicit. To
  level up Rollout: your Week 1 has no baseline, so add that."
- The two criteria most people underperform on are **Safety controls** and **Rollout plan** —
  the business half. Probe them: "Where's the human gate?" and "What's your baseline and your
  payback number?"
- Praise narrowness out loud. It fights the instinct that bigger = better and calibrates the room.

### Common capstone failure modes and fixes

| Failure mode | What you'll see | Fix / redirect |
|---|---|---|
| Too broad | "AI assistant for all of marketing" | "Give me one trigger and one output." Force a single step. |
| No human gate | AI sends/acts on its own | Require an approval hold before anything leaves. Non-negotiable. |
| Tool-counting | Five tools bolted on to hit the number | "Which tools does the workflow *need*?" Three real beats five forced. |
| No baseline | "It saves loads of time" | "Compared to what? Time the old way — minutes, runs, rework." |
| Fake ROI | Benefit counted, costs forgotten | Add build + review + maintenance time. Make the net honest. |
| Runs-per-week guessed | ROI built on a made-up volume | "Use your real ticket/invoice/email count. The lever is runs." |
| Real sensitive data | Live customer records in the demo | Switch to `sample-support-requests.csv` immediately. |
| Perfectionism on plumbing | Stuck getting a live Zap to fire | Simulate with screenshots + pasted output; grade the design. |
| Confident hallucination unhandled | Assistant invents a policy in the edge case | Add "answer only from documents / else escalate"; re-run the edge case. |

### Debrief — questions with model answers

Ask 3-4 after presentations to consolidate the learning.

- **"Where in your workflow is the human, and why there?"**
  *Model answer:* At the last reversible point before anything reaches a customer or external
  system. The AI drafts and sorts; the human owns the irreversible action. That placement is
  what makes it safe to pilot.

- **"What's your ROI number, and what's the one assumption most likely to be wrong?"**
  *Model answer:* Net dollars per month and payback period — and the honest risk (usually
  volume being seasonal, or the time-saved estimate being optimistic). Naming the risk makes
  the number *more* credible, not less.

- **"Your tool is usage-priced. How do you keep the cost from surprising you?"**
  *Model answer:* Estimate cost per unit x volume, pad ~20%, and set a spend cap or run quota
  on the platform. A cap turns "unbounded" into "at most $X," which is what makes it safe to pilot.

- **"How would you prove this saved time to a skeptical manager?"**
  *Model answer:* A Week-1 baseline of the old process, the same measurement after, and the
  rework rate. One honest before/after number beats any enthusiasm.

- **"Why stage adoption as pilot → standardize → scale instead of just launching it?"**
  *Model answer:* You only scale what the pilot proved and standardization wrote down. A
  big-bang launch of an unproven process is the most common way an AI initiative dies.

### What a strong capstone looks like

Point to this as the model when someone asks "what does an A look like?"

- **Narrow and real.** One trigger, one output, a workflow the student's own team does today.
  Explained in one sentence.
- **Right-sized tools.** Three-to-four course tools, each with a reason. No padding.
- **Visible human gate.** The approval step is explicit in the diagram and enforced in the test.
- **Honest safety note.** Sample data, never-paste rule, logging, named owner.
- **Tested on the edge case.** Shows the AI declining or flagging, not inventing.
- **A real ROI number.** Time saved with a baseline, honest costs, net per month, payback, and
  one stated risk — not "saves lots of time."
- **A real 30-day plan** — Week 1 baseline + approval, Week 2 build + test, Week 3 pilot on real
  work with measurement, Week 4 a genuine go/adjust/stop decision with a reason.

> A top capstone isn't the most impressive demo in the room — it's the one you'd hand a
> colleague and say "run this Monday," with a number that says why. When you see that, mark it
> high and show it to the class.
