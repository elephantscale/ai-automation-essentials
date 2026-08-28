# Prompt Engineering for Automation

Elephant Scale

---

## Why This Module

* A prompt that impresses you in a chat window is not the same as a prompt an **automation** can trust.
  * A person reads a paragraph and fills the gaps. A downstream step can't — it needs the same shape, every time.
  * "Prompt engineering for automation" = writing prompts whose **output another step can act on**, unattended.

* By the end of this module you will be able to:
  - Build a **strong prompt** from six named parts — and diagnose a weak one by the part it's missing.
  - Pin a **role and constraints** so output is consistent and on-brand across a hundred runs.
  - Chain prompts into a **multi-step task**, where each step's output feeds the next.
  - Produce **structured output** (lists, tables, JSON-like fields) a downstream tool can consume.
  - **Ground** answers in reference material so they're sourced, not guessed.

> The prompt is the specification. In this course the "next reader" is often a machine —
> so the output has to be predictable enough for a machine to branch on. That's the whole
> shift from Day-1 prompting to prompting for automation.

---

## Anatomy of a Strong Prompt — Six Parts

* A **prompt** = the instruction plus everything the assistant needs to do the job.
* Prompts fail when a part is left out and the model fills the gap with a **guess**.

```text
Role:        who the assistant is acting as   (a careful support-triage analyst)
Task:        what you want done               (the verb — classify, extract, draft)
Context:     background and audience           (who it's for, the business situation)
Constraints: the rules                         (length, tone, exclusions, the fallback)
Format:      the exact shape of the output     (table, five bullets, JSON fields)
Examples:    one or two demonstrations         (optional — show the pattern you want)
```

* When an answer disappoints, ask: *which of the six did I leave to chance?*

> "Clear" ≠ "short." A prompt that spells out all six beats a terse one almost every time —
> and it's the six parts, named, that make a prompt **reusable** by someone (or something) else.

---

## The Six Parts, One at a Time

* **Role** — sets the lens. "You are a careful operations analyst" changes what it notices.
* **Task** — the single verb. One prompt, one job; jam three jobs in and quality drops.
* **Context** — audience, purpose, situation. "For our VP of Sales, who wants the decision, not the detail."
* **Constraints** — length, tone, what to exclude, and crucially the **fallback** for missing data.
* **Format** — the shape the *next* reader needs: bullets for a human, fields for a tool.
* **Examples** — when style or edge-cases are hard to describe, **show** one instead.

> For automation, **Format** and **Constraints** carry the most weight — they're what make the
> output machine-readable and stable run to run. We'll spend the module on those two.

---

## Worked Example — Bad → Better → Best

* Job: summarize `labs/assets/sample-meeting-notes.md` for a busy operations lead.

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

* Same model, same notes — "Best" is the difference between re-checking line by line and trusting at a glance.

---

## What "Best" Actually Returns

* Run the final prompt on the sample notes — every bullet traces to the source, nothing invented:

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

> Notice the shape is fixed and predictable. That predictability is what lets a later
> step — or a colleague — rely on it without re-reading the source.

---

## Prompt Parameters — The Dials Inside the Instruction

* Beyond the six parts, **dials** you turn with words. Each one removes a guess:
  - **Role** — "You are a careful operations analyst."
  - **Audience** — "for our VP of Sales," "for new hires."
  - **Format** — table, memo, checklist, email, slide outline, JSON.
  - **Length** — "at most 100 words," "exactly 5 bullets," "one page."
  - **Tone** — executive, plain-language, technical, warm, neutral.
  - **Evidence** — "quote the source line," "cite the row id."
  - **Fallback** — "if information is missing, list what's missing first."

> The tighter the output target, the easier the answer is to **judge** — and the easier it
> is for the next automation step to consume.

---

## Role-Based Prompts for Consistent, On-Brand Output

* A **role + constraints** turns a general assistant into a repeatable specialist.
* One line up top sets the standing behavior for everything that follows:

```text
You are the customer-support voice for Northwind Software.
- Tone: warm, plain-language, never defensive. No jargon, no slang.
- Always thank the customer and name their specific issue.
- Never promise a refund, discount, or date unless it is stated in the reference material.
- If you can't answer from the reference material, say so and offer to route to a person.
- Sign every reply "— Northwind Support."
```

