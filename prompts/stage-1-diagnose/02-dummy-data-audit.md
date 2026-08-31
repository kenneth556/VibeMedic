# Prompt 02: Dummy, Mock & Placeholder Data Audit

> **Stage 1 — Diagnose**  
> **Target:** Hardcoded arrays, mock users/products, static charts, fake timeouts, dummy counters  
> **Output:** Dummy Data Trace Report & Real Data Source Migration

---

## Prompt Text

```text
Now perform a COMPLETE audit specifically for DUMMY, MOCK, PLACEHOLDER, HARDCODED, and FAKE application data.

Inspect the ENTIRE codebase.

Find things such as:
- Mock arrays
- Fake users
- Fake products
- Fake statistics
- Hardcoded dashboard numbers
- Placeholder names
- Example records
- Static transaction data
- Fake notifications
- Fake charts
- Hardcoded statuses
- Hardcoded balances
- Hardcoded counts
- Fake API responses
- Mock API services
- TODO data
- "Coming soon" functionality pretending to work
- Placeholder images
- Placeholder URLs
- Demo accounts/data accidentally left in production code
- Hardcoded IDs
- Hardcoded database records
- Hardcoded success responses
- Fake loading delays
- Simulated API calls
- setTimeout-based fake functionality
- Any UI that displays information that is not actually coming from the application's real data source

For EVERY suspicious piece of data, trace where the UI gets it from.

Determine whether it should:
A. Come from the database
B. Come from an API
C. Come from authenticated user/session data
D. Be calculated dynamically
E. Actually remain static

Do not remove legitimate static configuration, UI labels, constants, or intentionally static content.

Replace fake/dummy application data with the correct real data source wherever the required backend/database functionality already exists.

If the required backend/database functionality does NOT exist, do not invent an architecture. Report exactly what is missing.

After changes, run type checking, linting, tests, and build checks where available.

Report:
- Every dummy/fake data source found
- Where it was used
- What the real source should be
- What you replaced
- What still needs backend/database implementation
```
