# Lab 05 - AI for Decisions & Insights

## Goal

Use AI as an **analyst, not a decision-maker**: summarize and extract from a document, analyze
a spreadsheet, then generate a trend insight from a sample dataset and **validate it against
the source** — catching an over-claimed trend before it reaches a slide. You finish by naming
one reporting or analysis task AI could accelerate in your own work this quarter.

## Time

90 minutes

## Tools

Tool-flexible. Use any approved AI assistant with file support and a data-analysis mode —
**Claude, ChatGPT, or Gemini.** No formulas, no code, no automation platform needed for this
lab; everything runs in one assistant chat. Where a step needs an automation platform it says
so — it doesn't here.

## Sample assets

All in `labs/assets/` — open the file in the repo tab in your VM and **upload it, or paste its
text** into the chat:

- [`sample-meeting-notes.md`](../assets/sample-meeting-notes.md) — summarize / extract
- [`sample-support-requests.csv`](../assets/sample-support-requests.csv) — patterns / outliers
- [`sample-vendor-invoices.csv`](../assets/sample-vendor-invoices.csv) — messy data -> clean summary (optional Part 6)
- [`sample-dashboard.png`](../assets/sample-dashboard.png) — read the numbers off an image (optional Part 6)
- **Weekly-volume series** — a 6-week time series, provided inline in Part 4 below (nothing to download)

## Steps

1. **Extract with evidence** from the meeting notes — facts and source quotes before any conclusion.
2. **Analyze the support CSV** — sanity pass, patterns, an outlier, one recommended chart.
3. **Generate a trend + forecast** from the 6-week volume series — ask for a range and the confidence.
4. **Validate the trend against the source** — count the points, find the driver, catch the over-claim.
5. Record results and complete the review checklist.
6. (Optional) Clean the messy vendor CSV and read the dashboard image.

## Prompt Starter

```text
Use only the source I provide. Work in steps and show your evidence.
Step 1: Extract the facts relevant to my question. Number them, each with a source
        quote or the row/cell it came from. Do not interpret yet.
Step 2: Answer using only those facts. If they don't fully answer it, say so.
Step 3: List anything that needs human review or verification.
```

## Deliverable

- Evidence-based extraction from the meeting notes (with a source-quote column)
- Data-analysis result from the support CSV (sanity pass + patterns + outlier + chart)
- Trend-and-forecast output from the 6-week series (forecast as a range, with confidence)
- The **validation** that caught or corrected an over-claimed trend
- One sentence: where AI *supported* the analysis and where a *human still decides*
- Completed review checklist

## Review

Use [`course-materials/document-analysis-checklist.md`](../../course-materials/document-analysis-checklist.md).
Verify calculations, quoted facts, source grounding, and privacy assumptions. For the trend:
confirm the claim is built on enough data points and doesn't collapse to a single outlier.

## Instructor Flow

This is the "AI as analyst" lab. Emphasize throughout: the assistant is not being asked to
*know* the answer or to *make the call* — it's being asked to *work from the source, show its
evidence, and flag its uncertainty.* The human stays the decision-maker. The single most
important moment is Part 4, where a fabricated trend gets caught by validation.

Recommended timing:

| Activity | Minutes |
|----------|---------|
| Evidence extraction demo + meeting notes | 15 |
| Data analysis (support CSV) | 15 |
| Trend + forecast (6-week series) | 15 |
| Validate the trend against the source | 20 |
| Decision support vs. decision-making discussion | 10 |
| This-quarter task + review checklist | 10 |
| Debrief | 5 |

## Detailed Exercise

### Part 1 - Extract Evidence From the Meeting Notes

Use [`sample-meeting-notes.md`](../assets/sample-meeting-notes.md). Open it in the repo tab and
upload it, or paste its text. Before asking for a conclusion, ask for evidence.

**Prompt — paste this** (type it with Shift+Enter for new lines and Enter to send, or paste it
all at once):

```text
Use only the meeting notes I provided. Extract every action item.
Return a Markdown table with columns:
- Action
- Owner
- Due date
- Source quote (the exact words the action came from)
- Confidence: high / medium / low
If an owner or due date is not stated, write "not specified" — do not guess.
After the table, list any open question that has no owner.
```

Then ask the grounded follow-up question:

```text
Using only the notes, answer in two steps.
Step 1 — Evidence: quote the exact lines that relate to this question. Number them.
Step 2 — Answer: answer using only those quotes. If they don't fully answer it, say so.
Question: Does the pilot allow uploading confidential client data?
```

Capture both outputs in your assistant — no separate app needed.

### Part 2 - Analyze the Support CSV

Use [`sample-support-requests.csv`](../assets/sample-support-requests.csv). Upload it (or paste it).

