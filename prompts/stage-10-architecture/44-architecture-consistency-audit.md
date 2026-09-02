# Prompt 44: Architecture Consistency Audit

> **Stage 10 — Architecture**  
> **Target:** Competing patterns across API fetching, components, auth, data access, state management, error handling, logging, and routing  
> **Primary Output:** Architecture Standardization Map & Consolidated Pattern Library

---

## Prompt Text

```text
# ARCHITECTURE CONSISTENCY AUDIT

You are performing a complete audit of the application's architecture
to identify places where multiple competing patterns coexist and need
to be consolidated.

Vibe-coded applications often accumulate:

- 3 different API-fetching approaches
- 4 button components
- 2 authentication patterns
- 3 database access patterns
- Random state management
- Mixed error handling styles

This inconsistency increases cognitive load, breaks refactoring, and
makes bugs inevitable. Your job is to find the inconsistencies and
consolidate them into a single canonical pattern — without breaking
working features.

Do not invent inconsistencies.
Do not force consolidation where patterns serve genuinely different
purposes.
Do not refactor working features unnecessarily.

---

# STEP 1 — INVENTORY OF PATTERNS

For each of the following dimensions, list every distinct pattern
found in the codebase:

1. **API / Data Fetching**
   - `fetch()` directly
   - `axios`
   - SWR / React Query / TanStack Query
   - Apollo / GraphQL clients
   - Server actions only
   - Route handlers only
   - Custom hooks
   - Context-based data
   - Polling
   - WebSockets / Realtime
   - Supabase client direct calls

2. **Components**
   - Button, Modal/Dialog, Input, Select, Card, Toast, Tooltip, Tabs,
     Dropdown, Avatar, Badge, Skeleton, Spinner
   - For each: how many distinct implementations exist? Where do they
     live?

3. **Authentication**
   - Supabase Auth helpers
   - NextAuth / Auth.js
   - Clerk
   - Custom JWT
   - Cookies / sessions
   - Multiple sign-in methods

4. **Database / Data Access**
   - Supabase client (`from`, `rpc`)
   - Prisma / Drizzle / Knex
   - Raw SQL
   - Edge Functions calling DB
   - Multiple access patterns to the same table

5. **State Management**
   - `useState` / `useReducer` only
   - Context API
   - Zustand
   - Redux / Redux Toolkit
   - Jotai / Recoil
   - React Query cache
   - URL state
   - Server state only

6. **Forms**
   - Plain React state
   - React Hook Form
   - Formik
   - Conform / Zod Form
   - Multiple validation libraries

7. **Validation / Schema**
   - Zod
   - Yup
   - Joi
   - Valibot
   - Hand-rolled
   - Mixed

8. **Error Handling**
   - `try/catch` returning null
   - Error boundaries
   - Result types
   - Thrown errors
   - Mixed styles within the same module

9. **Logging / Observability**
   - `console.log`
   - Custom logger
   - Sentry direct calls
   - Multiple sinks

10. **Routing**
    - File-based router
    - Programmatic router
    - Link-based vs imperative navigation mixed

11. **Styling**
    - Tailwind
    - CSS Modules
    - Styled-components / Emotion
    - Inline styles
    - Mixed

12. **Date / Time**
    - `Date` directly
    - `date-fns`
    - `dayjs`
    - `moment`
    - `luxon`
    - Mixed

13. **Icons**
    - Multiple icon libraries
    - Custom SVG components
    - Mixed

For each dimension, record:

- Distinct patterns found (e.g. "Zod + Yup + hand-rolled")
- Approximate count of each pattern
- Where the canonical usage lives (if any)
- Where the outliers live

---

# STEP 2 — PRIORITIZE CONSOLIDATIONS

Rank by impact:

🟥 HIGH — affects every feature (data fetching, auth, validation,
error handling, state)

🟧 MEDIUM — affects a significant subset (forms, UI primitives,
date/time, icons)

🟨 LOW — affects only a few files (one-off edge utilities)

Focus first on 🟥 HIGH and 🟧 MEDIUM.

---

# STEP 3 — PICK THE CANONICAL PATTERN

For each dimension, select one pattern as canonical:

- Pick the one most used
- Pick the one with the strongest type-safety story
- Pick the one with the best testing story
- Pick the one that fits the project's existing tooling best

If no clear winner:

- Pick the simplest viable pattern
- Document the rationale in a code comment or `docs/ARCHITECTURE.md`

If two patterns serve genuinely different purposes (e.g. SWR for
client cache + Server Actions for mutations):

- Document the boundary
- Standardize within each boundary

---

# STEP 4 — MIGRATE OUTLIERS

For each outlier pattern:

1. List every call site
2. Migrate call sites to the canonical pattern in batches
3. Keep migrations small and tested
4. Run TYPECHECK → LINT → TEST → BUILD after each batch
5. Add or update tests to cover the migrated paths

Do not migrate in a single massive change.

---

# STEP 5 — CONSOLIDATE COMPONENT LIBRARY

For UI primitives (Button, Modal, Input, etc.):

1. Identify the canonical variant (most usage, most tests)
2. Move the canonical variant to a shared location
   (e.g. `components/ui/`)
3. Migrate every consumer to the canonical
4. Delete the duplicates
5. If variants are legitimately needed (e.g. `<Button variant="primary"
   | "ghost" | "danger">`), make them props, not separate components
6. Document the design system in `docs/DESIGN_SYSTEM.md` if not done

---

# STEP 6 — CONSOLIDATE AUTH

If multiple auth patterns coexist:

1. Pick the canonical auth provider / helper
2. Migrate every page, server action, and API route to it
3. Ensure session handling is consistent
4. Ensure logout / refresh / error flows are consistent
5. Remove the dead pattern (after verifying zero callers)

---

# STEP 7 — CONSOLIDATE VALIDATION

If multiple validation libraries coexist:

1. Pick the canonical (Zod is usually a safe default)
2. Centralize shared schemas in `lib/schemas/` or similar
3. Reuse the same schemas on both client and server (single source of
   truth)
4. Remove dead validators

---

# STEP 8 — CONSOLIDATE ERROR HANDLING

Pick one style per layer:

- Server actions: typed Result objects OR thrown errors — be consistent
- Route handlers: HTTP status codes with JSON error body — consistent
  shape
- Components: error boundaries + per-page error state — consistent

Define a single error response shape (e.g. `{ error: { code, message } }`)
and use it everywhere.

---

# STEP 9 — DOCUMENT THE ARCHITECTURE

Create or update `docs/ARCHITECTURE.md` with:

- Chosen patterns per dimension
- Where canonical implementations live
- Examples of correct usage
- Examples of patterns that are intentionally NOT used
- How to add a new feature following the canonical patterns

---

# STEP 10 — REPAIR

For every consolidation:

1. Migrate incrementally
2. Keep tests green
3. Run the full verification after each batch
4. Update docs

---

# STEP 11 — VERIFY

After every change:

TYPECHECK → LINT → TEST → BUILD

Then:

- Walk a critical user journey
- Confirm no regression
- Confirm the app still feels coherent

---

# FINAL REPORT

## Architecture Status

Overall: `COHERENT / INCONSISTENT / CHAOTIC`

## Patterns Found

| Dimension | Patterns | Canonical | Outliers |
| --- | --- | --- | --- |
| Data Fetching | ... | ... | ... |
| Components | ... | ... | ... |
| Auth | ... | ... | ... |
| ... | ... | ... | ... |

## Consolidations Applied

List each consolidation with files changed.

## Dead Patterns Removed

List each removed pattern.

## Documentation Updated

List `docs/ARCHITECTURE.md` and other docs updated.

## Remaining Manual Actions

Anything requiring team agreement, training, or large refactors.

Do not claim a consolidation was applied unless it was actually
applied and verified.

---

# CORE ARCHITECTURE RULES

- Never force a single pattern where two patterns serve genuinely
  different purposes.
- Never refactor working features just for style.
- Never consolidate without a migration plan that keeps tests green.
- Never pick a canonical pattern without documenting the rationale.
- Never claim consistency without measuring it (grep / counts).
- Never break the build by removing an in-use pattern prematurely.
```