# ROI, Adoption & Capstone

Elephant Scale

---

## Why This Module

* Six modules gave you the pieces: prompts, evaluation, no-code automation, decisions, governance.
* This module answers the two questions a manager actually asks:
  - **"What does it cost, and what do we get back?"** — the money case.
  - **"Will my team actually use it?"** — the adoption case.
* Then you **build the thing** — one real workflow from your own work, with an ROI estimate and a 30-day plan.

* By the end you will be able to:
  - Cost an AI use case honestly — subscription, per-seat, usage, and the hidden costs.
  - Measure impact with a baseline: time saved, error reduction, ROI, payback.
  - Plan adoption as pilot → standardize → scale, not a big-bang launch.
  - Design, build, test, and present a working automation people would run on Monday.

> The people who thrive with AI aren't the best prompters. They're the ones who can stand
> up and say "here's the workflow, here's the number, here's the plan." That's this module.

---

## The Arc of This Module

* Four parts, then you build:
  - **Part 1 — Cost.** What AI tools and usage actually cost.
  - **Part 2 — Impact.** Time saved, error reduction, ROI, payback — with the worksheet.
  - **Part 3 — Adoption.** Getting a team to actually use it: pilot, standardize, scale.
  - **Part 4 — Capstone.** Plan, build, guardrail, test, present — plus your 30-day plan.

> Cost and impact are two halves of the same sentence. "It saves four hours a day and costs
> $140 a month" is a sentence a budget owner can say yes to. Half of it is not.

---

## Part 1 — What AI Actually Costs

* You can't build an ROI case if you can't name the costs. Most people name one and miss three.
* The full picture has two buckets:
  - **Tool cost** — what you pay a vendor to use the AI and the automation platform.
  - **Your cost** — the human time to build it, review its output, and keep it running.
* The tool cost is usually the *smaller* number. The human time is where budgets really go.

> The classic mistake is quoting the $20 subscription and forgetting the 12 hours to build
> it and the daily review time. Both belong in the number.

---

## The Three Pricing Shapes

* AI tools bill in one of three shapes. Know which one you're on before you commit a team.
  - **Subscription (flat)** — one price per month for the workspace, regardless of use. Predictable, easy to budget.
  - **Per-seat** — a price *per user per month*. Scales with headcount, not usage. Ten people on the automation = ten seats.
  - **Usage-based** — you pay per unit of work: per token, per task run, per automation step, per document processed. Cheap to start, grows with volume.

* Most real deployments **mix** them: a per-seat assistant + a per-run automation platform + maybe usage-priced AI steps inside it.

```text
SHAPE          BILLED BY            GOOD WHEN...                 WATCH OUT FOR...
Subscription   flat / month         steady, whole-team use       paying for idle seats
Per-seat       user / month         everyone uses it daily       seats bought, never used
Usage          token / run / task   volume is spiky or unknown   cost spikes at high volume
```

> Provider-neutral by design: your AI assistant (Claude / ChatGPT / Gemini) and your
> automation platform (Zapier / Make / Power Automate / Copilot Studio / n8n) each pick one
> of these shapes. The names differ; the three shapes don't.

---

## Estimating Usage Cost Without a Spreadsheet

* Usage pricing scares people because it feels unbounded. It isn't — you can estimate it.
  - **Find the unit** — per task run? per 1,000 tokens? per document?
  - **Estimate volume** — runs per day × working days. Use your real ticket / invoice / email counts.
  - **Multiply, then pad** — cost per unit × volume, then add ~20% for retries and edge cases.
* One honest sentence: *"~200 runs a week at about half a cent each is roughly $5 a week."*

> If the usage math makes you nervous, cap it. Most platforms let you set a spend limit or
> a run quota. A cap turns "unbounded" into "at most $X," and now you can pilot safely.

---

## Don't Forget the Hidden Costs

* Three costs never appear on the invoice but always show up in reality:
  - **Build time (one-time)** — designing, writing the prompt, wiring the automation, testing. Hours × loaded hourly cost.
  - **Review time (ongoing)** — a human checks output before it's sent or acted on. This counts, every run, forever. It's the price of the human gate — and it's worth it.
  - **Maintenance (ongoing)** — the grounding doc changes, the prompt drifts, the platform updates. Someone owns keeping it correct.
* Leave these out and your ROI looks fake — and it *is* fake.

> "Loaded hourly cost" = salary plus benefits, taxes, and overhead — roughly 1.3–1.4× base
> pay. Use it, not the raw wage, or you'll undercount your own time.

