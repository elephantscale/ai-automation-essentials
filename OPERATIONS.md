# Project Operations

**Last updated:** 2026-08-25
**Owner:** Mark Kerzner
**Status:** Green

## Purpose and business value

**AI Automation Essentials for Business Professionals** (Elephant Scale) — a 2-day (16-hour),
hands-on, no-code course teaching non-technical professionals, team leads, and decision-makers
to build AI into their real workflows: prompt engineering for automation, evaluating/
troubleshooting AI output, no-code automation and a simple AI agent, AI for decisions, a
responsible-AI/governance framework (EU AI Act, NIST AI RMF), ROI, and a capstone. Revenue
comes from Elephant Scale instructor-led delivery of this course.

## Current status

Course is built and pushed (`main`). All seven labs verified against the confirmed delivery
setup for the upcoming cohort. Materials are tool-flexible; the labs were specifically
confirmed to run with an assistant-only student path plus instructor demos.

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

- **15 students on enterprise ChatGPT**, all with full access. This is their single AI
  assistant for every hands-on lab.
- **Other accounts are instructor-demo only** — Mark demonstrates automation platforms
  (Zapier / Make / Power Automate / Copilot Studio / n8n) and other assistants (Claude /
  Gemini) from his **Mac laptop**. Students do not need platform seats.
- Student lab paths used: Modules 1–3, 5, 6 run fully in one assistant chat; Module 4 uses
  the by-hand orchestrator (Part 3b); capstone uses the by-hand simulation ("design is
  graded, not the wiring").
- **Module 6 advantage:** the lab critiques pasting PII into a *personal/free* ChatGPT
  account; this cohort is on the approved enterprise workspace — i.e., already the
  recommended fix. Call it out live.

## Current priorities

1. Confirm **file upload + Advanced Data Analysis** are enabled on the enterprise ChatGPT
   workspace (required for the student path in Modules 3, 5, and the capstone).
2. Pre-build the grounded custom assistant and the live platform demo on the Mac before class.
3. Lock the client name and delivery dates into this record.

## Customers and revenue connections

- **Client:** Unknown / Needs CEO input — cohort of 15 on their own enterprise ChatGPT.
- **Revenue:** Elephant Scale training engagement; amount Unknown / Needs CEO input.

## Upcoming deadlines

- **Delivery date(s):** Unknown / Needs CEO input.

## Important TODOs

- Verify enterprise ChatGPT admin policy permits file upload and data-analysis mode.
- Pre-build and rehearse the instructor demos (grounded assistant + a live platform trigger).
- If delivered over WebEx, point students to the **CC** button at the start.

## Blockers and dependencies

- Student hands-on for Modules 3, 5, and the capstone depends on file upload / data-analysis
  being enabled on the enterprise ChatGPT workspace — outside Mark's control; must confirm
  with the client's IT/admin.

## Risks

- **If file upload / data analysis is disabled** on the enterprise seats, the student paths
  for Modules 3, 5, and the capstone degrade — mitigation: fall back to pasted text and
  instructor-driven analysis. Confirm ahead of time to avoid a live scramble.

## Decisions needed from Mark

- Confirm the **client name** and **delivery dates** so this operational record is complete.

## Next three highest-value actions

1. Confirm enterprise ChatGPT file-upload / data-analysis is enabled for all 15 seats.
2. Pre-build and rehearse the instructor demos (grounded assistant + one live platform trigger).
3. Record client name and delivery dates here.
