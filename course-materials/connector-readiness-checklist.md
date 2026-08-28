# Connector Readiness Checklist

Use this when the class VM does not have Google Drive, SharePoint, Slack, email, CRM, or other
connectors enabled. The goal is to decide whether a workflow is ready to connect later, not to
connect it today.

## Workflow

- Workflow name:
- Business goal:
- Source system that would be connected later:
- Destination system that would receive output later:
- Today's safe fallback in ChatGPT:

## Data Access Map

| Data Field | Needed? | Sensitivity | Who Should See It? | Can It Be Redacted? | Notes |
|------------|---------|-------------|--------------------|---------------------|-------|
| | yes / no | public / internal / confidential / regulated | | yes / no | |

## Connector Risk Classification

Check all that apply:

- [ ] Read-only source access
- [ ] Write-back to a source system
- [ ] External send or publish action
- [ ] Deletes, purchases, approvals, or record changes
- [ ] Sensitive or regulated data access
- [ ] Broad workspace/team visibility
- [ ] Requires audit logging
- [ ] Requires admin approval

## Required Controls

| Risk | Control |
|------|---------|
| Sensitive data | Redact before AI sees it, or use only an approved enterprise workspace |
| Prompt injection | Fence third-party content as untrusted data |
| Over-broad access | Least-privilege connector permissions |
| Wrong output | Human review before action |
| Unclear source | Source citation and verification |
| Audit need | Log metadata, reviewer, outcome, and timestamp |

## Recommendation

Choose one:

- [ ] Ready for connector later
- [ ] Ready for read-only connector only
- [ ] Not ready until access controls or policy exist
- [ ] Not appropriate for connector automation

Reason:

Next step:
