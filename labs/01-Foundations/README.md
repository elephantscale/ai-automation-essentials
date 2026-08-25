# Lab 01 - AI vs. Rules-Based Routing

## Goal

Run the **same task** — routing incoming support requests to the right queue — two ways:
once with a **rules-based** approach (keyword matching) and once with an **AI assistant**
that reads meaning. Then compare them row by row and identify **where each approach wins**.
By the end you'll be able to say, out loud and with evidence, when to reach for rules, when
to reach for AI, and why the best workflows combine both.

> **This is the first lab of the course — do it together.** See the instructor note under
> *Instructor Flow*: run this one as a guided, screen-shared walkthrough with the whole
> class, not as independent work. It sets the pattern for every lab that follows.

## Time

45-60 minutes

## Tools

- An approved **AI assistant** — Claude, ChatGPT, or Gemini (whichever your instructor
  selects). No personal accounts if class access is provided.
- No automation platform is needed for this lab. You will act as the "rules engine"
  yourself, by hand, so you can feel exactly what a rules-based approach does and doesn't do.

> **Tool-flexible.** Every prompt below works the same in Claude, ChatGPT, or Gemini — only
> the buttons differ. Pick the one that's approved for your class and stay in it.

## Sample assets

- `labs/assets/sample-support-requests.csv` — five customer support requests (the input for
  both approaches). Open it now; you'll route these five rows twice.

## Steps

1. Open `labs/assets/sample-support-requests.csv` and read the five requests.
2. **Rules-based pass:** apply the keyword rules (below) to each request by hand, and record
   where each one lands.
3. **AI pass:** paste the AI routing prompt (below) into your assistant with the five
   requests, and record where each one lands.
4. Compare the two passes **row by row**. For each row, note which approach got it right and
   why.
5. Write one or two sentences: how would you **combine** rules and AI into a single safe
   workflow for this task?

## Prompt Starter

Paste this into your assistant, then paste the five CSV rows underneath it. (It's a
multi-line prompt: type it with **Shift+Enter** for new lines and **Enter** to send — or
just paste the whole thing at once.)

```text
You are a support-triage assistant. Read each incoming support request and route it.

For EACH request, return a row with these fields:
- id
- category: one of [billing, technical, account, sales, other]
- priority: one of [urgent, normal, low]
- summary: one short sentence
- human_review_required: "yes" or "no"

Rules:
- Set human_review_required to "yes" if the request involves sensitive data
  (patient records, financial data, passwords) OR contains more than one distinct ask
  OR is unclear.
- Do not invent names, numbers, or facts not present in the request.

Return the result as a Markdown table, one row per request.
```

