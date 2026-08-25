# Prompt Chain Template

A **prompt chain** breaks a task into steps where each step's output feeds the next. Design
the hand-offs so a downstream step (or an automation) can consume the output reliably.

## The task

What is the end goal, and who/what consumes the final output?

## The steps

| # | Step (what it does) | Input | Output format (be exact) |
|---|---------------------|-------|--------------------------|
| 1 | e.g. Extract fields | the raw item | JSON: {name, issue, priority} |
| 2 | e.g. Classify | step 1 JSON | one of [billing, tech, other] |
| 3 | e.g. Draft reply | steps 1-2 | a 3-sentence email |

## Hand-off rules

- Each step returns **only** the structured output the next step needs — no prose around it.
- Name the fallback: what does a step output when data is missing? ("not specified", never a guess.)
- Where does a human review before anything external happens?

## Test cases

| Test | Input | Expected shape | Pass/Fail |
|------|-------|----------------|-----------|
| Happy path | | | |
| Missing field | | | |
| Ambiguous / sensitive | | | |
