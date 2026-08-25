# AI for Decisions & Insights

Elephant Scale

---

## Why This Module

* Modules 2-4 taught you to *drive* an assistant and *wire* it into a workflow. This one points it at the thing managers actually get paid for: **turning information into a decision.**
* Where the day goes:
  - A team lead reading a 40-minute meeting transcript for the three action items.
  - An ops manager staring at a messy vendor export before a budget review.
  - A support director asked in a hallway "so, is the ticket volume trending up?"
* The stakes flip here:
  - A weak email draft — you notice and rewrite it.
  - An **invented trend** or a **mis-read total** in a deck — you might not notice, and you'll present it to leadership.
* So this module runs on one discipline: **AI is your analyst, not your decision-maker.** It reads fast, drafts the insight, and shows the evidence. **You** verify the numbers and own the call.

> The single skill in this module: make the assistant **work from your source and show its
> receipts** — the quotes, the rows, the counts behind every claim. Everything else is
> technique on top of that.

---

## What You'll Be Able to Do

* By the end of the module and lab:
  - **Summarize and extract** from documents, transcripts, and reports — with the evidence attached.
  - **Analyze a spreadsheet** with AI assistance — patterns, outliers, a recommended chart — no formulas, no code.
  - **Read the numbers off a dashboard image** and turn them into a narrative.
  - Ask for a **trend or forecast** from sample data — and **sanity-check it** so you don't ship a trend that isn't there.
  - **Compare and classify** documents to pull out what matters.
  - Draw the line between **decision support and decision-making** — and keep the human on the right side of it.
* Lab target: **generate trend insights from a sample dataset and validate them against the source** — catching an over-claimed trend before it reaches a slide.

---

## Part 1 — Summarize & Extract

> Summarize, extract, compare, classify. Four verbs cover almost all document and transcript
> work. The mistake is treating all four as "summarize this."

* Different jobs, different prompts, different review paths.
* Source material this week: `sample-meeting-notes.md`, plus any report or transcript you bring.

---

## Summarize With a Purpose

* "Summarize this" is the weakest prompt in the course — no target, so it guesses length, audience, and focus, usually wrong.
* A good summary prompt answers three questions the model can't:
  - **How long?** — "in 5 bullets," "one paragraph," "under 100 words."
  - **For whom?** — "for a VP who only cares about cost and risk."
  - **Focused on what?** — "decisions and open questions; skip logistics."

```text
Summarize the meeting notes below for a busy executive sponsor.
Give me:
- A one-sentence status: on track / at risk / blocked
- The 3 decisions that were made
- Any open question that needs a manager to resolve
Keep it under 100 words. Plain language, no jargon.
```

> Same document, five readers, five different summaries. Name the reader and you've done half
> the work.

---

## Transcripts Are Just Long, Messy Documents

* Meeting recordings, call transcripts, webinar auto-captions — same techniques, one extra habit.
* Transcripts are **noisy**: filler, crosstalk, "um," half-finished sentences, no speaker structure.
* Tell the assistant to **cut the noise and keep the decisions**:

```text
The text below is a raw meeting transcript. Ignore filler, small talk, and repetition.
Return:
- Decisions made (bullets)
- Action items as a table: Owner | Action | Due date (write "not stated" if absent)
- Open questions with no owner
Base every line on the transcript only. Do not add anything that wasn't said.
```

> A one-hour transcript is 8,000+ words no one re-reads. Extracting the 6 action items from it
> is one of the highest-value minutes AI gives you all week.

---

## Extract, Don't Summarize

* Often you don't want prose — you want **specific fields pulled out and lined up**: action items, dates, owners, amounts, obligations. That's **extraction** — a table, not a paragraph.
* Power move: make **missing data visible** instead of letting the model quietly skip it. Tell it what to write when a field isn't there.

```text
Extract every action item from the meeting notes below.
Return a Markdown table with columns:
- Action
- Owner
- Due date
- Source quote (the exact words the action came from)
- Confidence: high / medium / low
If an owner or due date is not stated, write "not specified" — do not guess.
```

* The `Source quote` column is your receipt — you see the exact line and catch a made-up one instantly.

