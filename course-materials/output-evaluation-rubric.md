# AI Output Evaluation Rubric

Score each dimension 1-5. Use it to define "good" before you accept AI output, and to
troubleshoot when output disappoints.

| Dimension | 1 (poor) | 3 (usable) | 5 (strong) | Score |
|-----------|----------|-----------|-----------|-------|
| **Accuracy** | facts wrong or invented | mostly right, minor checks | verifiably correct, sourced | |
| **Completeness** | misses key asks | covers the main asks | covers all asks + edge cases | |
| **Tone / audience fit** | wrong register | acceptable | exactly right for the reader | |
| **Structure / format** | ignores requested format | close | exact format, ready to use | |
| **Trustworthiness** | overclaims, no caveats | some hedging | flags uncertainty, cites source, refuses when unsure | |

**Total / 25:**

## Diagnose → fix

- Low **accuracy**? → ground it ("use only the provided source"), ask for quotes, add "don't guess."
- Low **completeness**? → list the required parts in the prompt; ask it to check each.
- Wrong **tone**? → name the audience and register explicitly.
- Wrong **format**? → specify the exact structure (table, JSON, N bullets).
- Low **trust**? → require evidence and an explicit "needs review" flag for anything unsupported.
