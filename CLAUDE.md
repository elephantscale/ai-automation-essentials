# Working on this course with Claude

This is the **AI Automation Essentials for Business Professionals** course (Elephant Scale) —
a 2-day, hands-on, no-code course for business professionals. This file orients a Claude
session started in this directory.

## What's here

- `outline.md` — the course outline (converted from the client Word doc).
- `slides/NN-name.md` — one Markdown deck per module (00-about + modules 1–7). **The Markdown
  is the source of truth.**
- `labs/NN-Name/README.md` — one lab per module, each with a full `## Teacher's Playbook`.
- `labs/assets/` — sample data (support CSV, meeting notes, help-center doc, messy vendor
  invoices, dashboard image).
- `course-materials/` — reusable templates (prompt, prompt-chain, evaluation rubric,
  automation canvas, ROI worksheet, AI-use policy, capstone rubric).
- `images/` — slide images (motivational about-deck art + Rebecca K cartoons).
- `scripts/validate-course.sh`, `labs/test-all-labs.sh` — structure checks (keep them green).

## House style (match it)

- **Terse presenter-skeleton slides:** prose collapsed into bullet/nested-bullet skeletons the
  instructor narrates. Keep slide titles, `---` separators, `>` blockquotes (they double as
  the visual beat), and all worked-example / code / JSON / ASCII blocks verbatim.
- **Tool-flexible:** write provider-neutral — "your AI assistant" (Claude / ChatGPT / Gemini)
  and "an automation platform" (Zapier / Make / Power Automate / Copilot Studio / n8n). Do
  NOT lock to one vendor.
- **Labs:** copy-ready prompts AT POINT OF USE; hand-holding for non-technical students
  (multi-line prompt = Shift+Enter for new lines / Enter to send / or paste; say where to get
  a sample file and where to record results). Each lab ends with a rich Teacher's Playbook
  (worked model answer + realistic output, live demo script, common mistakes+fixes, debrief
  Q&A, "what good looks like").

## Delivery lessons baked in (from a prior delivery's feedback)

- **Guided Lab 01 walkthrough:** run the first lab together, screen-shared — non-technical
  students calibrate best that way. (Note is in `labs/01-Foundations`.)
- Spell out every "how"; put prompts at point of use; ROI is taught with a fully worked
  numeric example (`course-materials/roi-worksheet.md`).
- On WebEx, point students to the **CC (closed captions)** button at the start.

## Sibling course to borrow from

This course was adapted from **No-Code AI Solutions** at
`/media/mark/data1/ES/No-Code_AI_Solutions` — reuse its decks/labs/assets as reference.

## Build & workflow

- **Never regenerate the PPTX decks — Mark builds them himself, every time.** When `ES_HOME`
  is set, `slides/gen.sh` assembles PPTX into `slides/assembly.out/` as a side effect, so
  **don't run `gen.sh`.** Mark also keeps the curated built decks in `slides/release/` —
  **don't overwrite `release/`.**
- To refresh `slides/slide-list.txt` (the ordered deck manifest that `validate-course.sh`
  checks), regenerate it directly without triggering assembly:
  `ls slides/[0-9][0-9]-*.md | sed 's#slides/##' | sort > slides/slide-list.txt`. That file is
  generated, so don't hand-edit it; add/rename a deck, then rerun that one line.
- Add a slide image: put the file in `images/`, reference from a slide as
  `![](../images/foo.png)` or `<img src="../images/foo.png" style="width:60%;"/>`.
- After structural changes, run all three checks (each exits non-zero on failure):
  `./scripts/validate-course.sh` (required files + deck manifest + labs), `./labs/test-all-labs.sh`
  (every lab README present and non-trivial), `./labs/verify-setup.sh` (lab setup docs). Keep them green.
- Committing to this repo is approved; end commit messages with a
  `Claude-Session: <url>` trailer. Only commit changes Mark asked for or approved — but once
  something is committed, **always `git push`** (Mark is the sole maintainer, so there's no
  one to clobber).

## Working across machines (Mac + Ubuntu)

Mark works this repo on two machines: this Ubuntu box (`/media/mark/data1/ES/ai-automation-essentials`)
and a Mac clone. Only `origin/main` is shared — Claude Code auto-memory does NOT travel
between machines, so the durable rules live here in `CLAUDE.md` and the operational state
lives in `OPERATIONS.md`.

**Slide workflow (agreed division of labor):**
1. Mark edits the slide Markdown (`slides/*.md`) **here on Ubuntu**.
2. Claude **commits and pushes** those edits (verify the diff is intentional first, then push).
3. Mark pulls on the **Mac** and **generates the PPTX there himself**.

- Claude **edits slides only when Mark asks** — normally Mark writes the Markdown and Claude
  just reviews/verifies and pushes.
- **Never build the PPTX decks on either machine** — that's Mark's step on the Mac (see the
  build rules above). If `slides/slide-list.txt` needs refreshing, regenerate it directly;
  don't run `gen.sh`.
- **`git pull` before starting work** and after Mark says he pushed from the other machine —
  both sides commit straight to `main`, so pull first to avoid divergence.