* Now every draft sounds like the same well-trained rep — because the **brand rules live in the prompt**, not in each person's head.

> This is the no-code version of a "style guide the model obeys." Save it once; everyone who
> reuses it gets on-brand output. The third time you paste the same rules, make it a saved
> assistant (custom GPT / Project / Gem).

---

## Separate Your Instructions From Your Data

* The model can't always tell an *instruction* from *content*. Mark the boundary with delimiters:

```text
Summarize the customer review below in one sentence.
Review:
"""
The stand arrived a day early, feels sturdy, but the instructions
were confusing and one screw was missing.
"""
```

> This is also your first defense against **prompt injection**: fenced-off data means a rogue
> "ignore your instructions" line buried in a support email is just more text to summarize —
> not a command. Essential once real, untrusted content flows through an automation.

---

## Ask for Structured Output — The Heart of Automation

* A paragraph is for a person to read. **Structured output** is for the next step to *use*.
* If the answer will land in a sheet, a ticket, a routing rule, or another prompt — ask for a structure.

```text
List three onboarding tasks for a new hire.
Return a table with columns: Task, Owner, Due (relative to start date).
```

* Three common shapes, matched to what happens next:
  - **List** — one item per line, when the next step loops over items.
  - **Table** — rows and named columns, when a human or a sheet reviews them.
  - **JSON-like fields** — named keys with pinned values, when a **tool branches** on them.

> Design the output so the *next* step is easy. In automation, that's not a nicety — a
> free-form paragraph is exactly what breaks the step after it.

---

## Structured Output — Make It Machine-Readable

* Two rules turn "structured-ish" into "a tool can rely on it":
  - **Name every field**, and **pin its values to a closed list** when you can.
  - Ask for **ONLY** the structure — no chatty preamble around it.

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

* Pinned values (`one of [...]`) are what let a later step write `IF priority = "urgent"` and have it actually match.

> A summary can be phrased a thousand ways; `"priority": "urgent"` can only be one of three.
> Closed lists are how you make a fluent model's output **countable and branchable**.

---

## Say What to Do When the Assumption Fails

* Most confident-wrong answers = the model hit an unplanned case and **guessed**. Tell it the fallback instead:

```text
Extract the delivery date. If no date is stated, write "not specified" —
do not estimate one.
```

```text
If the request contains more than one distinct ask, set "confidence" to "low"
and "human_review_required" to "yes".
```

* Naming the fallback removes a whole class of made-up answers — and gives the automation a **safe default** to route on.

> "not specified" is a value a workflow can catch and send to a human. A guessed date is a
> silent error that ships. Always give missing data a name, never a guess.

---

## Show It an Example or Two (Few-Shot)

* Don't *describe* the pattern — **demonstrate** it. The model imitates what it sees.

```text
Classify each support message as: Billing, Technical, or Other.

Message: "My card was charged twice." -> Billing
Message: "The app crashes on login." -> Technical
Message: "Do you have an office in Denver?" ->
```

* One or two examples lock in tone, format, and edge cases faster than a paragraph of rules — no code, no "training."

> Few-shot is the cheapest way to make output *consistent* across runs — exactly what an
> automation needs. Two good examples beat five sentences of instruction.

---

## Grounding — Answers From the Source, Not the Guess

* By default the model answers from memory — fluent, and sometimes **fluently wrong**.
* **Grounding** = give it the reference material and require it to answer *only* from that.

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

* Grounded answer: quotes the 14-day refund line and answers *yes* — because the source says so, not because it guessed.

> Three moves defeat hallucination: **ground it** ("use only this"), **ask for evidence**
> ("quote the line"), and **give it an out** ("if it's not here, say so"). Use all three
> whenever a wrong answer would reach a customer.

---

## Advanced Prompting — Chains and Multi-Step Tasks

* Real work is rarely one prompt. A **prompt chain** breaks a task into steps, where **each step's output feeds the next**.
* Why chain instead of one mega-prompt?
  - Each step does **one** job, so each is easier to write, test, and trust.
  - The hand-off between steps is **structured** — a clean interface, not a blob of prose.
  - When something's wrong, you can see **which step** broke, and fix only that one.

```text
   raw item ─▶ [ STEP 1: extract ] ─▶ fields
                                        │
              [ STEP 2: classify ] ◀────┘ ─▶ labels
                                             │
              [ STEP 3: draft reply ] ◀──────┘ ─▶ ready-to-review draft
```

