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

- Slides build to PPTX with `slides/gen.sh` (needs `ES_HOME` set; output goes to
  `slides/assembly.out/`, which is git-ignored). Mark keeps the curated built decks in
  `slides/release/` and regenerates them himself — **don't overwrite `release/`.**
- Add a slide image: put the file in `images/`, reference from a slide as
  `![](../images/foo.png)` or `<img src="../images/foo.png" style="width:60%;"/>`.
- Run `./scripts/validate-course.sh` after structural changes.
- Committing to this repo is approved; end commit messages with a
  `Claude-Session: <url>` trailer. Don't commit or push without Mark's OK on anything new.
