# Foundations of Generative AI in Business

Elephant Scale

---

## Why This Module

* Everyone at work is now expected to have an opinion about AI. This module gives you a **grounded** one.
  * Not hype, not fear — a practical, working mental model you can defend in a meeting.

* The conversation has moved past "write me a better email." Organizations are wiring AI into **workflows** — routing tickets, filing documents, triaging inboxes, watching data for exceptions.

* By the end of this module you will be able to:
  - Say plainly what generative AI **is and isn't**, and how it works — without the jargon.
  - Use the core terms correctly: model, context, tokens, prompt, hallucination, bias, agent, tool use.
  - Tell **generative AI apart from rules-based automation** — and know when to combine them.
  - Name the 2026 assistant landscape and what an "AI agent" actually is.
  - Separate the real capabilities from the common myths, in both directions.

> The goal is not to memorize product names — those change every quarter. The goal is a
> mental model that lasts: what this technology is good at, what it's weak at, and how it
> fits alongside the automation you already run.

---

## What Generative AI Is

* **Generative AI** produces new content — text, tables, images, code, summaries — from a description of what you want.
  * You ask in plain language; it writes, drafts, rewrites, extracts, classifies, explains.

* The engine behind ChatGPT Enterprise and similar assistants is a **large language model (LLM)**.
  * Trained on an enormous amount of text; learned the patterns of how language fits together.

* One capability, enormous range: the same assistant can be a writer, an analyst, a tutor, a reviewer, a planner — set by **your prompt**, not a different product.

> New this decade: software that produces a fluent first draft of almost any document-shaped
> task. That is genuinely new — and genuinely limited, in specific ways this module makes clear.

![](../images/pexels-mikebird-191738.jpg)
---

## What Generative AI Is *Not*

* **Not a fact database.** It doesn't "look things up." It predicts likely text. Sometimes that text is true; sometimes it's plausible and wrong.
* **Not a calculator.** It *predicts* numbers rather than computing them. Use a real tool for exact arithmetic.
* **Not aware of your company.** It knows nothing about your customers, your policies, or last week's meeting unless you provide it.
* **Not up to the minute.** Its training has a cutoff date; without web access it doesn't know today's news.
* **Not a decision-maker.** It's a drafting and analysis assistant. The human stays accountable for anything consequential.

> Most AI disappointments trace to expecting one of these five. Set the expectation
> correctly and the tool stops surprising you.

---

## How a Language Model Works, in Plain Language

* Given the text so far, an LLM predicts what comes next — **one piece at a time** — then repeats. That's the whole loop.
* No fact database inside, no little reasoner — an extraordinarily good **pattern-completer**, trained on vast amounts of text.
* You need the **consequences**, not the math:
  - Fluent, well-structured drafts, **fast**.
  - Can be **confidently wrong** — a smooth sentence is not a true one.
  - Doesn't know your **private context** unless you provide it.
  - Follows **specific** instructions far better than vague ones.
  - Works better when the **source material is separated** from the instructions.

> Treat it as a brilliant, fast, overconfident assistant who has read everything and
> remembers nothing about *your* situation until you tell it.

---

## Key Terms — Without the Jargon (1 of 2)

* **Model** — the AI system itself. A trained pattern-completer you send text to and get text back.
* **Prompt** — what you type: your instructions plus any material to work on. Your half of the conversation.
* **Context** — everything the model can "see" at once: your prompt, the files you attached, the conversation so far. Outside the context, it's blind.
* **Tokens** — the small chunks (roughly word-pieces) the model reads and writes in. Why it matters: there's a **limit** to how much context fits, and paid tools **bill per token**.

> Think of context as the model's desk. Anything on the desk, it can use. Anything in a
> drawer you never opened, it cannot — no matter how obvious it seems to you.

![](../images/pexels-markus-winkler-1430818-4065405.jpg)
---

## Key Terms — Without the Jargon (2 of 2)

* **Hallucination** — a confident, fluent answer that is simply **made up**: an invented statistic, a fake citation, a plausible wrong name. The failure mode to respect most.
* **Bias** — the model reflects patterns in its training data, including unfair ones. It can skew tone, assumptions, or recommendations in ways you must watch for.
* **Tool use** — when an assistant is allowed to *do* something beyond writing text: search the web, run a calculation, read a file, call another app.
* **Agent** — an AI that, given a goal, **chooses its own steps** and uses tools to pursue it, instead of following a fixed script. More on this shortly.