> **Where do I put my answers?** You don't need a spreadsheet or any other app. Capture
> everything **right in your assistant** — ask it to keep a running table, or type your notes
> into the message box as a scratchpad (you don't even have to send them). The same trick
> works for every lab that mentions a worksheet.

## Deliverable

- Your **rules-based** routing result for all five requests (a small table).
- Your **AI** routing result for all five requests (the assistant's table).
- A short **comparison** naming at least one row where **rules won** and at least one where
  **AI won**.
- One or two sentences on how you'd **combine** the two approaches into one safe workflow.

## Review

- Confirm no confidential data was used — the sample requests are fictional, so you're safe.
- Confirm the AI's row 2 (Northstar Health, patient records) came back
  `human_review_required: "yes"`. If it didn't, the prompt needs the sensitive-data rule.

## Instructor Flow

> **Instructor note — run Lab 01 as a guided, whole-class walkthrough.** This is the first
> lab. Share your screen and do every step live, with the class following along on their own
> machines one beat behind you. Do **not** turn students loose to work independently yet.
> Lesson learned across many deliveries: non-technical students calibrate best when the first
> lab is done together — they see the pace, the copy-paste rhythm, and what a "good" result
> looks like before they're asked to work solo. From Lab 02 on, you can loosen the reins.

1. Open the CSV on the projector. Read the five requests aloud. Ask: "If a dumb keyword
   filter routed these, which ones would it get wrong?"
2. Do the **rules-based pass together** on screen — apply the keyword rules row by row and
   fill in a table. Let the class watch three of the five fall through to "General."
3. Do the **AI pass together** — paste the prompt, paste the rows, read the result aloud.
4. Compare row by row. Land the point: rules won row 2, AI won rows 1, 3, 4, 5.
5. Ask each student to write the one-sentence "how would you combine them" answer, then share
   two or three around the room.

Recommended timing:

| Activity | Minutes |
|----------|---------|
| Read the CSV, frame the task | 5 |
| Rules-based pass (together) | 10 |
| AI pass (together) | 10 |
| Row-by-row comparison | 10 |
| "How would you combine them?" + share | 10 |
| Debrief | 5 |

## Detailed Exercise

### Part 1 - Read The Requests

Open `labs/assets/sample-support-requests.csv`. Five requests, one per row:

```text
1  Acme Logistics    "set up an AI assistant to summarize weekly operations reports"
2  Northstar Health  "can our team upload patient records into a public AI tool?"
3  River City Events "draft a sponsor follow-up email AND create an event image"
4  Metro Finance     "spreadsheet has missing dates and duplicate categories; need a summary"
5  Summit Retail     "build a workflow that classifies store issues and routes urgent ones"
```

Notice these aren't clean: none of them say "billing" or "technical." That's the point —
real requests rarely contain the exact keyword a filter looks for.

### Part 2 - The Rules-Based Pass

You are the rules engine. Apply these keyword rules to each request, **exactly as written**
— no interpreting, no "well, they clearly mean." A rule only fires if the literal word is
present:

```text
IF request contains "invoice" OR "payment" OR "charge"  → Billing
IF request contains "error" OR "crash" OR "down"        → Technical
IF request contains "patient" OR "records" OR "HIPAA"   → Compliance (flag for review)
ELSE                                                     → General
```

Fill in a table (type it into your assistant's message box, or keep it on paper):

| id | customer | keyword hit? | rules route |
|----|----------|--------------|-------------|
| 1 | Acme Logistics | | |
| 2 | Northstar Health | | |
| 3 | River City Events | | |
| 4 | Metro Finance | | |
| 5 | Summit Retail | | |

You should find that **only row 2 matches a keyword** ("patient", "records"). Rows 1, 3, 4,
and 5 all fall through to **General** — the rules engine is blind to what they actually want.

### Part 3 - The AI Pass

Open a fresh chat in your assistant. Paste the **Prompt Starter** from above, then under it
paste the five rows from the CSV (open the file and copy them, or type them). Send it.

The assistant reads each request's **meaning** and returns a table with category, priority,
summary, and the review flag. Capture its table as your AI-pass result.

Check one thing specifically: **did row 2 come back with `human_review_required: "yes"`?**
It should — the prompt told the AI to flag sensitive data, and patient records qualify.

### Part 4 - Compare, Row By Row

Put the two results side by side and fill in the last column:

| id | rules route | AI route | who got it right? |
|----|-------------|----------|-------------------|
| 1 | General | ? | |
| 2 | Compliance | ? | |
| 3 | General | ? | |
| 4 | General | ? | |
| 5 | General | ? | |

For each row, write one phrase saying *why*. You're looking for the pattern:

- **Rules won row 2** — the keyword "patient records" is an exact, reliable, auditable
  trigger. For a compliance-sensitive case, deterministic beats clever.
- **AI won rows 1, 3, 4, 5** — no keyword matched, but the AI understood intent and routed
  each correctly, and it flagged row 3 (two asks) as needing review on its own.

### Part 5 - How Would You Combine Them?

Write one or two sentences answering: **for this routing task, how would you use both?**

A strong answer looks like: *"Run a rules check first for sensitive keywords (patient, SSN,
password) and send those straight to Compliance — deterministic and auditable. Everything
else goes to the AI to read intent and categorize, and then a rule routes urgent/flagged
items to a human review queue."*

That "rules for the hard edges, AI for the soft middle, rules again to keep AI on rails"
shape is exactly what you'll build in Module 4.

## Troubleshooting

- **The AI didn't flag row 2 for review.** Its prompt is missing or ignoring the
  sensitive-data rule. Re-paste the prompt with the `human_review_required` rule intact, or
  add: "patient records count as sensitive data — always set the flag to yes."
- **The AI put row 3 as high confidence / no review.** Remind it: "if a request contains more
  than one distinct ask, set human_review_required to yes." Row 3 has two asks (email + image).
- **The AI's output isn't a table.** Add "Return the result as a Markdown table" or re-send;
  the shape sometimes drifts on the first try.
- **The rules pass feels too dumb — you're tempted to "interpret."** Don't. The whole lesson
  is that rules can't interpret. Apply them literally and let the gaps show.
- **A student pastes real customer data.** Stop them — use only the fictional sample rows.
  Teachable moment for the safety habit, not a scolding.

## Completion Criteria

The lab is complete when the student has:

- A **rules-based** routing table for all five requests (with rows 1, 3, 4, 5 landing in
  General and row 2 in Compliance).
- An **AI** routing table for all five requests, with **row 2 flagged for human review**.
- A **row-by-row comparison** naming at least one row where rules won and one where AI won.
- One or two sentences on **how to combine** the two into a safe workflow.
- No confidential data anywhere.

---

## Teacher's Playbook

Everything below is for the instructor running this live. It gives you a fully worked model
answer with realistic AI output, an exact demo script, the mistakes students actually make,
and the debrief. You should be able to teach this cold from this section — and because it's
the first lab, you'll be driving the whole thing on the projector.

### The one idea to land

Every student should leave able to finish this sentence: *"For this task, rules win when
___ and AI wins when ___."* — and fill both blanks from the five rows they just ran. Rules
win when there's an **exact, high-stakes trigger word** (row 2, patient records). AI wins
when the request is **language-heavy and the keyword isn't there** (rows 1, 3, 4, 5). If
they leave thinking "AI is just better," the lab failed — the point is that they fail in
*opposite* directions, which is *why you combine them.*

### Worked model answer — the rules pass

Apply the keyword rules literally. This is the answer key:

```text
id  customer           keyword hit?                     rules route
1   Acme Logistics     none ("summarize", "reports")    General
2   Northstar Health   "patient", "records"             Compliance (flag)
3   River City Events  none ("sponsor", "email", "image") General
4   Metro Finance      none ("spreadsheet", "dates")    General   (note: "categories" ≠ keyword)
5   Summit Retail      none ("classifies", "issues")    General
```

Say it out loud: **four of five fall through to General.** A keyword filter is blind to
meaning. It nailed the one case it was explicitly built for (row 2) and whiffed on the rest.

### Worked model answer — the AI pass (the exact prompt)

The paste-ready prompt is the **Prompt Starter** above. Paste it, then paste the five CSV
rows. Here is a realistic table the assistant returns — students' wording will differ, but
the **categories and the review flags should match**:

```text
| id | category  | priority | summary                                            | review? |
|----|-----------|----------|----------------------------------------------------|---------|
| 1  | technical | normal   | Wants help setting up an AI assistant to summarize |  no     |
|    |           |          | weekly operations reports.                         |         |
| 2  | account   | normal   | Asks whether patient records may be uploaded to a  |  YES    |
|    |           |          | public AI tool. (sensitive data)                   |         |
| 3  | other     | normal   | Wants both a sponsor follow-up email AND an event  |  YES    |
|    |           |          | image created. (two distinct asks)                 |         |
| 4  | technical | normal   | Needs a clean summary of a spreadsheet with missing|  no     |
|    |           |          | dates and duplicate categories.                    |         |
| 5  | sales     | normal   | Wants a workflow to classify store issues and route|  no     |
|    |           |          | urgent ones.                                        |         |
```

The teaching moment: **row 2 flags for review (sensitive data) and row 3 flags for review
(ambiguous, two asks)** — the AI caught both on its own. And every row got a *meaningful*
category, where the rules pass gave four of them "General." If a student's row 2 comes back
`review: no`, their prompt is broken — that's the single most important check in this lab.

### The comparison, resolved

```text
Row  Rules route   AI route            Who won & why
1    General       technical           AI — understood intent; no keyword existed
2    Compliance    account + REVIEW    RULES (tie-plus) — exact keyword, auditable,
                                       deterministic for a compliance case; AI also flagged it
3    General       other + REVIEW      AI — caught the ambiguity (two asks) a filter can't see
4    General       technical           AI — understood "clean up a messy spreadsheet"
5    General       sales               AI — understood "build a routing workflow"
```

Land it: rules won exactly where you'd want a deterministic, auditable trigger; AI won the
messy middle. **That's the argument for combining them,** which is Part 5 and the bridge to
Module 4.

### Live demo script (this whole lab is your demo)

Because it's the first lab, you drive; students mirror. Aim for ~40 minutes of doing.

1. **Frame it (3 min).** Open the CSV. "Same task — send each request to the right team —
   done two ways. Let's see where each way wins."
2. **Rules pass, live (10 min).** Put the four keyword rules on screen. Walk each row: "Does
   row 1 contain invoice, payment, charge, error, crash, down, patient, records, or HIPAA?
   No. → General." Do all five. Let the room feel four of them fall through. Ask: "Is the
   filter *wrong*? No — it's doing exactly what we told it. It just can't read."
3. **AI pass, live (10 min).** Open a fresh chat. Paste the prompt, narrating the rules
   ("here's the sensitive-data rule, here's the ambiguity rule"). Paste the five rows. Read
   the table aloud. **Stop on row 2**: "review = yes. The AI caught the patient records." Stop
   on row 3: "review = yes — it noticed there are two requests jammed together."
4. **Compare (10 min).** Build the who-won table together. Draw out the pattern in their own
   words before you state it.
5. **Combine (7 min).** "So which do we pick?" Guide them to *both* — sketch the
   rules→AI→rules pipeline on the board. Preview: "You'll build this exact shape in Module 4."

**No AI access in the room?** Run the whole thing on paper/projector: you play the AI, using
the worked table above as the answer key. The logic is identical; the assistant is a
convenience, not a requirement, for this lab.

### Common student mistakes and how to redirect

1. **Interpreting the rules instead of applying them literally.** A student routes row 1 to
   "Technical" in the rules pass because it's "obviously technical." Fix: "Does it contain the
   word? No? Then the filter can't see it. Apply the rule, don't be the AI yet." The gap is
   the whole lesson.
2. **Declaring AI the winner on every row.** Fix: point at row 2. "Would you rather a
   compliance case depend on a probabilistic model, or on an exact keyword you can audit?"
   Rules win where the stakes and the trigger are both crisp.
3. **AI row 2 comes back `review: no`.** Their prompt dropped the sensitive-data rule, or they
   paraphrased it away. Fix: re-paste the full prompt; show the flag fire. This is the proof
   the lab exists to produce.
4. **Skipping the messy rows.** They run row 1, it works, they stop. Fix: "Row 3 is where the
   interesting behavior is — it has two asks. Run it and watch the AI hedge." A method is
   judged on the hard inputs.
5. **Treating "combine them" as a throwaway.** Some write "use both." Fix: push for the
   *order* — what runs first, what the rule guards, where the human gate sits. That specificity
   is the Module 4 preview.
6. **Pasting real support tickets from their own job.** Fix: stop, switch to the sample rows.
   Reinforce the "approved data only" habit warmly, not as a reprimand.

### Debrief questions with model answers

Run these in the last five minutes with the whole room.

1. **"Which row did the rules engine get right, and why that one?"**
   *Model answer:* Row 2 — the literal words "patient" and "records" matched a rule. Rules win
   when the trigger is an exact, reliable word, especially for high-stakes/compliance cases you
   want auditable.

2. **"Why did four rows fall through to General under the rules?"**
   *Model answer:* None contained a keyword the filter looked for. Real requests rarely use the
   exact category word — that brittleness is the defining weakness of pure keyword rules.

3. **"The AI routed rows 1, 3, 4, 5 correctly with no keywords. How?"**
   *Model answer:* It reads *meaning*, not literal strings. It generalizes to phrasing it was
   never explicitly given — the defining strength of generative AI, and also why its output
   must be reviewed.

4. **"Rows 2 and 3 both got flagged for human review. Different reasons — what were they?"**
   *Model answer:* Row 2 = sensitive data (patient records). Row 3 = ambiguity (two distinct
   asks). Both are cases where you deliberately want a human, for different reasons.

5. **"Give me the one-line rule for when to use which."**
   *Model answer:* Rules for exact, high-stakes, must-be-auditable triggers; AI for messy,
   open-ended, language-heavy cases; rules again to route the AI's output safely. Combine, don't
   choose.

### What good looks like

A strong finished deliverable has all of these:

- A **rules table** showing four rows in General and row 2 in Compliance — i.e., the student
  applied the rules *literally* and let the gaps show, rather than quietly interpreting.
- An **AI table** with meaningful categories for all five and **row 2 flagged for review**
  (bonus: row 3 flagged too).
- A **row-by-row comparison** that names a specific winner and a *reason* per row — not a
  vague "AI was better."
- A **combine sentence** that specifies an order: rules-check first for sensitive keywords →
  AI for intent → rule routes urgent/flagged items to a human. Not just "use both."
- **No confidential data** anywhere.

Gold-standard tell: the student can state, unprompted, that rules and AI fail in *opposite*
directions — rules fail silently on unseen input, AI fails loudly with a confident wrong
answer — and that this is exactly why you pair them. If they land that, they're ready for
every automation lab to come.
