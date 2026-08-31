# Prompt 06: Comprehensive System Audit & Verification

> **Stage 1 — Diagnose**  
> **Target:** Complete application lifecycle, all pages, routes, states, integrations  
> **Output:** Definitive System Health Report (Critical/High/Med/Low) & Manual Test Plan

---

## Prompt Text

```text
This is the FINAL comprehensive audit.

Re-scan the ENTIRE codebase from scratch. Do not rely only on the findings from previous audits.

The goal is to determine whether the application is actually functional end-to-end rather than merely looking complete.

Audit:

1. Every page and route
2. Every component
3. Every interactive element
4. Every form
5. Every API endpoint
6. Every database operation
7. Every authentication flow
8. Every major feature
9. Every CRUD operation
10. Every loading/error/empty state
11. Every navigation path
12. Every external integration
13. Every environment variable
14. Every important state-management flow

For each major feature, trace the complete lifecycle:

USER ACTION
→ UI
→ STATE
→ API/SERVICE
→ BACKEND
→ DATABASE
→ RESPONSE
→ STATE UPDATE
→ UI

Find anything that:
- Looks implemented but isn't
- Works only with dummy data
- Has disconnected frontend/backend logic
- Has disconnected backend/database logic
- Has dead buttons
- Has dead toggles
- Has broken forms
- Has broken navigation
- Has missing error handling
- Has incorrect loading states
- Has incorrect empty states
- Has stale/hardcoded values
- Has incomplete CRUD
- Has inconsistent state
- Has broken authentication
- Has broken permissions
- Has obvious production-breaking bugs

IMPORTANT:
Do not make speculative changes just because you dislike an implementation.

Only change something when you can establish that it is incorrect, incomplete, disconnected, unsafe, or broken.

Before finishing:
- Run the project's type checker
- Run lint
- Run all available tests
- Run production build
- Check for build warnings/errors
- Check for unused imports/dependencies where practical
- Check for obvious console errors
- Check for unresolved TODO/FIXME items that affect functionality

Fix every verified issue you can safely fix.

Then provide a FINAL REPORT with:

### CRITICAL
Issues that can break the application, corrupt data, expose data, or prevent core functionality.

### HIGH
Important broken or incomplete functionality.

### MEDIUM
Non-critical bugs and inconsistencies.

### LOW
Cleanup and minor issues.

### FIXED
Everything you actually changed.

### STILL REQUIRED
Issues that cannot be safely fixed without additional information, backend work, credentials, migrations, external services, or manual testing.

### MANUAL TEST PLAN
Give me a concise list of the exact things I should manually test in the browser/device to verify the application is genuinely production-ready.
```