> Keep hallucination and bias front of mind all week. They aren't rare edge cases — they're
> everyday properties of the technology that your review habits exist to catch.

---

## Multimodal AI — Beyond Text

* **Multimodal** = the assistant reads and produces more than words. Hand the material over directly instead of retyping it.
* Takes in:
  - Documents and PDFs
  - Spreadsheets and CSVs
  - Screenshots and photos
  - Charts and diagrams
  - Audio (and in some tools, video)
* Produces text, tables, and **generated images** on the way back.
* Changes the workflow: upload a messy vendor spreadsheet and say *"flag the missing dates and merge the duplicate categories."* The file **is** the input.

> We lean on this all week — analyzing documents, reading a dashboard image, cleaning a
> spreadsheet. If you're still copy-pasting text out of files, you're working too hard.

---

## The Other Half — Rules-Based Automation

* Long before generative AI, software has automated work with **rules-based automation**: fixed, explicit logic a person wrote in advance.
  * "**If** a new row is added, **then** copy it to this sheet and email the owner."
  * "**If** the subject line contains 'invoice', **then** file it in the Finance folder."

* You already rely on this everywhere:
  - Email filters and inbox rules
  - Spreadsheet formulas
  - Zapier / Make / Power Automate "if-this-then-that" flows
  - Form routing, auto-responders, approval chains

* Its defining trait: it does **exactly** what it's told, every time, and **nothing** it wasn't told.

> Rules-based automation isn't old-fashioned or obsolete. For a huge amount of business
> work it is the *right* tool — and this course teaches you to combine it with AI, not
> replace it.

![](../images/pexels-joshuamiranda-4027658.jpg)
---

## Generative AI vs. Rules-Based Automation

* The core difference: **rules-based follows a script you wrote; generative AI interprets language you didn't anticipate.**

```text
                    RULES-BASED                 GENERATIVE AI
How it decides      explicit logic you wrote    predicts from patterns it learned
Handles new cases   no — only what's coded       yes — generalizes to unseen input
Reads messy text    poorly — needs exact matches  well — understands meaning, tone
Output              exact, identical every time   fluent, but can vary run to run
Correctness         deterministic / auditable     probabilistic / must be reviewed
Cost to change      edit the rules (can be slow)  edit the prompt (seconds)
Fails by            doing nothing on a new case   confidently doing the wrong thing
```

* Neither is "better." They fail in **opposite** directions — and that's exactly why they pair so well.