**Prompt — paste this:**

```text
A CSV is attached. Before analyzing, do a quick sanity pass:
- How many rows and columns, and what each column appears to be
- Any missing values, duplicates, or inconsistent formats
Then give me:
1. The 3 most useful patterns or groupings
2. Any outlier or row that looks unusual — and why
3. One chart you'd recommend to a manager, and exactly which columns it uses
Work from the data only. If it's too small to be confident, say so.
```

If your tool can render a chart, ask it to draw the recommended bar chart. Then **verify one
number**: `Show me the rows behind each category you counted.` Spot-check one by hand.

### Part 3 - Generate a Trend and Forecast

Here is a 6-week support-ticket volume series. **Paste this into the chat:**

```text
Weekly support-ticket volume:
Week 1: 40
Week 2: 44
Week 3: 41
Week 4: 45
Week 5: 43
Week 6: 78
```

Then ask for the trend and forecast — **paste this:**

```text
Using only the weekly numbers above, do this in order:
1. Describe the trend you see (direction, rough rate), citing the actual weekly numbers.
2. Give a one-week-ahead forecast as a RANGE, not a single number.
3. State your assumptions and how confident you are given how few data points there are.
If the data is too short to be reliable, say so plainly.
```

Save the output. You'll test it in Part 4. Note whether it stayed honest (flat weeks + a Week 6
spike, low confidence, a range) or over-claimed (steady growth, a precise single-number forecast).

### Part 4 - Validate the Trend Against the Source

This is the heart of the lab. Whatever the assistant said, **make it prove it.**

**Prompt — paste this:**

```text
Before I use your trend, validate it against the numbers:
1. List the exact weekly values you based the trend on.
2. Show the week-over-week change for each week. Which weeks actually rose, and which were flat?
3. How many data points is this built on? Is that enough to claim a trend?
4. If the trend depends mostly on one week, say so and revise the claim in one sentence.
```

You are looking for the assistant to admit: Weeks 1-5 are essentially flat, the whole "trend"
is the single Week 6 spike, and six points can't support a confident projection. If your Part 3
output over-claimed (e.g., "growing steadily, expect ~95 next week"), this step should **correct
it.** Write down the before and after — the corrected claim is your proof you caught it.

**If the assistant was already honest in Part 3, force the failure to see it:** paste
`Give me the most optimistic reading of this data a manager might want to hear.` It will
manufacture a smooth upward trend from the same numbers. That's the over-claim; now run the
validation prompt on *that* and watch it fall apart. Seeing both is the lesson.

### Part 5 - Support vs. Decide (Discussion + Capture)

You now have a trend. A real decision hangs off it: *"Should we hire another support agent?"*
Answer this in your chat, in writing:

```text
In one sentence each:
- What did the AI SUPPORT here (what did it do well as an analyst)?
- What is the DECISION a human must still make and own, and why can't the AI make it?
```

The point to land: the AI can read, draft, and flag — but committing budget to a new hire on
six noisy data points is a **human** call, and "the AI said volume was rising" is not a defense
if the trend was one outlier week.

### Part 6 - (Optional) Clean a Messy Sheet + Read a Dashboard

**6a — Clean the vendor invoices.** Upload
[`sample-vendor-invoices.csv`](../assets/sample-vendor-invoices.csv) — it's deliberately messy
(duplicate categories spelled different ways, inconsistent vendor names, mixed date/currency
formats, missing values, a duplicate row, and a credit). **Paste this:**

```text
The attached CSV is a messy vendor-invoice export. Clean it and summarize it. Do not
change my source; work from a cleaned copy.
1. Standardize category names (merge "IT" / "I.T." / "Information Technology";
   "Office Supplies" / "Supplies"). List the merges you made.
2. Normalize amounts to plain numbers and dates to YYYY-MM-DD. Flag any row where the
   date or amount is missing or unparseable — do not invent one.
3. Flag likely duplicate rows (same vendor, amount, and date).
4. Give me total spend by cleaned category, highest first.
5. List every data-quality issue you found (missing values, the credit, format problems).
Show your assumptions. Do not fill missing values with guesses.
```

A strong answer merges the category variants, flags `INV-1019` as a duplicate of `INV-1001` and
the `-$120.00` credit, and **reports** the missing dates/amounts instead of inventing them.

**6b — Read the dashboard image.** Upload [`sample-dashboard.png`](../assets/sample-dashboard.png).
**Paste this:**

```text
The attached image is a weekly dashboard. Read the numbers off it and return:
- Every headline metric with its value
- What each chart shows, including the value of each bar
- One sentence a manager could read aloud as the week's takeaway
Only report numbers you can actually see. If a value is unclear, say "unclear" — do not estimate.
```