---

## Worked Example — Extract From the Sample Notes

* Run that prompt over `labs/assets/sample-meeting-notes.md`:

```text
| Action                                | Owner  | Due date  | Source quote                                             | Confidence |
|---------------------------------------|--------|-----------|---------------------------------------------------------|------------|
| Provide 3 approved sample reports     | Jordan | Jul 25    | "Jordan will provide three approved sample reports..."  | high       |
| Draft first prompt template           | Priya  | not spec. | "Priya will draft the first prompt template..."         | high       |
| Use only the managed workspace        | Elena  | not spec. | "Elena recommended using only the managed workspace..." | medium     |

Open question (no owner): "which department owns long-term maintenance of the assistant?"
```

* Read what it did:
  - Jordan — hard date, clean quote → **high**.
  - Elena — a recommendation, not a firm assignment → **medium**, correctly not a decided action.
  - Maintenance question surfaced **separately** because nobody owns it.
* **That last line is the most valuable thing on the slide** — the risk your eye would skim past.

---

## The Extract-Then-Answer Pattern

* For any question that matters, don't let the model leap to a conclusion. Make it lay out the evidence **first**, then reason from it.
  - The no-code version of "show your work." Cuts confidently-wrong answers dramatically.

```text
Use ONLY the document below. Work in two steps.

Step 1 — Evidence: List the exact quotes from the document that relate to my
question. Number them. Do not interpret yet.

Step 2 — Answer: Answer using only the quotes from Step 1. If they don't fully
answer it, say "the document does not fully answer this" and say what's missing.

My question: Does the pilot allow uploading confidential client data?
```

* On the sample notes: Step 1 surfaces Sam's concern, Elena's "managed workspace only," and the "internal sample data only" decision. Step 2 concludes **no — internal sample data only**, citing those exact lines. Auditable in five seconds.

> When the answer and its evidence live in the same reply, verification takes seconds. When
> they don't, it takes a re-read of the whole document. Always ask for the evidence.

---

## Part 2 — Document Intelligence: Compare & Classify

> Two more verbs that turn a pile of documents into a decision: **what changed** and
> **which bucket does this go in.**

---

## Comparing Two Documents

* "What changed?" is one of the highest-value questions you can ask — contract v3 vs. v4, last quarter's policy vs. this one, your proposal vs. the redline back.
* The mistake: asking for *every* difference — you drown in reformatting and comma moves. Ask for **material** changes, sorted by who should care.

```text
Compare Document A and Document B below. Ignore wording and formatting changes.
Focus only on changes that affect money, dates, obligations, risk, or scope.
Return a table:
- What changed (A -> B)
- Category: money / deadline / obligation / scope / risk / other
- Why it matters (one line)
- Needs human review? (yes for anything legal or financial)
At the end, name the single change a reviewer should look at first.
```

* The `Needs human review?` column is deliberate: the assistant is fast, but it is **not** your lawyer. It routes attention; it doesn't sign off.

---

## Classifying — Sorting the Pile

* Classification is "put each item in a bucket": tickets by type, feedback by theme, invoices by category, resumes by role.
* Give it a **closed list of buckets** and a fallback, or it invents new categories on every run.

```text
Classify each support request below into exactly one category:
Build/automate, Content drafting, Data cleanup, Policy/compliance, Other.
Return a table: id | customer | category | one-line reason.
If a request fits two, pick the primary one and note the second in the reason.
Use only these five categories — do not invent new ones.
```

* Run it on `sample-support-requests.csv` and you get the same themes the dashboard shows: Build/automate x2, Content drafting, Data cleanup, Policy/compliance — which is exactly the point of the next part.

> Closed lists are what make classification *reusable*. "Sort these somehow" gives you a
> different taxonomy every Monday; a fixed bucket list gives you a report you can trend.

---

## Part 3 — Analyzing Data, No Formulas

> Modern assistants load a spreadsheet, analyze it, and describe charts — in plain English,
> with no formulas or code from you. You review the findings; you never see the code.

* Point it at real business data and drive it with good questions.
* Sample data this week: `sample-support-requests.csv` and the deliberately messy `sample-vendor-invoices.csv`.

