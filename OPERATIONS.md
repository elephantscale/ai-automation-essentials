# Project Operations

**Last updated:** 2026-08-28
**Owner:** Mark Kerzner
**Status:** Green — delivery imminent (Sep 1–2, 2026)

## Purpose and business value

**AI Automation Essentials for Business Professionals** (Elephant Scale) — a 2-day (16-hour),
hands-on, no-code course teaching non-technical professionals, team leads, and decision-makers
to build AI into their real workflows: prompt engineering for automation, evaluating/
troubleshooting AI output, no-code automation and a simple AI agent, AI for decisions, a
responsible-AI/governance framework (EU AI Act, NIST AI RMF), ROI, and a capstone. Revenue
comes from Elephant Scale instructor-led delivery of this course.

## Current status

Course is built and pushed (`main`). All seven labs verified against the confirmed delivery
setup. Materials are tool-flexible; the labs were specifically confirmed to run with an
assistant-only student path plus instructor demos. **Delivery is Sep 1–2, 2026** — final
pre-class checks are the only remaining work.

## Recent accomplishments

**2026-08-25**
- **Verified the delivery model end to end** — every module runs for students on an AI
  assistant alone; automation-platform builds are instructor demos with a by-hand student
  fallback (Module 4 Part 3b, capstone simulation).
- `labs/SETUP.md` — moved the no-code automation platform from **Required** to **Optional**
  (instructor-demo path), so the requirements match this cohort.
- `CLAUDE.md` — added guardrails: never auto-build the PPTX decks; regenerate
  `slides/slide-list.txt` directly; documented the full three-script validation set.
- Refreshed the course copyright date.

## Confirmed delivery setup (current cohort)

- **11 students, each logged into a ChatGPT Business workspace provided by Elephant Scale**
  ("Elephant Scale · Business"), full-featured (GPTs, Projects, Agents, Plugins, Pro model
  selector, file upload). This is their single AI assistant for every hands-on lab. Students
  do **not** use personal or their-own-employer ChatGPT accounts.
- **Delivered through a browser-based remote lab desktop** (ProTech, `labs.protechtraining.com`)
  — each student gets a virtual desktop with Firefox pointed at `chatgpt.com`, already signed
  into the ES Business workspace. No local install; students just need the lab URL and a browser.
- **The workspace is Elephant-Scale-administered** — so file upload / data-analysis / GPT
  availability are under ES's own admin control (not a client's IT), and Mark can confirm or
  enable them directly before class.
- **Other accounts are instructor-demo only** — Mark demonstrates automation platforms
  (Zapier / Make / Power Automate / Copilot Studio / n8n) and other assistants (Claude /
  Gemini) from his **Mac laptop**. Students do not need platform seats.
- Student lab paths used: Modules 1–3, 5, 6 run fully in one assistant chat; Module 4 uses
  the by-hand orchestrator (Part 3b); capstone uses the by-hand simulation ("design is
  graded, not the wiring").
- **Module 6 advantage:** the lab critiques pasting PII into a *personal/free* ChatGPT
  account; this cohort is on a managed **Business** workspace governed by an org OpenAI
  agreement — i.e., already the recommended fix. Call it out live.

## Current priorities

1. Before Sep 1, smoke-test the ES Business workspace in the ProTech lab desktop: confirm all
   11 student logins work and that **file upload + data-analysis** function (Modules 3, 5, capstone).
2. Pre-build the grounded custom assistant and the live platform demo on the Mac before class.

## Customers and revenue connections

- **Client:** on file (naming not required in this record) — cohort of 11, working in an
  **Elephant-Scale-provided ChatGPT Business workspace** via the ProTech remote lab.
- **Revenue:** Elephant Scale training engagement; amount Unknown / Needs CEO input.

## Upcoming deadlines

- **Delivery: September 1–2, 2026** (2 days). Final pre-class checks due before Sep 1.

## Important TODOs

- Smoke-test the ProTech lab desktop + ES Business workspace: all 11 logins, file upload,
  data-analysis, GPT/Projects availability.
- **Confirm the ES Business workspace is NOT opted into improving OpenAI's models** (workspace
  admin → data controls). Needed to tell students truthfully in Module 6 that their data isn't
  used for training.
- Pre-build and rehearse the instructor demos (grounded assistant + a live platform trigger).
- If delivered over WebEx, point students to the **CC** button at the start.

## Blockers and dependencies

- Depends on the **ProTech remote lab** (`labs.protechtraining.com`) being provisioned with 11
  seats and the **ES Business ChatGPT** logins working. Both are within Elephant Scale's control
  — confirm provisioning and a working login before Sep 1.

## Risks

- **Lab/login not ready on Day 1** — if the ProTech desktops or ES Business logins aren't
  provisioned, hands-on stalls. Mitigation: smoke-test end to end before Sep 1; workspace is
  ES-administered, so issues can be fixed in-house rather than waiting on a client.

## Decisions needed from Mark

- None outstanding for this record. (Revenue amount still `Needs CEO input` if it should be tracked here.)

## Next three highest-value actions

1. **Before Sep 1:** smoke-test the ProTech lab + ES Business workspace end to end (11 logins, file upload, data analysis).
2. Pre-build and rehearse the instructor demos (grounded assistant + one live platform trigger).
3. If delivered over WebEx, point students to the **CC** button at the start of Day 1.
