# Prompt 23: Dead Code & Dependency Audit

> **Stage 3 — Build & Complete**  
> **Target:** Unused components, functions, routes, API clients, dependencies, duplicate components, obsolete feature flags, abandoned experiments  
> **Primary Output:** Dead Code Inventory, Duplicate-Component Map & Lean Dependency Tree

---

## Prompt Text

```text
# DEAD CODE & DEPENDENCY AUDIT

You are performing a complete dead-code and dependency audit of the
application. The goal is to remove or consolidate code, components,
routes, flags, and dependencies that are unused, duplicated, or
abandoned — without breaking anything that is actually in use.

Do not delete code based on guesswork.
Do not remove a dependency without proving nothing imports it.
Do not "consolidate" duplicate components if they serve different
purposes.

---

# STEP 1 — UNUSED CODE

Find code that is exported but never imported.

For every:

- Component (`.tsx`, `.jsx`, `.vue`, `.svelte`, `.ts`, `.js`)
- Hook / composable
- Utility function
- Server action / route handler
- API client module
- Type definition

…verify that at least one production file imports it.

Tools to use:

- `ts-prune`, `knip`, `ts-unused-exports`, `next-unused`
- ESLint `no-unused-vars`, `import/no-unused-modules`
- Language-server "find references"
- Grep across `src/`, `app/`, `pages/`, `components/`, `lib/`,
  `utils/`, `services/`, `hooks/`, `stores/`, `server/`

For each finding, classify:

- 🟢 SAFE TO REMOVE — exported, no consumers, no side effects
- 🟡 KEEP — has consumers OR is exported as public API OR is part of
  the type system OR is dynamically imported
- 🔴 UNCERTAIN — dynamic import, string-based reference, reflection,
  plugin system; investigate before removing

Never remove:

- Entry points (`index`, `app`, `main`, `layout`)
- Files referenced by `next.config`, `vite.config`, `tailwind.config`,
  `tsconfig.json` `paths`
- Files used by test setups
- Files reachable via dynamic `import()` or string-based dynamic
  require
- Files exported from barrel files that are themselves consumed
- Public type definitions consumed by downstream packages

For each 🟢 SAFE TO REMOVE file, delete the file and any imports of it
(there should be none).

For each 🟡 KEEP, leave a one-line comment explaining why it stays.

---

# STEP 2 — UNUSED ROUTES

Find every declared route and verify it is reachable.

- Next.js App Router: every file under `app/` and `pages/`
- React Router: every `<Route>` definition
- Express / Fastify / Hono: every route registration
- Supabase Edge Functions: every function in `supabase/functions/`

For each route, confirm:

- It is reachable from at least one link, redirect, programmatic
  navigation, or external integration
- It is not behind a feature flag that has been permanently off
- It is not a placeholder from initial scaffolding

Routes that fail any of these are dead.

---

# STEP 3 — UNUSED API CLIENTS

Find every API client module and verify it is used.

Examples:

- `lib/api/stripe.ts`
- `lib/api/flutterwave.ts`
- `lib/api/openai.ts`
- `services/auth.ts`

For each client:

- Count actual call sites in the codebase
- If zero call sites → dead
- If only test files use it → probably dead
- If used but with an identical twin → consolidate (see STEP 5)

---

# STEP 4 — UNUSED & DUPLICATE DEPENDENCIES

For every entry in `package.json` (or `pyproject.toml`,
`requirements.txt`, `Cargo.toml`, `go.mod`):

1. Verify it is imported / required in source
2. Verify it is not transitively shadowed by another dependency
3. Verify the version is the version actually imported
4. Verify it is not pinned to a deprecated or yanked version
5. Verify it does not duplicate a functionality already in another dep

Tools:

- `depcheck`
- `npm ls <pkg>` / `pnpm why <pkg>` / `yarn why <pkg>`
- `npx knip`
- Bundle analyzer (`@next/bundle-analyzer`, `rollup-plugin-visualizer`,
  `webpack-bundle-analyzer`)

For each finding:

- 🟢 SAFE TO REMOVE — nothing imports it
- 🟡 MOVE TO devDependencies — only used by tests, lint, typecheck
- 🟡 DUPLICATE — choose canonical, remove the other
- 🔴 UNCERTAIN — investigate (might be loaded via CDN, polyfill, or
  plugin)

Remove with `npm rm <pkg>` / `pnpm remove <pkg>` and confirm the
build still passes.

---

# STEP 5 — DUPLICATE COMPONENTS & UTILITIES

Find components or utilities that overlap.

Examples (look for these specifically):

- 3 different `Button` components in different folders
- 2 different `Modal` / `Dialog` implementations
- 2 different date-formatting helpers
- 2 different HTTP client wrappers
- 2 different auth helpers
- 2 different toast / notification systems
- 2 different icon wrappers

For each duplication:

1. Enumerate every variant with its usages
2. Determine which is the canonical implementation (the one with the
   most usage, the most tests, or the most features)
3. Replace non-canonical usages with the canonical one
4. Move the canonical one into a shared location (e.g.
   `components/ui/`, `lib/`)
5. Delete the non-canonical implementation
6. If both are genuinely needed (different intents), rename for
   clarity and document

DO NOT delete duplicates if they have different behavior that real
code depends on. Either consolidate behavior or keep both with clear
names.

---

# STEP 6 — OBSOLETE FEATURE FLAGS

Find every feature flag in the codebase.

For each flag:

- Is it permanently `true` or `false`?
- Is the gated code path reachable?
- Has the experiment ended?
- Is the flag referenced in any analytics, dashboard, or config?

If permanently `true`:

- Remove the flag check
- Inline the code
- Remove the flag definition
- Update tests

If permanently `false`:

- Delete the gated code path entirely (after confirming no consumer
  depends on it)
- Delete the flag definition

If the flag is genuinely a long-running experiment:

- Document it
- Add a reminder / comment to revisit
- Ensure the flag evaluation has a sensible default

---

# STEP 7 — ABANDONED EXPERIMENTS

Find:

- Branches in `pages/` or `app/` with `experimental.`, `_test`,
  `_old`, `_backup`, `_v1`, `_v2` suffixes
- TODO/FIXME comments older than a few commits
- Commented-out code blocks
- Hidden / draft routes
- Local-only features never promoted
- "Coming soon" pages with no backing feature

For each:

- Decide: keep, consolidate, or delete
- Remove abandoned scaffolding files
- Resolve old TODO/FIXME comments (do the work or move to a tracked
  issue)

---

# STEP 8 — REPAIR

For every verified dead / duplicate / abandoned item:

1. Make the removal in a focused commit / diff
2. Run TYPECHECK → LINT → TEST → BUILD after each major removal
3. Keep the change additive when in doubt — leave a comment
4. Update barrel files (`index.ts`) to match what is still exported
5. Update any docs / README that referenced the removed items

For each consolidation:

1. Identify the canonical implementation
2. Migrate all call sites to the canonical
3. Delete the duplicates
4. Add tests if the canonical is now under-covered

---

# STEP 9 — VERIFY

After every change:

TYPECHECK → LINT → TEST → BUILD

Then:

- Open the running app and walk a critical path manually
- Confirm no console errors
- Confirm no broken imports
- Confirm bundle size has shrunk (or at least not grown)
- Confirm type definitions still match consumer expectations

---

# FINAL REPORT

## Dead Code Status

Overall: `LEAN / NEEDS ATTENTION / HEAVY`

## Unused Code

List every file removed with reasoning.

## Unused Routes

List every dead route removed.

## Unused API Clients

List every dead client removed.

## Dependencies Removed

List every dependency removed.

## Duplicates Consolidated

List every duplicate merged into the canonical implementation.

## Feature Flags Cleaned

List every flag resolved.

## Abandoned Experiments Removed

List every dead experiment removed.

## Bundle / Build Impact

Before / after numbers where measurable.

## Remaining Manual Actions

Anything that requires human review (e.g. external usage outside
the repo).

Do not claim something was removed unless it was actually removed
and the app still builds and runs.

---

# CORE DEAD-CODE RULES

- Never remove code based on a guess — verify references first.
- Never delete a public type definition without checking consumers.
- Never remove a dependency without confirming it is unimported.
- Never consolidate duplicates without migrating call sites first.
- Never delete a route without grepping for `navigate()` /
  `router.push()` / `<Link href=...>` references.
- Never break the build by removing an entry point or config file.
- Never claim a code path is dead without proving it.
```