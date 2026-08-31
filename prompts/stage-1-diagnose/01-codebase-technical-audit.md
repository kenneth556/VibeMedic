# Prompt 01: Codebase Technical Audit

> **Stage 1 — Diagnose**  
> **Target:** Frontend, Backend, APIs, State, Build, Runtime, Type Safety  
> **Output:** Prioritized Issue Report (Critical, High, Medium, Low) & Safe Fixes

---

## Prompt Text

```text
You are performing a COMPLETE technical audit of this application.

Your first task is to inspect the ENTIRE codebase. Do not only inspect the files currently open or recently modified.

Analyze:
- Frontend
- Backend
- API routes
- Database queries
- Authentication
- Authorization
- State management
- Forms
- Components
- Hooks
- Services
- Utilities
- Configuration
- Environment variable usage
- Error handling
- Loading states
- Routing/navigation
- TypeScript/types
- Dependencies
- Build configuration

Look for:
- Compilation errors
- Type errors
- Runtime errors
- Broken imports
- Missing files
- Incorrect imports
- Undefined variables/functions
- Unreachable code
- Dead code
- Incorrect async/await usage
- Promise handling problems
- Null/undefined bugs
- Incorrect state updates
- Race conditions
- Obvious logic errors
- Missing error handling
- Broken API calls
- Incorrect response handling
- Security issues that are obvious from the code

IMPORTANT:
1. Inspect the whole repository before making major changes.
2. Do not assume something works just because it looks correct.
3. Trace important functions across files.
4. Check how frontend → API → backend → database flows actually work.
5. Do not rewrite working code unnecessarily.
6. Preserve the existing architecture and UI unless a change is required to fix a problem.

After the audit, create a prioritized list of every issue you found, categorized as:
CRITICAL / HIGH / MEDIUM / LOW.

Then FIX the issues you found, starting with CRITICAL and HIGH priority.

After making changes:
- Run the available type checker.
- Run linting.
- Run the available test suite.
- Run/build the application if possible.
- Fix any new errors caused by your changes.

At the end, give me:
1. Issues discovered
2. Issues fixed
3. Files changed
4. Checks/tests executed
5. Remaining issues that require manual testing
```
