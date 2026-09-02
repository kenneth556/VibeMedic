# Prompt 19: Core Feature Implementation Engine

> **Stage 3 — Build & Complete**  
> **Target:** Systematically implement unfinished features by priority order  
> **Output:** Full End-to-End Feature Completion with Database, API, UI & Persistence

---

## Prompt Text

```text
Now begin IMPLEMENTATION.

Use the feature health report and roadmap from the previous steps.

Your objective is to make the application genuinely functional, not merely visually complete.

Start with the highest-priority feature that is NOT production-ready.

For each unfinished feature:

1. Inspect all existing implementation first.
2. Reuse existing architecture, components, services, types, database patterns, and UI.
3. Do NOT unnecessarily rewrite working code.
4. Implement missing frontend functionality.
5. Implement missing backend/API functionality.
6. Implement required database operations.
7. Connect the complete data flow.
8. Remove placeholder/mock behavior where appropriate.
9. Add proper loading states.
10. Add proper error handling.
11. Add proper empty states.
12. Handle authentication and permissions.
13. Make the feature persist correctly.
14. Make sure refresh/reload doesn't break it.
15. Verify related features haven't been broken.

For database changes:
- Inspect the existing schema first.
- Follow existing conventions.
- Create migrations when required.
- Do not destroy existing data.
- Do not create duplicate tables unnecessarily.

For UI:
- Preserve the application's existing design system.
- Do not redesign the application unless necessary.
- Keep responsive behavior intact.

For every feature you complete:
- Type-check
- Lint
- Test
- Build where possible
- Verify the relevant data flow

Then move to the next highest-priority unfinished feature.

Continue until you have implemented as many unfinished features as can be safely completed without external information or credentials.

Do NOT stop after implementing only one feature.
```
