# Human Review Queue Template

Use this table when an AI workflow drafts, classifies, or recommends anything a person must
review before action.

| Run ID | Item | AI Summary | AI Recommendation | Risk Flag | Status | Reviewer | Reviewer Notes | Final Action | Timestamp |
|--------|------|------------|-------------------|-----------|--------|----------|----------------|--------------|-----------|
| 001 | | | | none / privacy / legal / financial / low confidence / other | NEEDS_REVIEW | | | | |

## Status Values

- `NEEDS_REVIEW` - AI output is waiting for a person.
- `APPROVED` - reviewer accepts the output or action.
- `EDITED` - reviewer changed the output before use.
- `REJECTED` - reviewer decided not to use it.
- `ESCALATED` - reviewer sent it to a specialist or manager.

## Required Review Rules

Always route to this queue when:

- The item contains or asks about sensitive, regulated, personal, legal, payment, or health data.
- The AI reports low confidence.
- The item has more than one distinct ask.
- The next action would send, publish, delete, buy, approve, or change a record.
- The source document does not answer the question.

## Audit Note

Do not store raw sensitive data in the queue. Store placeholders, short summaries, risk flags,
reviewer decisions, and links or references to approved systems when available.