---

## Worked — Costing the Support-Triage Automation

* Same running example we'll use all module: an inbound **support-triage** automation.
* Add up all four cost lines — tool, build, review, maintenance:

```text
COSTING THE SUPPORT-TRIAGE AUTOMATION

Tool cost (monthly)
  AI assistant, per-seat      3 seats x $30/seat        = $90/mo
  Automation platform         starter plan              = $50/mo
  Usage inside the flow       ~860 runs x ~$0.005       ~ $4/mo   (rounds into platform)
  ---------------------------------------------------------------
  Tool subtotal                                         ~ $140/mo

Human cost
  Build (one-time)            12 hrs x $40/hr           = $480 once
  Review time                 2 min/run  (already counted in "after" minutes)
  Maintenance (monthly)       2 hrs x $40/hr            = $80/mo
```

> Notice review time isn't a separate line here — it's baked into the "minutes per run,
> after" on the impact side, so you don't double-count it. Count each cost once, in one place.

---

## Part 2 — Measuring Impact

* Cost is only half. Now: **what do we get back?** No research study — an honest before/after.
* Three things are worth measuring; you rarely need all three:
  - **Time saved** — minutes per run × runs, before vs. after. The most common, most fundable.
  - **Error reduction** — fewer mistakes, misroutes, or rework. Best when errors are costly.
  - **ROI & payback** — benefit minus cost, and how fast the build pays for itself.

> Pick the one that matters most for *your* workflow. A triage automation sells on time; a
> compliance check sells on errors avoided. Lead with the number your manager already cares about.

---

## Baseline First — Or You Have Nothing

* The single most-skipped step, and the one that makes or breaks the case.
  - **Time the old way *first*** — before AI, for a representative week. Real minutes, real volume.
  - **Then measure the same task after** — including the human review. Review time counts.
  - **Count the rework** — how often output needed a redo. Falling rework can matter more than raw speed.
* Skip the baseline and "it saves loads of time" is an anecdote, not a number.

```text
Task: Draft first-response to inbound support requests

  Before AI:   ~8 min each  x 40/day  = ~5.3 hrs/day
  After AI:    ~2 min each (draft + review) x 40/day = ~1.3 hrs/day
  Saved:       ~4 hrs/day  |  Rework rate: 12% still need edits beyond a quick pass
```

> "About four hours a day, and 12% still need edits" is a sentence a manager can fund. Ten
> enthusiastic anecdotes are not. The baseline is what turns enthusiasm into a budget line.

---

## The ROI Worksheet — Your Tool

* Use `course-materials/roi-worksheet.md`. It walks four blocks; fill it honestly and conservatively.
  - **The use case** — workflow, who does it today, what the AI changes.
  - **Time saved** — minutes before/after, runs, hours and $ saved per month.
  - **Error reduction** — error rate before/after, cost per error, $ saved.
  - **Costs & bottom line** — subscription, build, maintenance → net per month + payback.
* We'll fill it for support-triage over the next three slides — then you fill it for *your* capstone.

> Conservative beats impressive. If you round time saved *down* and costs *up* and it still
> pays back, nobody can argue with the number. That's the number you want to present.

---

## Worked ROI — Time Saved

* Plug the support-triage baseline into the worksheet's time-saved block:

```text
TIME SAVED
  Minutes per run, before                       8
  Minutes per run, after (incl. review)         2
  Minutes saved per run                         6
  Runs per week            40/day x 5 days   =  200
  Hours saved per month    6 x 200 x 4.3 / 60 =  ~86 hrs/mo
  Loaded hourly cost of the person              $40/hr
  $ saved per month        86 x $40          =  $3,440/mo
```

* The 4.3 is average weeks per month. Everything traces to two honest inputs: minutes saved and runs.

> The lever is **runs**, not minutes. Six minutes sounds trivial; 200 runs a week makes it
> 86 hours a month. Frequent-and-boring is where the money is — exactly the workflow to pick.

---

## Worked ROI — Error Reduction

* Triage also *misroutes* less: tickets land in the right queue, sensitive ones get flagged.

```text
ERROR REDUCTION
  Error rate, before / after     12%  ->  4%    (misrouted or mishandled tickets)
  Volume per month               200/wk x 4.3   =  ~860 runs
  Errors avoided per month       (12% - 4%) x 860  =  ~69
  Cost of a typical error        $25  (rework: re-route, re-reply, apologize)
  $ saved per month              69 x $25       =  ~$1,720/mo
```

