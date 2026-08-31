# Prompt 19: Partial & Incomplete Feature Completion Pass

> **Stage 3 — Build & Complete**  
> **Target:** Partially implemented & functional-but-incomplete features  
> **Output:** 5-Tier Verification (UI, Backend, Database, UX, Integration) & Total Completion

---

## Prompt Text

```text
Now focus specifically on EVERY feature currently classified as PARTIALLY IMPLEMENTED or FUNCTIONAL BUT INCOMPLETE.

Do a feature-by-feature completion pass.

For each partial feature:

- Identify exactly what already works.
- Identify exactly what is missing.
- Identify broken connections.
- Identify incomplete UI.
- Identify missing backend logic.
- Identify missing database operations.
- Identify missing validation.
- Identify missing permissions.
- Identify missing error handling.
- Identify missing loading states.
- Identify missing persistence.
- Identify unfinished CRUD operations.
- Identify placeholder/mock behavior.

Then FINISH the feature completely.

Do not rebuild the feature from scratch if working pieces already exist.

A feature should only be considered COMPLETE when:

UI
✓ Exists
✓ All intended interactions work
✓ Uses real data

Backend
✓ Required endpoints/services exist
✓ Validation exists
✓ Errors are handled
✓ Authorization is correct

Database
✓ Correct tables/relationships exist
✓ Reads work
✓ Creates work
✓ Updates work
✓ Deletes work where applicable
✓ Data persists correctly

UX
✓ Loading states
✓ Error states
✓ Empty states
✓ Success feedback
✓ Responsive behavior

Integration
✓ Frontend ↔ backend works
✓ Backend ↔ database works
✓ Authentication works
✓ Permissions work
✓ Refresh/reload works

Do not mark something complete just because the happy path works.

After each feature:
- Type-check
- Lint
- Test
- Build where possible

Then move to the next incomplete feature.
```
