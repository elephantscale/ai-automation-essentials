# ROI, Adoption & Enterprise Capstone

Elephant Scale

---

## Why This Module

* Cost
* Impact
* Adoption
* Capstone
* 30-day plan

> A useful AI workflow needs a number and a rollout plan.

---

## The Arc

* Cost
* Impact
* Adoption
* Capstone build
* Presentation

```text
Workflow -> ROI estimate -> adoption plan -> capstone showcase
```

> "What does it cost?" and "will the team use it?" are business questions.

---

## What AI Actually Costs

* Tool cost
* Build time
* Review time
* Maintenance
* Future connector cost

> The invoice is not the whole cost.

---

## Three Pricing Shapes

* Subscription
* Per-seat
* Usage-based

```text
Subscription  flat monthly cost
Per-seat      user per month
Usage         token, run, task, or document
```

> Most real deployments mix pricing shapes.

---

## Estimate Usage Cost

* Find the unit
* Estimate volume
* Multiply
* Add retry padding
* Set a cap

```text
runs per day x working days x cost per run
+ 20% for retries and edge cases
```

> A cap turns "unbounded" into "at most this much."

---

## Hidden Costs

* Build time
* Review time
* Maintenance
* Prompt updates
* Data updates
* Ownership

```text
Loaded hourly cost = salary + benefits + overhead
```

> Leave out human time and the ROI is fake.

---

## Worked Cost — Support Triage

```text
Tool cost
  AI assistant       3 seats x $30       = $90/mo
  Automation tool    starter plan        = $50/mo
  Usage              ~860 runs x $0.005  = ~$4/mo
  Tool subtotal                           ~$140/mo

Human cost
  Build              12 hrs x $40        = $480 once
  Maintenance        2 hrs x $40         = $80/mo
```

> Count each cost once.

---

## Measuring Impact

* Time saved
* Error reduction
* Rework reduction
* Cycle-time improvement
* ROI
* Payback

> Pick the metric your manager already cares about.

---

## Baseline First

* Measure the old way
* Measure the new way
* Include review time
* Count rework
* Use real volume

```text
Before AI: 8 min x 40/day = 5.3 hrs/day
After AI:  2 min x 40/day = 1.3 hrs/day
Saved:     about 4 hrs/day
```

> Without a baseline, "saves time" is only an anecdote.

---

## ROI Worksheet

* Use case
* Time saved
* Error reduction
* Costs
* Bottom line
* Honest risk

* Worksheet: `course-materials/roi-worksheet.md`

> Conservative numbers are more useful than impressive ones.

---

## Worked ROI — Time Saved

```text
Minutes before                       8
Minutes after, including review      2
Minutes saved per run                6
Runs per week                        200
Hours saved per month                6 x 200 x 4.3 / 60 = ~86
Loaded hourly cost                   $40
Value saved per month                86 x $40 = $3,440
```

> Frequent and boring is where the money is.

---

## Worked ROI — Error Reduction

```text
Error rate before / after      12% -> 4%
Volume per month               200/wk x 4.3 = ~860
Errors avoided                 8% x 860 = ~69
Cost per error                 $25
Value saved                    69 x $25 = ~$1,720/mo
```

> Only claim error savings you can defend.

---

## Worked ROI — Bottom Line

```text
Monthly benefit    $3,440 time + $1,720 errors = $5,160
Monthly cost       $140 tools + $80 maintenance = $220
Net per month      $5,160 - $220 = $4,940

Setup cost         $480
Payback            $480 / $4,940 = ~0.1 month
```

> Payback is often the clearest number for a skeptic.

---

## Read the Number Honestly

* State one weak assumption
* Round savings down
* Round costs up
* Separate hard and soft benefits
* Stress-test the result

```text
Risk: if volume drops off-season, hours saved fall too.
```

> A caveat makes the number more credible.

---

## Adoption Matters

* Tools can be abandoned
* Big launches can backfire
* Teams need ownership
* Workflows need support
* ROI depends on use

> A working automation nobody adopts saves zero hours.

---

## Pilot → Standardize → Scale

```text
PILOT                 STANDARDIZE              SCALE
few volunteers   ->   write it down       ->   wider team
2-4 weeks             prompt, tool,             training
measure               review step, owner        support
```