* Only claim this if you can defend the error cost. When in doubt, leave it out and win on time alone.

> Error reduction is the quieter, often bigger win in regulated or customer-facing work.
> One avoided compliance slip can dwarf a month of saved minutes — but only count what you can measure.

---

## Worked ROI — Bottom Line & Payback

* Put benefit and cost together. Benefit from the two prior slides; cost from Part 1:

```text
BOTTOM LINE
  Monthly benefit    time $3,440  +  errors $1,720   =  $5,160/mo
  Monthly cost       subscription $140  +  maintenance $80  =  $220/mo
  NET per month      $5,160  -  $220    =  $4,940/mo

  Setup cost (one-time)   $480
  PAYBACK PERIOD          $480 / $4,940  =  ~0.1 month  (about 3 days)
```

* Even if you halve every benefit and double every cost, it still pays back in under a week.

> Payback period is the most persuasive single number for a skeptic: "we make the build cost
> back in three days, then it's net positive every month after." Stress-test it, then present it.

---

## Reading the Number Honestly

* A good ROI case names its own weak spot before someone else does.
  - **State one honest risk** — the assumption most likely to be wrong (e.g. "if volume drops off-season, hours saved fall too").
  - **Show the conservative version** — round savings down, costs up; if it still wins, say so.
  - **Separate hard from soft** — dollars saved (hard) vs. "less stress, faster replies" (soft). Both are real; label which is which.
* A number with a stated risk is *more* credible, not less.

> The worksheet's last line is literally "one honest risk that could reduce the benefit."
> Fill it. A manager trusts the person who volunteers the caveat over the one who hides it.

---

## Part 3 — Adoption & Change Management

* The ROI is real only if people actually use it. Most AI tools don't fail — they get *dropped*.
* Two failure modes, opposite directions:
  - Dropped on a team with no plan, quietly abandoned by week three.
  - Launched big-bang to everyone before it was proven, breaks publicly, kills trust.
* The fix is the same for both: **stage it deliberately.**

> A working automation nobody adopted saved zero hours. Adoption is not a soft skill bolted
> on at the end — it's half of whether the ROI you calculated ever shows up.

---

## Pilot → Standardize → Scale

* Treat adoption as three stages, never one launch:
  - **Pilot** — one workflow, a few volunteers, a fixed time box (2–4 weeks). Measure. Learn. Expect to change the prompt and the process.
  - **Standardize** — once it works, *write it down*: approved prompt, tool, review step, named owner. Now someone who wasn't in the pilot can run it.
  - **Scale** — roll the standardized version to the wider team with training and support. Only scale what the pilot proved.

```text
   PILOT              STANDARDIZE            SCALE
   few volunteers  →  write it down       →  whole team
   2-4 weeks          prompt, tool,          training +
   measure & learn    review, owner          support
                      (now repeatable)       (only what's proven)
```

> Don't scale what you haven't standardized; don't standardize what you haven't piloted.
> Skipping a stage is the most common way an AI initiative dies.

---

## Change Management — The Human Side

* Tools are easy; people are hard. Two opposite fears: some fear replacement, others expect magic and quit the first time it's wrong.
* What actually moves adoption:
  - **Frame it as leverage, not replacement.** AI drafts; the human judges. Name the boring task it removes, not the job it threatens.
  - **Find your champions.** Every team has a curious first-mover. Support them; showcase the win; let peers learn from a peer.
  - **Set honest expectations.** A fast, tireless intern that occasionally makes things up — brilliant supervised, dangerous without. Say it out loud.
  - **Make asking for help normal.** A shared channel of "prompts that worked" spreads skill faster than any training deck.

> People don't resist AI. They resist *change they didn't choose and don't control.* Give
> them a say, an easy on-ramp, and a visible win — adoption takes care of itself.

---

## Part 4 — The Capstone: Your Mission

* Put it all together: **one real workflow from your own work**, combining the course pieces into something you'd actually pilot.
* Requirement — combine at least three of these, plus a **human-approval step** and a short **governance note**:
  - A **structured prompt** you designed and tuned (Module 2)
  - A **prompt chain** or multi-step task (Module 2)
  - **Document or data analysis** (Module 5)
  - A **no-code automation** — trigger → AI step → route (Module 4)
  - **Guardrails**: privacy, verification, a human gate (Module 6)
* Then: an **ROI estimate** (this module) and a **30-day plan**.

> The score isn't "how many tools." It's "would a real team run this on Monday?" Narrow and
> real beats broad and impressive every time.

---

## Worked Capstone — Inbound Support Triage

* Here's a finished capstone end to end, so you calibrate on scope *before* designing your own.
* Workflow: **inbound support requests land in a queue; first-pass handling is drudgery.** Insert AI at the right steps; keep a human before anything reaches the customer.

```text
TRIGGER     New support request (email / form / a row of the sample CSV)
   |
[1] ANALYZE AI classifies: category, urgency, sentiment, compliance flag
[2] EXTRACT AI pulls fields: customer, issue, requested action  -> as JSON
[3] DRAFT   Grounded "Support Triage Assistant" writes a first reply
[4] ROUTE   Automation logs a tracker row + notifies the right queue
[5] APPROVE >>> HUMAN reviews & edits the draft before it sends <<<
   |
SEND + LOG  Approved reply sends; outcome logged for the time-saved metric
```

> The AI reads, classifies, drafts, and routes — but a human owns the send button. That one
> design choice is what makes it safe enough to pilot.

---

## Worked Capstone — The Pieces

* Map each step to a course tool — the "combine at least three" requirement, satisfied naturally, not forced:
  - **Structured prompt (M2)** — the triage classifier that returns clean JSON the automation can route on.
  - **Data analysis (M5)** — run the classifier over `sample-support-requests.csv`; flag anything about refunds, legal, or regulated data.
  - **Grounded assistant (M4-ish)** — a **Support Triage Assistant** grounded in `sample-help-center.md`; drafts a reply *and* says "I don't know — escalate" when the answer isn't in its docs.
  - **Automation (M4)** — trigger → run classification → create tracker row → route → **hold** the draft for approval.
  - **Guardrails (M6)** — sample data only; never-paste rule; mandatory human gate; every action logged.

> Five pieces here sets a generous ceiling — you only need three. Use what your workflow
> *needs* and explain why each earns its place. Padding loses points; it doesn't win them.

---

## Worked Capstone — The Triage Prompt

* The classification step is just a well-structured prompt (Module 2), applied to real support data:

```text
You are a support-triage classifier for a services company.
For the request delimited by triple backticks, return JSON with:
  - category: one of [setup_help, data_question, content, policy_question, other]
  - urgency: one of [low, normal, high, critical]
  - sentiment: one of [calm, frustrated, angry]
  - compliance_flag: true/false   (true if it involves regulated/personal data)
  - one_line_summary: <= 15 words

Rules:
  - If the request mentions patient records, payment data, or legal action,
    set compliance_flag = true and urgency at least "high".
  - If information is missing, use "other"/"normal" — do NOT invent details.

Request: ```{request_text}```
```

> Structured JSON isn't a nice-to-have — it's what lets the *automation* route without a
> human reading every one. Prompt and automation are two halves of one design.

---

## Worked Capstone — What It Returns

* Feed it row 2 of the sample CSV — Northstar Health, *"can we upload patient records into a public AI tool?"*:

```text
{
  "category": "policy_question",
  "urgency": "high",
  "sentiment": "calm",
  "compliance_flag": true,
  "one_line_summary": "Asks whether patient records can go into a public AI tool"
}
```

* The `compliance_flag` fires; the workflow routes this to a human. The AI never answers a privacy question alone.

> The most persuasive 30 seconds in the whole course: ask the grounded assistant that same
> patient-records question and watch it *decline and escalate* instead of inventing a policy.

---

## The Capstone Design Canvas

* Fill this *before* you build. It's also your presentation skeleton — nine lines that force specifics.
* Use `course-materials/automation-design-canvas.md` (plus these two capstone lines):

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

> Can't fill "Human review" and "Risk control"? You don't have a capstone yet — you have an
> idea. Those two lines are where a clever demo becomes something a business can run.

---

## The Rubric — How You're Scored

* Six criteria. Read them *before* you build — a checklist, not a surprise. Use `course-materials/capstone-rubric.md`.

| Criterion | Strong | Needs Work |
|-----------|--------|------------|
| **Business fit** | Solves a real, valued workflow problem | Vague or low-value |
| **Prompt quality** | Clear task, context, output, constraints | Ambiguous prompt |
| **Tool selection** | Tools match the task and environment | Tools chosen without rationale |
| **Artifact quality** | Output usable with light review | Output needs major rework |
| **Safety controls** | Privacy, approval, verification built in | Risks not addressed |
| **Rollout plan** | Clear 30-day next steps + ROI number | No practical adoption plan |

> Most points are lost on **Safety controls** and **Rollout plan** — the business half. A
> brilliant workflow with no approval gate and no ROI number is a demo, not a capstone.

---

## Present It — Five Minutes + Peer Feedback

* You'll present in five minutes. Keep the shape tight and lead with the problem, not the tool.

```text
FIVE-MINUTE CAPSTONE SHOWCASE
  1. Problem        the painful workflow, in one sentence
  2. Workflow       the trigger -> AI step -> human gate diagram
  3. Tools          which course pieces, and why each
  4. Demo           screenshots or a live run (normal + edge case)
  5. Controls       privacy, the human gate, logging
  6. ROI            the one honest number + payback
  7. 30-day plan    the go/adjust/stop decision at day 30
```

* **Peer feedback:** one strength, one improvement, one next step — anchored to a rubric criterion.

> Presenting is the skill that gets it funded. A workflow nobody can explain in five minutes
> is a workflow nobody will approve. Practice the sentence, not just the build.

---

## Your 30-Day AI Action Plan

* Every capstone ships with a plan to make it real: four weeks, one honest decision at the end.

```text
30-DAY AI ACTION PLAN

Week 1 — Set up & baseline
  - Get tool approval; confirm workspace and data policy
  - Identify SAFE pilot data (or approved real data)
  - Name the reviewer / owner
  - MEASURE the current process (time, volume, pain) — the baseline

Week 2 — Pilot build
  - Build the real version with approved data
  - Test the normal case AND the edge cases
  - Confirm the human-approval gate works every time

Week 3 — Run the pilot
  - Volunteers run it on real work for the week
  - Log time saved + rework rate against the Week-1 baseline

Week 4 — Decide
  - Compare after-numbers to the baseline; finish the ROI worksheet
  - Standardize: write down the prompt, tool, review step, owner
  - Decide: expand, adjust, or stop — and say why
```

> No plan → a science-fair project. With one → a proposal your manager can say yes to on the
> spot. Week 1's baseline is what makes Week 4's ROI believable.

---

## Common Capstone Traps

* Learn from the mistakes every cohort makes, so you don't repeat them:
  - **Too broad** — "an AI assistant for all of marketing." Narrow to one trigger, one output. Broad can't be tested, so it can't be trusted.
  - **No human gate** — the AI sends/acts on its own. Add the approval hold; it's what makes it safe.
  - **Tool-counting** — five tools bolted on to hit a number. Use what the workflow needs; justify each.
  - **No baseline** — "saves loads of time" with no measurement. Time the old way first, or you have nothing.
  - **Fake ROI** — benefit counted, costs forgotten. Include build, review, and maintenance time.
  - **Real sensitive data in the demo** — use the provided sample data, never live records.

> Every one is fixable in five minutes if caught early. That's why you get the rubric, the
> canvas, and the worksheet *before* you build.

---

## Module Review

* You leave this module — and this course — with three things in hand:
  - **A working (or clearly simulated) automation** — trigger, AI step, human gate, tested on a normal and an edge case.
  - **An ROI case** — a filled worksheet: time saved, cost, net per month, payback, one honest risk.
  - **A 30-day plan** — baseline, build, pilot, and a real go/adjust/stop decision.
* That trio is exactly what turns "I took an AI course" into "I shipped an AI workflow at work."

> Leave with a working automation, an ROI case, and a 30-day plan. Not a certificate — an
> asset your team can run on Monday.

---

## Lab 07 - ROI, Adoption & Capstone

**Stop here and run Lab 07.**

You will:

1. Choose one narrow, real workflow from your own work — safe to discuss with sample data.
2. Fill the **Capstone Design Canvas** — problem, user, trigger, AI task, tools, review gate, metric.
3. Build the artifacts: combine **at least three** course tools + a **human-approval step** + a short **governance note**.
4. Test against two scenarios — a normal case and a tricky edge case.
5. Fill the **ROI worksheet** — time saved, cost, net per month, payback, one honest risk.
6. Draft your **30-day plan** and present the capstone in five minutes, scored against the rubric.

**Deliverable:** a working (or clearly simulated) no-code AI workflow, the design canvas, test
results, a completed ROI worksheet, a completed capstone rubric, and a 30-day action plan.
