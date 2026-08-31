# Prompt Engineering for Automation

Elephant Scale

---

## Why This Module

* Prompts for people

* Prompts for automation

* Output shape matters

* The next reader may be a machine

> The prompt is the specification.

---

## Anatomy of a Strong Prompt — Six Parts

* Role
* Task
* Context
* Constraints
* Format
* Examples

```text
Role:        who the assistant is acting as   (a careful support-triage analyst)
Task:        what you want done               (the verb — classify, extract, draft)
Context:     background and audience           (who it's for, the business situation)
Constraints: the rules                         (length, tone, exclusions, the fallback)
Format:      the exact shape of the output     (table, five bullets, JSON fields)
Examples:    one or two demonstrations         (optional — show the pattern you want)
```

> When output disappoints: which part did you leave to chance?

---

## The Six Parts, One at a Time

* Role: lens
* Task: verb
* Context: situation
* Constraints: rules
* Format: output shape
* Examples: pattern

> For automation, format and constraints do the heavy lifting.

---

## Worked Example — Bad → Better → Best

* Same task, three prompts

**Bad** — everything left to chance:

```text
Summarize this.
```

**Better** — audience, output, length budget:

```text
Summarize the attached meeting notes for a non-technical operations manager.
Return exactly five bullets: goal, decisions made, action items with owners,
risks, and open questions. Keep it under 120 words.
```

**Best** — add a source boundary and a fallback:

```text
Use ONLY the information in the notes — do not add anything not written there.
If a section has no information, write "none noted." Mark anything ambiguous
"needs review."
```

---

## What "Best" Actually Returns

* Fixed shape
* Source-bound
* Fallbacks visible

```text
- Goal: Reduce time spent summarizing weekly status reports using an AI workflow pilot.
- Decisions: Start with internal sample data only; keep a human review step; revisit
  automation after the summary prompt is reliable.
- Action items: Jordan — provide 3 approved sample reports by July 25. Priya — draft the
  first executive-summary prompt template.
- Risks: Sam flagged uploading confidential client data to public AI tools; Elena advised
  using only the managed business workspace (needs review as a firm policy).
- Open questions: Which department owns long-term maintenance of the assistant?
```

---

## Prompt Parameters — The Dials Inside the Instruction

* Role
* Audience
* Format
* Length
* Tone
* Evidence
* Fallback

> Each dial removes a guess.

---

## Role-Based Prompts for Consistent, On-Brand Output

* Role
* Voice
* Boundaries
* Fallback
* Signature

```text
You are the customer-support voice for Northwind Software.
- Tone: warm, plain-language, never defensive. No jargon, no slang.
- Always thank the customer and name their specific issue.
- Never promise a refund, discount, or date unless it is stated in the reference material.
- If you can't answer from the reference material, say so and offer to route to a person.
- Sign every reply "— Northwind Support."
```

---

## Separate Your Instructions From Your Data

* Instructions
* Data
* Delimiters

```text
Summarize the customer review below in one sentence.
Review:
"""
The stand arrived a day early, feels sturdy, but the instructions
were confusing and one screw was missing.
"""
```

---

## Ask for Structured Output — The Heart of Automation

* Lists
* Tables
* JSON-like fields

```text
List three onboarding tasks for a new hire.
Return a table with columns: Task, Owner, Due (relative to start date).
```

---

## Structured Output — Make It Machine-Readable

* Name every field
* Pin values to a closed list
* Return only the structure

```text
Return ONLY a JSON object with exactly these keys:
{
  "category":   one of ["billing", "technical", "account", "sales", "other"],
  "priority":   one of ["urgent", "normal", "low"],
  "summary":    one sentence, max 20 words,
  "confidence": one of ["high", "medium", "low"]
}
Do not add any text before or after the JSON.
```

---

## Say What to Do When the Assumption Fails

* Missing data
* Multiple asks
* Low confidence
* Human review

```text
Extract the delivery date. If no date is stated, write "not specified" —
do not estimate one.
```

```text
If the request contains more than one distinct ask, set "confidence" to "low"
and "human_review_required" to "yes".
```

---

## Show It an Example or Two (Few-Shot)

* Show the pattern
* Lock in tone
* Lock in format
* Cover edge cases

```text
Classify each support message as: Billing, Technical, or Other.

Message: "My card was charged twice." -> Billing
Message: "The app crashes on login." -> Technical
Message: "Do you have an office in Denver?" ->
```

---

## Grounding — Answers From the Source, Not the Guess

* Use only this source
* Quote the evidence
* Say when it is missing

```text
Answer the customer's question using ONLY the help-center document below.
- Quote the sentence you used.
- If the answer is not in the document, reply exactly:
  "I don't know — let me route you to a person."
Do not use any outside knowledge.

Help center:
"""
[paste labs/assets/sample-help-center.md]
"""

Question: "Can I get a refund on an annual plan I bought last week?"
```

---

## Advanced Prompting — Chains and Multi-Step Tasks

* One job per step
* Structured hand-offs
* Easier testing
* Easier repair

```text
   raw item ─▶ [ STEP 1: extract ] ─▶ fields
                                        │
              [ STEP 2: classify ] ◀────┘ ─▶ labels
                                             │
              [ STEP 3: draft reply ] ◀──────┘ ─▶ ready-to-review draft
```

---

## Designing the Hand-Offs

* Output contracts
* Fallback values
* Human gate
* Map before prompting

```text
| # | Step          | Input            | Output (be exact)                       |
|---|---------------|------------------|-----------------------------------------|
| 1 | Extract fields| the raw request  | JSON: {customer, product, issue, dates} |
| 2 | Classify      | step-1 JSON      | JSON: {category, priority, review_flag} |
| 3 | Draft reply   | steps 1–2 JSON   | a 3-sentence email, no send             |
```

---

## Worked Chain — Support Request → Structured Draft

* Input
* Step 1: extract

**Input**

```text
Northstar Health: "Can someone explain whether our team can upload patient
records into a public AI tool?"
```

**Step 1 — Extract**

```text
{
  "customer": "Northstar Health",
  "product": "not specified",
  "issue": "asking whether patient records can go into a public AI tool",
  "dates": "not specified"
}
```

---

## Worked Chain — Steps 2 and 3

* Step 2: classify
* Step 3: draft

**Step 2 — Classify**

```text
{
  "category": "account",
  "priority": "normal",
  "sensitive_data": "yes",          <- patient records detected
  "confidence": "medium",
  "human_review_required": "yes"    <- follows from sensitive_data
}
```

**Step 3 — Draft**

```text
"Thanks for checking before uploading anything. Patient records are sensitive,
so they shouldn't go into a public AI tool — let me connect you with our security
team to confirm an approved, compliant option. — Northwind Support"

route: Review queue   (because human_review_required = "yes")
```

---

## Give the Model Time to Think — Spell Out the Steps

* Extract first
* Identify owners
* Then summarize

```text
Do this in order:
1. Extract every action item from the notes below.
2. For each, identify the owner (or "unassigned").
3. Then, and only then, write a two-line summary for a manager.
```

---

## Let It Solve Before It Judges

* Solve independently
* Then compare
* Then flag differences

```text
Here is a proposed project timeline. Do NOT comment on it yet.
First, work out your own realistic timeline from the task list below.
Then compare the two and flag any place the proposal looks optimistic.
```

---

## Five Jobs Prompts Do Every Day

* Summarize
* Extract
* Infer
* Transform
* Expand

> Extract and infer drive automation.

---

## Infer — Structured Meaning in One Call

* Sentiment
* Emotion
* Entities
* Topics

```text
For the customer review below, return labeled fields:
- sentiment:  positive / negative / mixed
- emotion:    the single strongest one
- entities:   any product and company names mentioned
- topics:     three short labels
```

---

## Expand — Keep the Human in the Loop

* Draft the message
* Use the source details
* Human approves

```text
Write a reply to the customer email below.
- Thank them by name.
- Acknowledge their specific complaint (use details from THEIR email).
- Offer the resolution in the notes.
- Warm, professional, under 120 words. Sign as "Northwind Support."
```

---

## Set the Role Once — the "System" Instruction

* Standing role
* Standing constraints
* Project instructions

```text
You are a concise operations analyst. Always answer in at most five bullets.
If a request needs data you don't have, ask for it instead of guessing.
```

---

## Turn a Recurring Task Into a Reusable, Parameterized Prompt

* Named slots
* Reusable template
* Team asset

```text
You are the {{brand}} support voice. Draft a reply to the message below.
- Use ONLY the reference material in {{help_center}}.
- Tone: {{tone}}. Length: under {{word_limit}} words. Sign "— {{brand}} Support."
- If the answer isn't in the reference material, say so and route to a person.

Message:
"""
{{incoming_message}}
"""
```

---

## Prompt-for-Automation — Cheat Sheet

* Six parts
* Delimit data
* Structure output
* Pin values
* Name fallbacks
* Chain steps
* Ground in sources
* Parameterize repeats

> These are the building blocks for the lab.

---

## Live Prompt Writing and Feedback

* Find the missing part
* Add one fix
* Re-run
* Name what changed
* Ask what the next step needs

> Diagnose, fix one thing, re-run.

---

## Lab 02 - Build a Multi-Step Prompt Chain

**Stop here and run Lab 02.**

You will:

1. Design a three-step chain: extract → classify → draft.
2. Make each step return structured output.
3. Add fallbacks and a human review gate.
4. Run the sample requests.
5. Save the reusable prompt chain.

**Deliverable:** chain design, three prompts, sample outputs, and the review flag.
