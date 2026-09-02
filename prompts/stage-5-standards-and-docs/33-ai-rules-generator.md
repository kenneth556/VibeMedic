# Prompt 33: AI Rules & Operating Instructions Generator

> **Stage 5 — Standards & Docs**  
> **Target:** System guidelines, safety constraints, verification pipeline, reporting contract for AI agents  
> **Output:** Tailored `AI_RULES.md` and `AGENTS.md` at Repository Root

---

## Prompt Text

```text
Create an AI_RULES.md file at the root of this repository.

This file will serve as the permanent operating instructions for future AI coding agents working on this project.

Include rules covering:

### Before modifying code
- Inspect relevant existing code.
- Understand architecture.
- Search for existing implementations.
- Never duplicate existing functionality.
- Check database schema before creating database logic.
- Check existing APIs before creating new endpoints.

### During implementation
- Preserve existing architecture.
- Reuse existing components and utilities.
- Do not introduce unnecessary dependencies.
- Do not use mock data to hide missing functionality.
- Do not hardcode database records.
- Do not bypass authentication.
- Do not bypass authorization.
- Do not expose secrets.
- Do not silently swallow errors.
- Do not delete functionality without justification.

### Database
- Inspect schema first.
- Respect relationships.
- Use migrations.
- Preserve existing data.
- Verify ownership and authorization.

### UI
- Follow the existing design system.
- Keep responsive behavior.
- Ensure every interactive element has real functionality.
- Implement loading/error/empty states.

### Verification
Before declaring work complete:

TYPECHECK
→ LINT
→ TEST
→ BUILD
→ VERIFY AFFECTED USER FLOW

### Completion rule

An implementation is NOT considered complete merely because:

- The page exists.
- The button exists.
- The modal opens.
- The API exists.
- The database table exists.

A feature is complete only when the complete intended user flow works end-to-end.

Also include instructions for how an AI agent should report:

- What it changed
- Why it changed it
- Files modified
- Database changes
- Tests performed
- Remaining issues
- Anything requiring manual verification

Make the rules practical and specific to the architecture discovered in this repository.
```
