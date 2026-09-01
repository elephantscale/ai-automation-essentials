# File Analysis, Dashboard Reading & Executive Briefs

Elephant Scale

---

## Why This Module

* Reports
* Transcripts
* Spreadsheets
* Dashboards
* Decisions

> AI is your analyst, not your decision-maker.

---

## The Working Rule

* Work from the source
* Show the evidence
* Flag uncertainty
* Verify numbers
* Keep the human decision

> Every claim needs a receipt.

---

## Four Document Jobs

* Summarize
* Extract
* Compare
* Classify

```text
Summarize  → short version for a reader
Extract    → fields, rows, dates, owners
Compare    → material changes
Classify   → buckets from a closed list
```

> Different verbs need different prompts.

---

## Summarize With a Purpose

* Length
* Audience
* Focus
* Exclusions
* Source boundary

```text
Summarize the meeting notes for a busy executive sponsor.
Return:
- one-sentence status: on track / at risk / blocked
- 3 decisions made
- open questions that need a manager
Under 100 words. Use only the notes.
```

> Same document, different reader, different summary.

---

## Transcripts Are Messy Documents

* Filler
* Crosstalk
* Repetition
* Half-finished thoughts
* Missing owners

```text
Ignore filler, small talk, and repetition.
Return:
- Decisions made
- Action items: Owner | Action | Due date
- Open questions with no owner
Use only the transcript. Write "not stated" when missing.
```

> The value is cutting noise while keeping decisions.

---

## Extract, Don't Summarize

* Action items
* Dates
* Owners
* Amounts
* Obligations
* Source quote

```text
Extract every action item.
Return a table:
Action | Owner | Due date | Source quote | Confidence
If owner or date is missing, write "not specified" — do not guess.
```

> Extraction turns text into rows.

---

## Worked Example — Meeting Notes

* Source: `labs/assets/sample-meeting-notes.md`

```text
| Action                            | Owner  | Due date       | Confidence |
|-----------------------------------|--------|----------------|------------|
| Provide 3 approved sample reports | Jordan | Jul 25         | high       |
| Draft first prompt template       | Priya  | not specified  | high       |
| Use only managed workspace        | Elena  | not specified  | medium     |
```

* Open question: maintenance owner

> The missing owner may be the most important finding.

---

## Extract Then Answer

* Evidence first
* Answer second
* Missing data visible
* Faster verification

```text
Step 1 — Evidence:
List exact quotes related to my question. Do not interpret yet.

Step 2 — Answer:
Answer using only those quotes. If they do not fully answer it, say what is missing.
```

> Make the model show its work before it concludes.

---

## Comparing Documents

* Ignore formatting
* Focus on material changes
* Sort by risk
* Flag human review

```text
Compare Document A and Document B.
Ignore wording-only changes.
Return: What changed | Category | Why it matters | Needs human review?
Focus on money, dates, obligations, risk, and scope.
```

> Compare what matters, not every comma.

---

## Classifying the Pile

* Closed buckets
* One primary category
* Short reason
* No invented labels

```text
Classify each request into exactly one:
Build/automate, Content drafting, Data cleanup, Policy/compliance, Other.

Return: id | customer | category | reason
Use only these five categories.
```

> Closed lists make classification reusable.

---

## Analyzing Data, No Formulas

* Sanity pass
* Patterns
* Outliers
* Recommended chart
* Caveats

```text
Before analyzing, tell me:
- row and column count
- what each column appears to be
- missing values, duplicates, inconsistent formats

Then give patterns, outliers, and one useful chart.
Work from the data only.
```

> A bad dataset makes bad insights sound polished.

---

## Worked Example — Support CSV

* Source: `labs/assets/sample-support-requests.csv`

```text
Rows: 5
Channels: web 3, email 2
Themes: build/automate 2, drafting 1, cleanup 1, compliance 1
Flag: Northstar asks about patient records in a public AI tool
Caveat: sample is too small for trend claims
```

> Count first. Interpret second.

---

## Clean a Messy CSV

* Standardize categories
* Normalize dates
* Normalize amounts
* Flag duplicates
* Preserve source
* Report assumptions

```text
Clean a copy of the CSV. Do not change the source.
Merge category variants. Normalize dates to YYYY-MM-DD.
Flag missing or unparseable amounts; do not invent values.
List duplicate-looking rows.
```

> Cleaning is useful only when the gaps stay visible.

---

## Read a Dashboard Image

* Headline metrics
* Chart values
* Visible numbers only
* Unclear when unclear
* Cross-check source data

```text
Read the dashboard image.
Return every visible metric and chart value.
If a number is unclear, write "unclear" — do not estimate.
Then give one manager-ready takeaway.
```

> Image reading is convenient and fallible.

---

## Dashboard Cross-Check

* Source: `labs/assets/sample-dashboard.png`

```text
Total requests: 5
Compliance flags: 1
Channels: 2
By channel: web 3, email 2
By theme: Build/automate 2, Content drafting 1, Data cleanup 1, Policy/compliance 1
```

> Any number that goes in a deck gets checked against the source.

---

## Trend & Forecast Assistance

* Describe first
* Forecast second
* Use a range
* State assumptions
* State confidence

```text
Describe the trend, citing weekly numbers.
Give a one-week forecast as a range, not a single number.
State assumptions and confidence.
If the data is too short, say so.
```

> Small data needs humility.

---

## Worked Trend Example

```text
Week 1: 40
Week 2: 44
Week 3: 41
Week 4: 45
Week 5: 43
Week 6: 78
```

* Weeks 1-5 are flat
* Week 6 is a spike
* Forecast: 45-80, low confidence
* Check what happened in Week 6

> One spike is an event, not a trend.

---

## How AI Invents Trends

* Finds patterns in noise
* Smooths over outliers
* Overstates confidence
* Creates fake precision

```text
Bad claim:
"Volume is growing steadily. Expect 95 next week and 140 within a month."
```

> The smoother the forecast on tiny data, the more suspicious you should be.

---

## Validate the Trend

* Count the points
* Find the driver
* Re-add the numbers
* Demand a range
* Check confidence

```text
List the weekly numbers behind the claim.
Show week-over-week change.
If the trend depends on one week, say so and revise.
```

> Generating an insight is easy. Validating it is the professional skill.

---

## Decision Support vs. Decision-Making

```text
AI supports                         Human decides
--------------------------------   -----------------------------
Reads everything fast              Weighs context and values
Drafts the recommendation          Approves, rejects, or adjusts
Shows evidence                     Owns the outcome
Flags uncertainty                  Takes accountability
```

> Keep AI on the support side for consequential decisions.

---

## Where the Human Stays in Charge

* Spend approval
* Hiring or firing
* Pricing
* Legal claims
* Medical advice
* Customer-facing commitments
* Irreversible actions

> The higher the consequence, the clearer the human checkpoint.

---

## Executive Briefs

* Sources used
* Key findings
* Evidence
* Risks and caveats
* Recommended next actions
* Human decision needed

```text
Create a one-page executive brief using only the analyses in this chat.
Every finding must include evidence from a file, row ID, quote, or weekly value.
Separate what AI supported from what a human must decide.
```

> A good brief is shorter and more accountable.

---

## File Analysis — Cheat Sheet

* Name the reader
* Extract fields when you need rows
* Ask for source quotes
* Sanity-check data first
* Cross-check image numbers
* Validate trends
* Keep the decision human

> Work from the source. Show the receipts.

---

## Lab 05 - File Analysis, Dashboard Reading & Executive Briefs

**Stop here and run Lab 05.**

You will:

1. Extract from sample meeting notes with source quotes.
2. Analyze `sample-support-requests.csv`.
3. Clean `sample-vendor-invoices.csv`.
4. Read `sample-dashboard.png` and cross-check the numbers.
5. Generate and validate a trend insight.
6. Produce a source-backed executive brief.

**Deliverable:** extraction table, support analysis, vendor cleanup, dashboard cross-check,
trend validation, executive brief, and one sentence naming what AI supported versus what a
human still decides.

**Time:** ~45-60 min.
