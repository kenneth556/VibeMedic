# Prompt 11: Failure Mode & Error Resilience Audit

> **Stage 2 — Repair**  
> **Target:** Silent failures, stuck loading states, missing error boundaries, unhandled promises  
> **Output:** Robust Loading/Success/Error/Empty State Handling Across Async Flows

---

## Prompt Text

```text
Perform a complete failure-mode audit.

Assume that EVERYTHING that can fail eventually will.

Inspect:

- API failures
- Database failures
- Network failures
- Authentication failures
- Expired sessions
- Invalid input
- Missing data
- Empty data
- Unauthorized access
- Rate limits
- External service failures
- Upload failures
- Timeout failures
- Unexpected responses
- Malformed responses
- Race conditions
- Duplicate submissions

Find places where the application:

- crashes
- silently fails
- shows false success
- gets stuck loading
- leaves stale state
- displays misleading information
- loses user input
- produces unhandled promise rejections
- exposes raw errors to users
- has no recovery mechanism

Implement appropriate error handling.

Every important async operation should have appropriate:

LOADING
→ SUCCESS
→ ERROR
→ EMPTY

states where applicable.

Do not swallow errors silently.

Log useful technical information without exposing sensitive information.

After implementation, test the affected flows and run the normal verification suite.
```