* Pilot one workflow
* Standardize what works
* Scale only the proven version

> Do not scale what you have not standardized.

---

## Change Management

* Frame as leverage
* Name the boring task removed
* Find champions
* Set honest expectations
* Share prompts that work
* Make help normal

> People need control, context, and a visible win.

---

## Capstone Mission

* One real workflow
* Safe sample data
* Human approval step
* Connector-readiness note
* Governance note
* ROI estimate
* 30-day plan

> Narrow and real beats broad and impressive.

---

## Capstone Building Blocks

* Enterprise project or project-style chat
* Structured prompt
* Prompt chain
* Document or data analysis
* Simulated workflow
* Review queue
* Guardrails
* Connector readiness

> Use the pieces your workflow actually needs.

---

## Worked Capstone — Support Triage

```text
TRIGGER   paste a support request row
   |
[1] CLASSIFY  category, urgency, compliance flag
[2] EXTRACT   customer, issue, requested action
[3] DRAFT     grounded first reply
[4] ROUTE     add review queue row
[5] APPROVE   human reviews before send
```

> The AI routes and drafts. The human owns the send button.

---

## Worked Triage Prompt

```text
You are a support-triage classifier.
For the request below, return JSON:
{
  "category": one of ["setup_help", "data_question", "content", "policy_question", "other"],
  "urgency": one of ["low", "normal", "high", "critical"],
  "sentiment": one of ["calm", "frustrated", "angry"],
  "compliance_flag": true or false,
  "one_line_summary": max 15 words
}

If the request mentions patient records, payment data, or legal action,
set compliance_flag = true and urgency at least "high".
```

> Structured output lets the workflow route.

---

## Worked Output

* Input: Northstar asks about patient records in a public AI tool

```text
{
  "category": "policy_question",
  "urgency": "high",
  "sentiment": "calm",
  "compliance_flag": true,
  "one_line_summary": "Asks whether patient records can go into a public AI tool"
}
```

> The flag routes the case to a human.

---

## Capstone Design Canvas

```text
Problem
User
Trigger
Future trigger
AI task(s)
Source files
Output
Human review
Success metric
Risk control
Connector readiness
```

* Canvas: `course-materials/automation-design-canvas.md`

> If you cannot name human review and risk control, the workflow is not ready.

---

## Capstone Rubric

* Business fit
* Prompt quality
* Enterprise setup
* Artifact quality
* Safety controls
* Connector readiness
* Rollout plan

* Rubric: `course-materials/capstone-rubric.md`

> Most weak capstones fail on safety controls or rollout plan.

---

## Present It in Five Minutes

* Problem
* Workflow
* Project and files
* Demo
* Controls
* Connector recommendation
* ROI
* 30-day plan

```text
Peer feedback: one strength, one improvement, one next step.
```

> Lead with the problem, not the tool.

---

## 30-Day AI Action Plan

```text
Week 1  set up, approve data, name owner, baseline current work
Week 2  build pilot, test normal and edge cases, verify human gate
Week 3  run pilot, log time saved and rework
Week 4  compare to baseline, finish ROI, decide expand / adjust / stop
```

> Week 1's baseline makes Week 4's ROI believable.

---

## Common Capstone Traps

* Too broad
* No human gate
* No project setup
* No baseline
* Fake ROI
* Sensitive data in demo
* Connector overreach

> Every trap is fixable if caught before the build.

---

## Module Review

* Working workflow
* Human gate
* Tested edge case
* ROI worksheet
* Connector-readiness recommendation
* 30-day plan

> Leave with an asset your team can run on Monday.

---

## Lab 07 - ROI, Adoption & Enterprise Capstone

**Stop here and run Lab 07.**

You will:

1. Choose one narrow workflow from your own work.
2. Fill the Capstone Design Canvas.
3. Build the ChatGPT Enterprise workflow artifacts.
4. Test a normal case and a tricky edge case.
5. Complete the connector-readiness checklist.
6. Fill the ROI worksheet.
7. Draft your 30-day plan and present in five minutes.

**Deliverable:** workflow, design canvas, review queue, test results, connector-readiness
checklist, ROI worksheet, capstone rubric, and 30-day action plan.

**Time:** ~60-75 min.