> Rules-based fails **silently and safely** (it skips what it doesn't recognize). Generative
> AI fails **loudly and plausibly** (it produces a confident answer anyway). Design for the
> failure mode you're choosing.

---

## Worked Example — The Same Task, Two Ways

* Task: **route incoming support requests** to the right queue. Sample data: `labs/assets/sample-support-requests.csv` (5 requests).

**Approach A — Rules-based (keyword matching):**

```text
IF request contains "invoice" OR "payment" OR "charge"  → route to Billing
IF request contains "error" OR "crash" OR "down"        → route to Technical
IF request contains "patient" OR "records" OR "HIPAA"   → flag for Compliance
ELSE                                                     → route to General
```

* Predictable, instant, free, fully auditable — you can read exactly why each request went where.

**Approach B — Generative AI (understands meaning):**

```text
Read each support request. Return: category (billing / technical / account /
sales / other), priority (urgent / normal / low), and a one-line summary.
Set human_review_required to "yes" if it involves sensitive data or is ambiguous.
```

* Reads intent even when the keywords aren't there — catches the request that *means* "billing" without using the word.

---

## What Happens on the Real Rows

* Run both approaches on the five sample requests. Watch **where each one wins:**

```text
Row  Request (abbreviated)              Rules-based result        AI result
1    "set up AI to summarize reports"   General (no keyword hit)  Technical ✓ (understood)
2    "upload patient records to AI?"    Compliance ✓ (matched)    Account + REVIEW ✓
3    "draft sponsor email AND an image" General (no keyword hit)  Other + low-confidence ✓
4    "missing dates, dup categories"    General (no keyword hit)  Technical ✓ (understood)
5    "classify & route store issues"    General (no keyword hit)  Sales ✓ (understood)
```

* **Rules-based won row 2** — the keyword "patient records" is an exact, reliable trigger, and you *want* that one deterministic and auditable.
* **AI won rows 1, 3, 4, 5** — no keyword matched, but it understood what each customer actually wanted, and it *flagged row 3 as ambiguous* on its own.

> Rules-based is precise but brittle: perfect when the trigger word is always there, blind
> when it isn't. AI is flexible but probabilistic: reads intent, but you must review it.

---

## Why You Combine Them

* The strongest real-world workflows use **both**, each where it's strong:

```text
NEW REQUEST
   │
   ▼
[ RULES ]  Does it contain "patient / records / HIPAA / SSN"?
   ├── YES → route straight to Compliance queue     (deterministic, auditable, safe)
   └── NO  → hand to the AI step ▼
                 │
                 ▼
             [ AI ]  Read intent → category, priority, summary, draft reply
                 │
                 ▼
             [ RULES ]  IF priority = "urgent"  → notify on-call
                        IF review flag = "yes"  → human review queue
                        ELSE                     → log and draft
```

* Rules handle the **known, high-stakes, must-be-exact** cases. AI handles the **messy, open-ended, language-heavy** middle. Rules then enforce the **safe routing** of the AI's output.

> The pattern to remember: **rules for the hard edges, AI for the soft middle, rules again to
> keep AI's output on rails.** You'll build exactly this shape in Module 4.

---

## The 2026 Landscape — Assistants As Workbenches

* Modern assistants are no longer just chat boxes. They are workbenches:
  - reasoning modes
  - file upload
  - data analysis
  - image understanding
  - project-style context
  - connectors or apps when enabled
* This class uses **ChatGPT Enterprise** in the VM, so everyone practices in the same approved workspace.

> Product names matter less than the workflow habit: provide context, constrain the task,
> verify the output, and keep a human accountable.

---

## The Rise of AI Agents

* Where the field is moving in 2026: from AI that **answers** to AI that **acts**.
* The ladder, rung by rung:
  - **Assistant** — you ask, it answers. You do everything with the answer.
  - **Tool use** — you ask, it searches the web or runs a calculation to answer better.
  - **Automation** — a fixed workflow calls AI as one step, over and over, without you.
  - **Agent** — given a goal, it **plans its own steps**, uses tools, and works toward the goal with less hand-holding.

* An agent handling "process this refund request" might: read the ticket → look up the order → check the policy → draft the reply → queue it for approval. It chose that sequence.

> Agents are powerful and genuinely new — and they can take actions you didn't individually
> approve. That's why every serious deployment keeps a **human in the loop** on anything
> consequential. Autonomy is earned one safe checkpoint at a time.

![](../images/Agentic Loop.jpeg)
---

## Common Myths — In Both Directions

* Overhyped — **AI can't really:**
  - "It's always right." No — it's confidently wrong on a predictable set of tasks.
  - "It knows my business." No — not until you give it your context.
  - "It'll replace the whole team." No — it drafts and accelerates; humans still decide.
  - "It thinks like a person." No — it completes patterns; there's no understanding underneath.

* Underhyped — **AI genuinely can:**
  - Turn messy notes into a clean, structured table in seconds.
  - Read a 40-page document and answer questions grounded in it.
  - Draft a first version of almost any routine business document.
  - Classify, summarize, and extract at a volume no person would sit through.

> The realistic view is boring and useful: a fast, tireless, overconfident drafting-and-
> analysis assistant. Enormous leverage on the right tasks, a liability on the wrong ones.

---

## What AI Is Genuinely Good At

* Point it at the work it's built for:
  - **Drafting** from clear instructions.
  - **Summarizing** long or dense material for a specific reader.
  - **Rewriting** for tone, audience, or reading level.
  - **Extracting** structure — messy notes into a clean table.
  - **Classifying and routing** text by meaning, not just keywords.
  - **Explaining** unfamiliar topics at the level you ask.
  - **Comparing** options across criteria.
* Common thread: it rewards **fluency, pattern recognition, and fast iteration** — none of which require the AI to be a source of truth on its own.

---

## What AI Is Weak At — and Needs Review

* Needs a human check every time:
  - **Fresh facts / current events** — knowledge cutoff; verify dates.
  - **Legal, medical, financial, compliance advice** — a draft aid, never the authority.
  - **Exact arithmetic** — it *predicts* numbers; use a real tool.
  - **Citations and sources** — it can **fabricate** a plausible-looking reference.
  - **Private company facts** you didn't provide — it will guess, fluently.
  - **Consequential actions** — send, delete, publish, purchase, change a record.
* A confident invented answer is a **hallucination** — the failure mode to respect most.
  - Mitigation: give it the source text, ask it to answer *from that text*, and flag what it can't support.

> The higher the consequence, the more explicit your verification path has to be. "It sounded
> right" is not a control.

---

## Intro to AI Operations for Business Leaders

* Putting AI to work is an **operational** discipline, not a one-off experiment. Five questions a leader has to answer:
  - **Where does it fit?** Pick real, repeatable, language-heavy workflows — not "everywhere."
  - **What data is allowed?** Approved accounts and approved data; never paste regulated or confidential material into a public tool.
  - **Who reviews the output?** A named human in the loop for anything consequential.
  - **How do we know it's working?** Track time saved, error rates, and adoption — not vibes.
  - **What are the guardrails?** A simple AI-use policy so the whole team plays by the same rules.

> This course is the tour of those five questions. Today's answer to "where does it fit" is
> the whole point of your module review — and every later module deepens one of the others.

---

## Safety Habits — Starting Today

* Adopt these from your very first prompt:
  - **Approved accounts and data** — sensitive work only in an approved enterprise workspace.
  - **Never paste confidential material into a public tool** — sample request #2 (patient records) is exactly this trap.
  - **Ask for assumptions and uncertainties** in the prompt.
  - **Verify facts before reuse** — names, numbers, dates, citations.
  - **Keep a human in the loop** for anything that sends, publishes, deletes, or buys.

> These matter *more* as we add file uploads, custom assistants, and automation that runs on
> its own. Good habits are cheap now and expensive to retrofit later.

---

## Module Review — Your Turn

* Take five minutes and answer this for yourself — you'll build on it all course:

> **Spot three workflows in your own department where AI could add real value.**

* For each one, jot down:
  - The **task** in one line ("summarize weekly regional sales emails into one report").
  - Whether it's mostly **language / judgment** (good AI fit) or **exact / rule-bound** (maybe rules-based, or a combination).
  - What a **human would still need to check** before the output is used.

* Keep this list. Your Module 7 **capstone** will build one of these for real.

> Best candidates are high-volume, language-heavy, and low-stakes-per-item: inbox triage,
> report summaries, drafting first replies, cleaning messy data. Start where a wrong draft is
> cheap to catch.

---

## Foundations — Cheat Sheet

* Carry these out of the module:
  - Generative AI is a **pattern-completer**, not a fact database, calculator, or decision-maker.
  - The terms that matter: **model, prompt, context, tokens, hallucination, bias, tool use, agent.**
  - **Rules-based** = exact, auditable, brittle. **Generative AI** = flexible, fluent, must be reviewed. They fail in **opposite** directions.
  - **Combine them:** rules for the hard edges, AI for the soft middle, rules again to keep AI's output on rails.
  - 2026 assistants are workbenches; this class uses **ChatGPT Enterprise**. **Agents** act; keep a human in the loop.
  - AI operations = five leader questions: **where it fits, what data is allowed, who reviews, how we measure, what the guardrails are.**

> One sentence to remember the whole module: *a fast, tireless, overconfident drafting-and-
> analysis assistant — enormous leverage on the right tasks, a liability on the wrong ones.*

---

## Lab 01 - AI vs. Rules-Based Routing

**Stop here and run Lab 01.**

> **Instructor note:** This is the first lab of the course. Run it as a **guided, screen-
> shared walkthrough with the whole class** — do it *together*, step by step, rather than
> turning students loose. Non-technical students calibrate best when the first lab is done as
> a group; it sets the pattern for every lab that follows.

You will:

1. Route the five sample support requests using a **rules-based** approach (keyword matching).
2. Route the same five requests using an **AI assistant** that reads meaning.
3. Compare the two, row by row, and note **where each approach wins**.
4. Decide, for this task, how you'd **combine** them into one safe workflow.

**Deliverable:** both sets of routing results, a short comparison naming where rules won and
where AI won, and one or two sentences on how you'd combine them.

**Time:** ~45-60 min.
