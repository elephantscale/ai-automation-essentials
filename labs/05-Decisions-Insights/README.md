# Lab 05 - File Analysis, Dashboard Reading & Executive Briefs

## Goal

Use ChatGPT Enterprise as an analyst, not a decision-maker. You will upload sample business
files, extract evidence from meeting notes, clean a messy CSV, read a dashboard image, validate
a trend claim, and assemble a short executive brief with source-backed findings.

This lab now makes file analysis mandatory because every student has ChatGPT Enterprise in the
VM. No spreadsheet formulas, code editor, Google Drive, or external connector is required.

## Time

90 minutes

## Tools

- ChatGPT Enterprise with file upload/data analysis
- Course files in `labs/assets/`
- `course-materials/document-analysis-checklist.md`
- `course-materials/executive-brief-template.md`

If upload is unavailable, paste text/CSV content into the chat. For the dashboard image, the
instructor can project the image and run that part as a demo.

## Sample Assets

- `sample-meeting-notes.md` - action-item extraction
- `sample-support-requests.csv` - small dataset analysis
- `sample-vendor-invoices.csv` - messy data cleanup
- `sample-dashboard.png` - image-to-numbers test

## Steps

1. Upload the sample files into your ChatGPT Project or fresh chat.
2. Extract action items from the meeting notes with source quotes.
3. Analyze the support CSV with a sanity pass and row-backed counts.
4. Clean the vendor invoice CSV and flag data-quality problems.
5. Read the dashboard image and compare its numbers against the CSV.
6. Generate and validate a trend/forecast from the 6-week series.
7. Write a one-page executive brief using the template.

## Prompt Starter

Use this pattern for every factual file task:

```text
Use only the source files I provide. Work in steps and show evidence.

Step 1: Identify which source file(s) you used.
Step 2: Extract the relevant facts with row numbers, section names, or source quotes.
Step 3: Analyze only from those facts.
Step 4: List anything that needs human review or verification.

Do not invent missing values, trends, dates, names, or policies.
```

## Detailed Exercise

### Part 1 - Evidence Extraction From Meeting Notes

Upload or paste `sample-meeting-notes.md`, then run:

```text
Use only the meeting notes I provided. Extract every action item.
Return a Markdown table with columns:
- Action
- Owner
- Due date
- Source quote
- Confidence: high / medium / low

If an owner or due date is not stated, write "not specified" and do not guess.
After the table, list any open question that has no owner.
```

Then ask:

```text
Using only the notes, answer in two steps.
Step 1 - Evidence: quote the exact lines that relate to this question.
Step 2 - Answer: answer using only those quotes. If they do not fully answer it, say so.

Question: Does the pilot allow uploading confidential client data?
```

### Part 2 - Support CSV Analysis

Upload or paste `sample-support-requests.csv`, then run:

```text
A CSV is attached. Before analyzing, do a quick sanity pass:
- How many rows and columns?
- What does each column appear to be?
- Are there missing values, duplicates, or inconsistent formats?

Then give me:
1. The 3 most useful patterns or groupings
2. Any outlier or row that looks unusual, with the row ID
3. One chart you would recommend to a manager and exactly which columns it uses

Work from the data only. If it is too small to be confident, say so.
```

Verification prompt:

```text
Show me the rows behind each count or category you used. Do not summarize; list the row IDs.
```

### Part 3 - Clean The Vendor Invoice CSV

Upload `sample-vendor-invoices.csv`, then run:

```text
The attached CSV is a messy vendor-invoice export. Clean it and summarize it.
Do not change my source; work from a cleaned copy.

1. Standardize category names. Merge "IT" / "I.T." / "Information Technology" and
   "Office Supplies" / "Supplies". List every merge you made.
2. Normalize amounts to plain numbers and dates to YYYY-MM-DD.
3. Flag any row where the date or amount is missing or unparseable. Do not invent values.
4. Flag likely duplicate rows: same vendor, amount, and date.
5. Give total spend by cleaned category, highest first.
6. List every data-quality issue you found, including credits and format problems.

Show assumptions and row IDs.
```

Expected checks:

- Category variants are merged.
- `INV-1019` is flagged as a likely duplicate of `INV-1001`.
- The `-$120.00` credit is identified.
- Missing or malformed dates/amounts are reported, not filled with guesses.

### Part 4 - Read The Dashboard Image