Confirm it reads: Total requests 5, Compliance flags 1, Channels 2; web 3 / email 2; themes
Build/automate 2, Content drafting 1, Data cleanup 1, Policy/compliance 1.

## Expected Result

The assistant produces an evidence-backed extraction (with real source quotes), a data analysis
that **leads with a caveat** and flags the Northstar privacy item, an **honest** trend read
(flat weeks + one spike, low confidence, a range), and — when pushed to over-claim — a
validation pass that **catches and corrects** the fake trend. "Six points can't support that
trend" is a *good* result, not a failure.

## Troubleshooting

- If the extraction invents an owner or date, tighten "use ONLY the source" and re-add the
  "write not specified" fallback.
- If the data analysis gives a number you can't verify, ask it to "show the rows behind each
  count" and re-total one by hand.
- If the forecast is a single confident number, reject it: ask for a **range** and the
  **confidence level** explicitly.
- If the assistant refuses to admit uncertainty, ask "how many data points is this built on, and
  is that enough?" — the point count forces honesty.
- If the trend still sounds smooth, ask "which single week, if removed, would change your
  conclusion?" — that isolates the outlier.
- If image reading looks off, confirm each number against the source data, not the screenshot.

## Completion Criteria

The lab is complete when the student has:

- Evidence-based extraction from the meeting notes (source-quote column)
- Data-analysis result from the support CSV (sanity pass + patterns + outlier + chart)
- A trend-and-forecast output (forecast as a range, with confidence)
- A **validation** that caught or corrected an over-claimed trend
- One sentence separating what AI *supported* from what a *human decides*
- Completed document/data checklist

---

## Teacher's Playbook

Everything below is for the instructor running this live. It gives you paste-ready material, a
demo script, and model answers so you can show "good vs. bad" instead of describing it. Nothing
here needs an automation platform — one assistant chat runs the whole lab.

### The worked model answer (run this live)

Two model outputs anchor the lab: the **data analysis** over the support CSV, and the **trend +
validation** over the 6-week series. Show both as the targets.

**Data analysis over `sample-support-requests.csv` — a strong result:**

```text
Sanity pass:
- 5 rows, 5 columns (id, customer, request, channel, submitted_at).
- No missing values. Dates Jul 15-19, 2026. Channels: web (3), email (2).
- Only 5 rows — all patterns are directional, not statistically solid.

Patterns:
1. All five are AI-enablement asks (summarize reports, clean data, image + email,
   classify/route). A demand signal for AI services, not generic support.
2. Two of five (Northstar Health, Metro Finance) are blocked on data privacy or data
   quality before AI work can begin.
3. "web" skews toward build requests; "email" skews toward data/compliance questions.

Outlier / flag:
- Northstar Health asks whether PATIENT RECORDS can go into a PUBLIC AI tool — a
  compliance red flag. Route to a human immediately; do not treat as a feature request.

Recommended chart:
- Bar chart of request theme (Build/automate 2, Content drafting 1, Data cleanup 1,
  Policy/compliance 1) from the `request` column categorized. Matches the dashboard.
```

Teaching point: the best moves are **leading with the "5 rows, directional only" caveat** and
**escalating the Northstar privacy question as a risk, not a task.** Ask the class to verify one
count by asking the assistant to "show the rows behind each category."

**Trend + forecast over the 6-week series — the honest answer (target):**

```text
Trend: Weeks 1-5 are flat (40, 44, 41, 45, 43 — no direction, just noise in a
tight band). Week 6 jumps to 78, an 81% spike over Week 5 and far outside the range.

Forecast (1 week ahead): roughly 45-80, LOW confidence. It depends entirely on
whether Week 6 is a real shift or a one-off, and 6 points can't tell me which.

Assumptions: weeks are comparable, no seasonality data, no known cause for the spike.
Recommend finding out what happened in Week 6 before trusting any trend.
```

**The over-claim to contrast it with (this is the bug to catch):**

```text
Support volume is on a strong upward trajectory, growing week over week. Projecting
forward, expect ~95 tickets next week and ~140 within a month. Staff up now.
```

Put them side by side. Every clause of the over-claim is false in a deck-ready voice: Weeks 1-5
were flat, the "trajectory" is one point, and "~95 / ~140" is invented precision.

**The validation pass (what catches it):**

```text
1. Values: 40, 44, 41, 45, 43, 78.
2. Week-over-week: +4, -3, +4, -2, +35. Only Week 6 rose meaningfully; the rest are flat/noise.
3. 6 data points, and the entire trend rests on 1 of them. Not enough to claim a trend.
4. Revised: "Volume was flat for five weeks, then spiked once in Week 6. That's a single
   event to investigate, not an established upward trend."
```

That before -> after is the deliverable. Generating an insight is easy; catching the
over-claimed one is the skill.

### Live demo script (exact click-path and prompts)

Aim for 15 minutes. Run it in one assistant chat; narrate every step.

1. **Extract with evidence (3 min).** Upload the meeting notes. First type `Summarize this.` —
   get a generic blob. Then run the Part 1 extraction prompt. Say out loud: "Same notes, same
   model. The only thing that changed was the prompt — and now every line has a receipt."
2. **Data analysis (3 min).** Upload `sample-support-requests.csv`, run the Part 2 prompt, read
   it against the model answer. Ask it to render the bar chart if supported. Then ask "show the
   rows behind each category" and spot-check one — model the verification habit.
3. **Generate the trend (2 min).** Paste the 6-week series and the Part 3 prompt. Read whatever
   it returns aloud. If it's honest, great; if it over-claims, even better — you have your bug.
4. **Force the over-claim (2 min).** Paste `Give me the most optimistic reading a manager wants
   to hear.` Watch it manufacture "steady growth, ~95 next week." This is the whole point of the
   module made visible: on small data, it will invent a trend on request.
5. **Validate (3 min).** Run the Part 4 validation prompt on the optimistic version. Show the
   week-over-week deltas (+4, -3, +4, -2, +35) and the collapse to one outlier. "There's your
   trend — it's one week. We nearly staffed up on noise."
6. **Support vs. decide (2 min).** "The AI read the data, drafted the read, flagged the
   uncertainty — that's support. Whether we hire an agent is a human decision, and 'the AI said
   volume was rising' is not a defense if it was one week." That's the line the module draws.

**No live tool? Paper dry-run works fully.** The 6-week series is six numbers on a whiteboard.
Compute the week-over-week deltas by hand and the over-claim falls apart with no software at all.

### Common student mistakes and how to redirect

- **"Summarize this" with no target.** Redirect: add length, audience, and focus, and require a
  source-quote column. Show the before/after side by side.
- **Trusting a number they never checked.** Redirect: "Ask it to show the rows behind that
  total, then re-add one by hand." Never let a figure into a deck unverified.
- **Accepting a single-number forecast.** The biggest one. A student takes "~95 next week" at
  face value. Redirect: "How many data points? Where's the range and the confidence? A precise
  number off six noisy weeks is fake precision."
- **Missing the outlier.** They see "trending up" and stop. Redirect: "Show the week-over-week
  change. Which single week, if removed, kills the trend?" Make them find Week 6.
- **Treating AI's recommendation as the decision.** A student writes "the AI says hire someone."
  Redirect: "That's automation bias. The AI supports; you decide and you own it. Whose name is
  on this call?"
- **Pasting confidential data to make it real.** Redirect immediately to the approved sample
  files — and use it as a live teaching moment for the governance module.

### Debrief questions with model answers

- **Q: Why ask for evidence and source quotes before the conclusion?**
  A: It makes the answer auditable. When quotes sit above the conclusion, you verify in seconds
  and catch a fabrication instantly.
- **Q: The trend series has only six weeks. Why did we still forecast it?**
  A: To practice the pattern — and to watch the assistant either stay honest (flat + one spike,
  low confidence) or over-claim, so we can catch it. The validation discipline is the lesson,
  not the number.
- **Q: How can AI "invent" a trend? Isn't it just doing math?**
  A: It's a pattern-completer, not a statistician. Asked for a trend, it produces trend-shaped
  language even when the data is noise — fluently and confidently. That's exactly why you
  validate against the points.
- **Q: What's the line between decision support and decision-making?**
  A: Support = read, draft, flag, show evidence. Decision = commit to a consequential,
  hard-to-reverse action. Support can lean heavily on AI; the decision stays with a named human.
- **Q: "The AI recommended it." Is that a defense?**
  A: No. Accountability doesn't transfer to a tool. A person owns every consequential call —
  name them before you act, especially when a trend or forecast is driving the decision.

### What good looks like

A strong deliverable shows all of these:

- The extraction **separates evidence from conclusion**, with real quotes from the notes — not a
  generic summary — and marks missing owners/dates as "not specified."
- The data analysis **leads with the data caveat**, names the Northstar privacy item as a
  flagged outlier, and ties a recommended chart to a business question.
- The trend output gives a **range and a confidence level**, not a single confident number.
- The validation **isolates the Week 6 spike** and revises an over-claimed trend into "one event
  to investigate, not an established trend." The before -> after is visible.
- The student can state, in one sentence each, **what the AI supported and what a human must
  still decide** — and why "the AI said so" isn't accountability.