> A chain is the bridge from "AI in a chat window" to "AI as a step in a workflow." The
> output of step 1 is the input of step 2 — so step 1's **format** is a contract, not a
> preference. Use `course-materials/prompt-chain-template.md` to design one.

---

## Designing the Hand-Offs

* The skill in chaining isn't the prompts — it's the **interfaces between them**. Three rules:
  - **Each step returns only what the next step needs** — structured, no prose around it.
  - **Name the fallback at every step** — a missing field becomes `"not specified"`, never a guess, so the error can't hide.
  - **Put the human before anything external** — the chain drafts; a person approves the send.

* Map the chain before you write a single prompt:

```text
| # | Step          | Input            | Output (be exact)                       |
|---|---------------|------------------|-----------------------------------------|
| 1 | Extract fields| the raw request  | JSON: {customer, product, issue, dates} |
| 2 | Classify      | step-1 JSON      | JSON: {category, priority, review_flag} |
| 3 | Draft reply   | steps 1–2 JSON   | a 3-sentence email, no send             |
```

> If step 2 can't reliably read step 1's output, the chain is broken no matter how good the
> individual prompts read. Design the *format of the hand-off* first.

---

## Worked Chain — Support Request → Structured Draft

* One incoming support request flows through three steps. Watch the output shape carry forward.

**Input** (one row of `labs/assets/sample-support-requests.csv`):

```text
Northstar Health: "Can someone explain whether our team can upload patient
records into a public AI tool?"
```

**Step 1 — Extract** (returns fields the next step reads):

```text
{
  "customer": "Northstar Health",
  "product": "not specified",
  "issue": "asking whether patient records can go into a public AI tool",
  "dates": "not specified"
}
```

* The two `"not specified"` values are the fallback firing — no dates were in the text, so none were invented.

---

## Worked Chain — Steps 2 and 3

**Step 2 — Classify** (reads step-1 JSON, adds routing fields):

```text
{
  "category": "account",
  "priority": "normal",
  "sensitive_data": "yes",          <- patient records detected
  "confidence": "medium",
  "human_review_required": "yes"    <- follows from sensitive_data
}
```

**Step 3 — Draft** (reads steps 1–2, writes a reviewable reply — never sends):

```text
"Thanks for checking before uploading anything. Patient records are sensitive,
so they shouldn't go into a public AI tool — let me connect you with our security
team to confirm an approved, compliant option. — Northwind Support"

route: Review queue   (because human_review_required = "yes")
```

> The chain didn't send a thing. It produced a **draft plus a routing decision**, and the
> sensitive-data flag from step 2 sent it to a human. That's a safe automation: structured
> hand-offs, a named fallback, and a gate before anything leaves the building.

---

## Give the Model Time to Think — Spell Out the Steps

* Don't ask for the conclusion in one leap. Ask for the **work**, in order.

```text
Do this in order:
1. Extract every action item from the notes below.
2. For each, identify the owner (or "unassigned").
3. Then, and only then, write a two-line summary for a manager.
```

* Intermediate steps make the answer better **and checkable** — you can inspect step 1 before trusting step 3.

> This is a mini-chain inside a single prompt. When a step is cheap, keep it in one prompt;
> when a step's output needs to route somewhere, split it into a real chain.

---

## Let It Solve Before It Judges

* Asked to *evaluate* something, the model tends to rubber-stamp it. Make it work independently first:

```text
Here is a proposed project timeline. Do NOT comment on it yet.
First, work out your own realistic timeline from the task list below.
Then compare the two and flag any place the proposal looks optimistic.
```

> "Is this right?" → "looks good." "Solve it yourself first, then compare" → catches the
> errors. Order of operations changes the answer's *correctness*, not just its wording.

---

## Four Jobs Prompts Do Every Day

* Beyond drafting, four verbs cover most business text work — and each has an automation use:
  - **Summarize** — long → short, with a focus (meeting → exec brief).
  - **Extract** — pull named fields out of text (email → {name, order, issue}).
  - **Infer** — read implied meaning (review → sentiment, topics, urgency).
  - **Transform** — translate, re-tone, reformat, proofread (blunt note → warm email).
  - **Expand** — a few points → a finished, tailored message (bullets → customer reply).