Upload `sample-dashboard.png`, then run:

```text
The attached image is a weekly dashboard. Read the numbers off it and return:
- Every headline metric with its value
- What each chart shows, including the value of each bar
- One sentence a manager could read aloud as the week's takeaway

Only report numbers you can actually see. If a value is unclear, say "unclear" and do not
estimate.
```

Compare the image read against the support CSV. Expected values:

- Total requests: 5
- Compliance flags: 1
- Channels: 2
- Web: 3
- Email: 2
- Themes: Build/automate 2, Content drafting 1, Data cleanup 1, Policy/compliance 1

If the image answer conflicts with the CSV, trust the source data and note the mismatch.

### Part 5 - Trend And Forecast Validation

Paste this data:

```text
Weekly support-ticket volume:
Week 1: 40
Week 2: 44
Week 3: 41
Week 4: 45
Week 5: 43
Week 6: 78
```

Ask:

```text
Using only the weekly numbers above, do this in order:
1. Describe the trend you see, citing the actual weekly numbers.
2. Give a one-week-ahead forecast as a range, not a single number.
3. State assumptions and confidence.
If the data is too short or too noisy to be reliable, say so plainly.
```

Then validate:

```text
Before I use your trend, validate it against the numbers:
1. List the exact weekly values.
2. Show the week-over-week change for each week.
3. How many data points is this built on? Is that enough to claim a trend?
4. If the trend depends mostly on one week, revise the claim in one sentence.
```

Expected result: Weeks 1-5 are mostly flat; Week 6 is a spike; six data points do not support a
confident trend. A range with low confidence is appropriate.

### Part 6 - Executive Brief

Open `course-materials/executive-brief-template.md`. Ask ChatGPT to draft a brief from your
validated outputs:

```text
Create a one-page executive brief using the template below.
Use only the analyses we have already completed in this chat.
Every finding must include evidence from a file, row ID, source quote, or the weekly values.
Separate "what the AI supported" from "what a human must decide."
Do not add recommendations that are not supported by the sources.
```

The human decision for this lab is not "hire another support agent." It is:

```text
Should we investigate what caused the Week 6 spike before changing staffing or budget?
```

## Deliverable

- Action-item table from meeting notes with source quotes.
- Support CSV sanity pass, patterns, outlier, and row-backed verification.
- Vendor invoice cleanup summary with data-quality flags.
- Dashboard image reading and CSV cross-check.
- Trend forecast and validation/correction.
- One-page executive brief.
- Completed document/data checklist.

## Review

Use `course-materials/document-analysis-checklist.md`. The strongest work is not the most
polished prose. It is the work where every number can be traced, every missing value is visible,
and uncertainty is stated before a decision is made.

## Troubleshooting

- **ChatGPT says it cannot access a file.** Upload again or paste the file content.
- **It invents an owner/date/amount.** Re-run with "write not specified; do not guess."
- **It gives counts without evidence.** Ask for row IDs behind every count.
- **The dashboard image is misread.** Compare to the CSV and record the mismatch.
- **The forecast sounds too confident.** Force the week-over-week validation.
- **The brief adds unsupported recommendations.** Ask it to remove any claim without evidence.

## Completion Criteria

The lab is complete when the student has:

- Used at least three uploaded/pasted files.
- Verified at least one count against source rows.
- Found and reported messy-data issues in the vendor CSV.
- Compared a dashboard image read to source data.
- Corrected or confirmed a trend claim.
- Produced a source-backed executive brief with a human decision named.

---

## Teacher's Playbook

This is the best lab for showing why ChatGPT Enterprise matters in the VM. Students are not just
chatting; they are using file upload, data analysis, image understanding, source grounding, and
structured executive communication.

Recommended timing:

| Activity | Minutes |
|----------|---------|
| Upload files and extraction demo | 15 |
| Support CSV analysis + verification | 15 |
| Vendor invoice cleanup | 20 |
| Dashboard image read + cross-check | 10 |
| Trend validation | 15 |
| Executive brief | 10 |
| Debrief | 5 |

Model debrief points:

- File analysis is powerful because it handles the messy work, not because it removes review.
- Row IDs and source quotes are the audit trail.
- Image reading is useful but lower trust than the underlying data.
- A forecast range with low confidence is a good result on small data.
- The executive brief should make the human decision clearer, not pretend the AI made it.
