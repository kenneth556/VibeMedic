# Prompt 22: Zero-Defect Final Feature Completion Pass

> **Stage 3 — Build & Complete**  
> **Target:** Final comprehensive completion pass to leave zero unfinished features  
> **Output:** Definitive Feature Completion Report (Complete, Remaining, Broken, Blocked) & Code Changes

---

## Prompt Text

```text
FINAL FEATURE COMPLETION PASS.

Your goal is to leave this application with ZERO legitimately unfinished features that can be completed from the existing codebase.

Re-scan the entire application.

For EVERY discovered feature, verify:

USER FLOW
→ PAGE
→ COMPONENT
→ INTERACTION
→ STATE
→ API
→ BACKEND
→ DATABASE
→ RESPONSE
→ UI UPDATE
→ PERSISTENCE

Check every feature for:

- Missing implementation
- Partial implementation
- Broken implementation
- Dummy data
- Mock services
- Placeholder UI
- Dead buttons
- Dead toggles
- Missing forms
- Missing CRUD operations
- Missing API connections
- Missing database connections
- Incorrect database queries
- Missing validation
- Missing error handling
- Missing loading states
- Missing empty states
- Missing permissions
- Broken authentication
- State synchronization problems
- Broken navigation
- Data that doesn't persist
- Features that work only after a page refresh
- Features that break after a page refresh
- Features that work only with hardcoded IDs/data

IMPLEMENT AND FIX everything that can be safely completed.

Do not stop at identifying problems.

Do not merely tell me what is wrong.

ACTUALLY MODIFY THE CODE.

However:
- Do not invent requirements.
- Do not fabricate external APIs.
- Do not use fake data to make a feature appear complete.
- Do not bypass authentication or authorization.
- Do not delete working functionality unnecessarily.
- Do not replace working architecture without a reason.
- Do not make speculative database changes.

For anything that genuinely cannot be completed, mark it BLOCKED and explain precisely why.

Before finishing:

✓ Run type checking
✓ Run lint
✓ Run tests
✓ Run production build
✓ Check for runtime errors where possible
✓ Check database migrations/schema
✓ Check API integrations
✓ Check authentication
✓ Check permissions
✓ Check every major user flow

Finally produce:

## FEATURE COMPLETION REPORT

### 🟢 COMPLETE
Features fully implemented and verified.

### 🟡 REMAINING
Features still incomplete.

### 🔴 BROKEN
Features that exist but still have verified problems.

### ⚫ BLOCKED
Features requiring external information, credentials, services, or decisions.

### 🔧 CHANGES MADE
All files and systems modified.

### 🗄️ DATABASE CHANGES
All schema/migration changes.

### 🧪 VERIFICATION
Tests, builds, type checks, and other verification performed.

### 🚨 MANUAL TESTING REQUIRED
Exact user flows I should manually test.

Do not claim 100% completion unless the code actually supports that conclusion.
```