> **Extract** and **infer** are the engines of automation — they turn messy incoming text
> into structured fields the rest of a workflow can route on. Summarize for the gist;
> **extract** for a field.

---

## Infer — Structured Meaning in One Call

* The model is strong at reading *implied* information — no rules, no code:

```text
For the customer review below, return labeled fields:
- sentiment:  positive / negative / mixed
- emotion:    the single strongest one
- entities:   any product and company names mentioned
- topics:     three short labels
```

* Several inferences in **one structured call** → output that's ready to sort, route, or feed the next step. This is the engine behind a triage automation.

> Ask for the fields, not a paragraph about the review. The whole point is to hand the next
> step something it can branch on.

---

## Expand — Keep the Human in the Loop

* Give the *points*; let it write the *message* — then a person reviews before it goes out:

```text
Write a reply to the customer email below.
- Thank them by name.
- Acknowledge their specific complaint (use details from THEIR email).
- Offer the resolution in the notes.
- Warm, professional, under 120 words. Sign as "Northwind Support."
```

> Expansion is where automation must slow down. AI **drafts**, you **approve**. Never wire
> "expand" straight to "send" — that's the difference between a helpful workflow and an
> apology to a customer.

---

## Set the Role Once — the "System" Instruction

* A chat is turns; the most powerful is the **system instruction** — a standing role and rules applied to *every* later message:

```text
You are a concise operations analyst. Always answer in at most five bullets.
If a request needs data you don't have, ask for it instead of guessing.
```

* No code, no API. In this class, the no-code system prompt is **project instructions** in
  ChatGPT Enterprise or the first setup message in a fresh chat. In a future connected
  workflow, the same instructions become the AI-step configuration.

> Put your role and constraints here and they apply automatically to every run. That is the
> bridge from one-off prompting to repeatable workflow.

---

## Turn a Recurring Task Into a Reusable, Parameterized Prompt

* The payoff of everything above: stop rewriting; **parameterize** once.
* Replace the specifics with named slots, so anyone can drop in this week's inputs:

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

* Fill the `{{slots}}` and it runs. Save it in `course-materials/prompt-template.md` and it's a **team asset**, not a one-off.

> A parameterized prompt is where prompting becomes workflow: in class you fill the
> `{{slots}}` by paste/upload; in a future connector workflow, those slots map from the
> trigger fields.

---

## Prompt-for-Automation — Cheat Sheet

* **Six parts:** Role, Task, Context, Constraints, Format, Examples — name the missing one.
* **Delimit** your data; **structure** your output; **pin** values to closed lists.
* **Name the fallback** at every step ("if unknown, `not specified`").
* **Show an example** when style or edge-cases matter.
* **Chain** multi-step work — each step returns only what the next one needs.
* **Ground and cite** to fight hallucination; **solve before judging**.
* Right verb: **summarize / extract / infer / transform / expand**.
* Set the role once with a **system instruction**; **parameterize** anything you'll repeat.

> Captured in `course-materials/prompt-template.md` and `course-materials/prompt-chain-template.md`.
> Everything in this course's automations is built from these moves.

---

## Live Prompt Writing and Feedback

* We'll write prompts live, out loud, before the lab — the fastest way to feel the six parts working.
* The drill for each volunteer prompt:
  1. Read it. Which of the **six parts** is missing?
  2. Add exactly **one** part. Run it.
  3. Name what changed — and which line caused it.
* Then push it one step further for automation: *what would the next step need this output to look like?*

> Diagnose, add one thing, re-run. Naming *one* problem and adding *one* fix is the actual
> skill — not writing the perfect prompt on the first try.

---

## Lab 02 - Build a Multi-Step Prompt Chain

**Stop here and run Lab 02.**

You will:

1. Take one support request and design a **three-step chain**: extract → classify → draft.
2. Write each step so it returns **structured output** the next step can consume.
3. Give every step a **fallback** for missing data, and a **human review** gate before any send.
4. Run all five sample requests through the chain and confirm the sensitive one routes to review.
5. Save the chain as a reusable, parameterized asset.

**Deliverable:** a completed prompt-chain design (three steps with exact output formats),
the three prompts, the structured output for at least two sample requests, and evidence
that the patient-records request was flagged for human review.