---

## The Data-Analysis Prompt Pattern

* Weak: "analyze this spreadsheet." Strong: **describe the data first, then find patterns, then flag what's suspicious** — in that order.

```text
A CSV is attached. Before analyzing, do a quick sanity pass and tell me:
- How many rows and columns, and what each column appears to be
- Any missing values, duplicates, or inconsistent formats you notice
Then give me:
1. The 3 most useful patterns or groupings in this data
2. Any outliers or rows that look unusual — and why
3. One chart you'd recommend to a manager, and exactly which columns it uses
Work from the data only. If the dataset is too small to be confident, say so.
```

* The sanity pass is the whole game: half-missing dates and duplicated vendor names mean every downstream "insight" is built on sand. Know **that** before you present a trend that isn't real.

---

## Worked Example — Analyzing the Support CSV

* Point that prompt at `labs/assets/sample-support-requests.csv` (5 support requests):

```text
Sanity pass:
- 5 rows, 5 columns (id, customer, request, channel, submitted_at).
- No missing values. Dates span Jul 15-19, 2026. Channels: web (3), email (2).
- Only 5 rows — treat all patterns as directional, not statistically solid.

Patterns:
1. Every request is an AI-enablement ask (summarize reports, clean data, image +
   email, routing workflow) — a demand signal for AI services, not generic support.
2. Two of five (Northstar Health, Metro Finance) are blocked on DATA PRIVACY or
   DATA QUALITY before any AI work can start.
3. "web" skews toward build requests; "email" skews toward data/compliance questions.

Outlier / flag:
- Northstar Health asks whether PATIENT RECORDS can go into a PUBLIC AI tool.
  That's a compliance red flag, not a feature request — route to a human immediately.

Recommended chart:
- Bar chart of request theme (Build/automate, Content drafting, Data cleanup,
  Policy/compliance), one bar each, from the `request` column categorized.
```

---

## Reading the Result Like an Analyst

* Worth pausing — this models what "good" looks like:
  - **Led with the caveat** — five rows, directional only. Presenting five points as a firm trend does you harm.
  - Found a pattern your eye might miss — not five random tickets, a **demand signal**.
  - Escalated the **Northstar privacy question** as a risk, not a task. That's judgment.
* Your job on receiving: **verify anything that becomes a number in a deck.**
  - "Show me the rows behind each category." Spot-check one.
  - AI is a fast analyst, not an audited one.

> Totals, percentages, and "top N" claims are where assistants slip. If a figure is going in
> front of your boss, make the assistant show the rows behind it.

---

## Getting a Clean Table Out of a Mess

* Real source material is ugly — collapsed PDF columns, prices buried in an email thread, an export with duplicate categories spelled five ways.
* Assistants are genuinely good at turning mush into structure — if you **define the columns and the rules**.

```text
The attached CSV is a messy vendor-invoice export. Clean it and summarize it.
Do not change my source; work from a cleaned copy.
1. Standardize category names (merge "IT" / "I.T." / "Information Technology";
   "Office Supplies" / "Supplies"). List the merges you made.
2. Normalize amounts to plain numbers and dates to YYYY-MM-DD. Flag any row where
   the date or amount is missing or unparseable — do not invent one.
3. Flag likely duplicate rows (same vendor, amount, and date).
4. Give me total spend by cleaned category, highest first.
5. List every data-quality issue you found (missing values, the credit, format problems).
Show your assumptions. Do not fill missing values with guesses.
```

> On `sample-vendor-invoices.csv` a strong answer merges the category variants, flags
> `INV-1019` as a duplicate of `INV-1001` and the `-$120.00` credit, and **reports** the
> missing dates and amounts rather than inventing them. "Reports the gaps instead of guessing"
> is the whole point.

---

## Reading the Numbers Off a Dashboard

* Multimodal assistants read **images** — a screenshot of a dashboard, a chart in a PDF, a photographed report. Upload it and ask.
* Useful when the underlying data isn't handy — you have the picture, not the spreadsheet.

```text
The attached image is a weekly dashboard. Read the numbers off it and return:
- Every headline metric with its value
- What each chart shows, including the value of each bar
- One sentence a manager could read aloud as the week's takeaway
Only report numbers you can actually see. If a value is unclear, say "unclear" —
do not estimate.
```

* On `sample-dashboard.png` a good read returns: **Total requests 5, Compliance flags 1, Channels 2; by channel web 3 / email 2; by theme Build/automate 2, Content drafting 1, Data cleanup 1, Policy/compliance 1.**

> Reading an image is convenient and **fallible** — it can transpose a digit or misread a
> small axis. For any number that matters, confirm it against the source data, not the
> screenshot.

---

## Part 4 — Trend & Forecast Assistance

> "Is this trending up?" and "what will next quarter look like?" are the questions that make
> AI-assisted analysis feel like magic — and the ones most likely to hand you a confident
> fiction. Treat every trend as a claim to verify.

---

## Asking for a Trend or Forecast

* You can ask an assistant to spot a trend and project it forward. Do it in **two moves**, never one:
  1. Ask it to **describe the trend it sees**, with the numbers behind it.
  2. Ask it to **forecast** — and to **state the assumptions and the confidence.**

```text
The table below is weekly support-ticket volume. Do this in order:
1. Describe the trend you see (direction, rough rate), citing the actual weekly numbers.
2. Give a one-week-ahead forecast as a RANGE, not a single number.
3. State your assumptions and how confident you are, given how few data points there are.
Work only from the numbers below. If the data is too short to be reliable, say so.
```

> Forcing a **range** and an **assumptions line** is the difference between "156 tickets next
> week" (fake precision) and "roughly 120-170, low confidence on 6 weeks of data" (honest).

---

## Worked Example — A Trend Over Sample Data

