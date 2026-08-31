# Prompt 17: Deep Feature Verification & Health Audit

> **Stage 3 — Build & Complete**  
> **Target:** 17-point lifecycle verification of every inventoried feature from UI to DB to persistence  
> **Output:** Feature Health Report (Production Ready, Functional but Incomplete, Partially Functional, Not Implemented, Blocked)

---

## Prompt Text

```text
Using the feature inventory you just created, now perform an EXTENSIVE VERIFICATION of every feature.

Do not simply check whether the relevant files exist.

For EVERY feature, trace its complete implementation:

USER
→ UI
→ COMPONENT
→ STATE
→ HANDLER
→ API/SERVICE
→ BACKEND
→ DATABASE
→ RESPONSE
→ STATE UPDATE
→ UI

Test every available path through the code.

For each feature determine:

1. Does the UI exist?
2. Is the UI connected to real functionality?
3. Are all controls functional?
4. Does it use real application data?
5. Does it communicate with the backend correctly?
6. Does the backend perform the intended operation?
7. Does the database operation actually work?
8. Is the result returned correctly?
9. Does the UI update correctly?
10. Are loading states handled?
11. Are errors handled?
12. Are empty states handled?
13. Are permissions/authentication handled?
14. Does persistence work?
15. Does refresh/reload preserve the correct state?
16. Are edge cases handled?
17. Are there any hidden dummy/mock implementations?

Classify every feature as:

🟢 PRODUCTION READY
🟡 FUNCTIONAL BUT INCOMPLETE
🟠 PARTIALLY FUNCTIONAL
🔴 NOT IMPLEMENTED
⚫ BLOCKED

Do NOT fix anything yet.

Produce a detailed FEATURE HEALTH REPORT showing exactly what needs to be implemented or completed.

Prioritize issues based on:
1. Core application functionality
2. User value
3. Data integrity
4. Security
5. Dependencies
6. Implementation complexity

Do not mark a feature complete merely because its page renders.
```