* Feed it six weeks of volume (the kind of series you'd paste from a report):

```text
Week 1: 40   Week 2: 44   Week 3: 41   Week 4: 45   Week 5: 43   Week 6: 78
```

* A **strong** assistant answers something like:

```text
Trend: Weeks 1-5 are essentially flat (40-45, no real direction). Week 6 jumps to
78 — an 81% spike over the prior week and well outside the earlier range.

Forecast (1 week ahead): 45-80, LOW confidence. The result hinges entirely on
whether Week 6 is a real shift or a one-off. On 6 points I can't tell.

Assumptions: no seasonality info, no cause for the Week 6 spike, treating all weeks
as comparable. Recommend checking what happened in Week 6 before trusting any trend.
```

* Notice what it **didn't** do: it didn't average the spike into "volume growing ~15%/week" and extrapolate a smooth climb. That restraint is what you're paying for.

---

## How AI Invents Trends on Small Data

* Language models are pattern-completers. Ask for a trend and they will **find one** — even in noise, even in five points, even when the honest answer is "there's nothing here."
* The failure looks like this — same six weeks, an **over-claimed** read:

```text
Trend: Support volume is on a strong upward trajectory, growing steadily week over
week. Projecting the growth forward, expect ~95 tickets next week and ~140 within a
month. Recommend staffing up now.
```

* Every clause is wrong in a **confident, deck-ready** voice:
  - Weeks 1-5 were **flat** — there was no "steady week-over-week growth."
  - The entire "trend" is **one point** (Week 6). One point is not a trajectory.
  - "~95 next week / ~140 in a month" is **fabricated precision** from an unexplained spike.
* This is the module's central caution: **on small or short data, AI will manufacture a trend that isn't there — fluently.**

> The smoother and more specific the forecast, the more suspicious you should be on small
> data. Real analysis of six noisy points sounds *hesitant*. A confident straight-line
> projection is a red flag, not a finding.

---

## Validating a Trend Against the Source

* Never forward an AI trend you haven't checked against the numbers it came from. Four fast checks:
  - **Count the points.** How many data points is the claim built on? Five days or six weeks can't support "trending up." Say so out loud.
  - **Find the driver.** Ask "which specific rows drive this trend?" A trend that collapses to one outlier week is an *event*, not a trend.
  - **Re-add the numbers.** Ask it to show the values behind each claim and re-total one by hand. Growth rates and "top N" are where it slips.
  - **Kill the fake precision.** Any single-number forecast → demand a range and the confidence. No confidence stated = don't use it.

```text
You said volume is "trending up ~15% per week." Before I use that:
1. List the exact weekly numbers you based it on.
2. Show the week-over-week change for each. Which weeks actually rose?
3. If the trend depends on one week, say so and revise the claim.
```

* On the six-week series this immediately exposes it: five flat weeks + one spike. The "15% per week" evaporates, and you've caught it **before** the slide, not after leadership acted on it.

> This validation step is the deliverable of the lab. Generating an insight is easy; the
> professional skill is **catching the one that's over-claimed.**

---

## Part 5 — Decision Support vs. Decision-Making

> This is the most important slide in the module. AI can *support* a decision. It must not
> *make* one that carries consequence. Know exactly where the line sits.

---

## Where the Human Stays in Charge

* **Decision support** — AI does the reading and the first-draft thinking:
  - Summarize the options, surface the tradeoffs, extract the relevant facts, draft a recommendation **with its evidence.**
  - Fast, tireless, great at volume. This is where all of today's value lives.
* **Decision-making** — committing to a course of action with real consequences:
  - Approving spend, hiring/firing, pricing, denying a claim, sending to a customer, anything legal, medical, or compliance.
  - This stays with a **named human** who can be accountable for it.

```text
      AI does this (support)                 Human does this (decide)
  ------------------------------          ------------------------------
  Read everything, fast                    Weigh values and context
  Draft the recommendation                 Approve / reject / adjust
  Show the evidence for it                 Own the outcome
  Flag what it's unsure about              Take accountability
```

* The test isn't "is the AI smart enough?" It's **"is the action reversible and low-stakes?"** Reversible and low-stakes → AI can draft and even act with a light check. Irreversible or high-stakes → human decides, every time.

> Keep AI on the *left* column. The moment its output becomes an action with consequences,
> a person's name goes on it. That's not a limitation of the tech — it's the design.

---

## Why the Line Matters — Three Traps

* **Automation bias.** A confident, well-formatted recommendation feels *decided*. People rubber-stamp it. The fix: make AI show evidence, and read the evidence, not just the conclusion.
* **Laundered accountability.** "The AI recommended it" is not a defense — to a regulator, a customer, or your boss. Someone still owns the call. Name them **before** you act.
* **The invented-trend decision.** The exact failure from Part 4: a fabricated trend drives a real staffing or budget decision. The validation step is what stops it.

> The higher the consequence, the more explicit the human checkpoint must be. Low-stakes and
> reversible: let it run with a glance. High-stakes or irreversible: AI advises, human
> decides, human signs.

---

## Putting It Together

* Every technique in this module is the same discipline aimed at a different job:
  - **Summarize / extract** — name the reader, show the quotes, flag missing fields.
  - **Compare / classify** — material changes only, closed buckets, route what needs review.
  - **Analyze data** — sanity-check first, patterns and outliers, verify any number that ships.
  - **Trend / forecast** — count the points, find the driver, demand a range, validate against the source.
  - **Decide** — AI supports, a named human decides anything consequential.
* The thread through all of it: **ground the AI in your source, make it show the evidence, and stay the decision-maker.**

> Do that and you hand AI your reports, data, and dashboards with confidence instead of hope —
> and you never present a trend you didn't check.

---

## Lab 05 - Decisions & Insights

**Stop here and run Lab 05.**

You will:

1. **Summarize and extract** from the sample meeting notes — evidence first, with a source-quote column.
2. Run an **AI data analysis** over `sample-support-requests.csv` — sanity pass, patterns, an outlier, a recommended chart.
3. **Generate a trend insight** from a sample time series and ask for a forecast as a range.
4. **Validate it against the source** — catch the over-claimed trend built on one outlier before it reaches a slide.
5. Identify a **reporting or analysis task** AI could accelerate in your own work this quarter.

**Deliverable:** your evidence-based extraction, the data-analysis result, your trend-and-forecast output, and the validation that caught (or corrected) an over-claimed trend — plus one sentence on where AI supported the analysis and where a human still decides.
