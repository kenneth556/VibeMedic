# Prompt 43: Regression Testing After Repairs

> **Stage 9 — Testing**  
> **Target:** Verification that prior VibeMedic fixes did not break existing functionality, either in covered flows or in adjacent ones  
> **Primary Output:** Regression Report with Re-Activated Test Suite & Verified Adjacent Flows

---

## Prompt Text

```text
# REGRESSION TESTING AFTER REPAIRS

You are verifying that the application still works correctly after
VibeMedic prompts have modified it.

Earlier prompts may have:

- Changed schemas (NOT NULL, FK, UNIQUE, indexes)
- Changed RLS policies
- Changed API contracts
- Renamed environment variables
- Refactored server actions
- Hardened auth / IDOR / webhook verification
- Replaced mocks with real provider calls
- Added timeouts, retries, idempotency guards

Each of those changes can subtly break something that was previously
working. Your job is to find those breaks and either fix them or
report them.

Do not invent regressions.
Do not undo legitimate fixes.

---

# STEP 1 — CAPTURE THE PRE-FIX BASELINE

If a baseline test suite existed before the repairs, capture:

- Last passing commit / branch
- Last passing test run output
- Any manually-verified happy paths

If no baseline exists, treat the current state as the baseline and
explicitly say so in the report.

---

# STEP 2 — RE-RUN THE EXISTING TEST SUITE

Run, in order:

TYPECHECK → LINT → TEST → BUILD

Record:

- Pass count
- Fail count
- Newly failing tests (compared to baseline)
- Flaky tests (pass sometimes, fail sometimes)
- Tests that were skipped or pending and are now runnable

For every newly failing test:

- Determine whether the failure is a real regression or a stale test
- Stale tests must be updated to match the new (correct) behavior, not
  reverted
- Real regressions must be fixed in code, not silenced

---

# STEP 3 — RE-WALK THE CRITICAL FLOWS

Use the End-to-End User Flow Verification prompt's flow list as a
guide.

For each 🟥 CRITICAL and 🟧 HIGH flow:

1. Walk the happy path
2. Walk the most common failure path
3. Confirm the failure mode is still handled gracefully
4. Confirm the loading / success / error / empty states still work

Pay special attention to flows that cross any layer that was modified:

- Schemas → flows that touch the modified tables
- RLS → flows that depend on row visibility
- API contracts → flows that depend on response shape
- Auth → flows that depend on session handling
- Webhooks → flows that depend on event processing
- Env vars → flows that depend on third-party calls

---

# STEP 4 — DIFF-DRIVEN REGRESSION HUNT

For every file changed by recent repairs:

1. List the file and the nature of the change
2. Identify callers / consumers of that file
3. Inspect each caller for:
   - Stale assumptions about return shape
   - Stale assumptions about column names
   - Stale assumptions about env var names
   - Stale assumptions about status codes
   - Hardcoded values that should now come from a new source
4. For each caller that broke, fix it

If you cannot confidently determine the callers, do a repo-wide
search for imports and usages.

---

# STEP 5 — DATA-DRIVEN REGRESSION HUNT

For every migration applied:

1. Confirm the migration ran cleanly on a fresh DB
2. Confirm existing rows still satisfy the new constraints
3. Confirm queries that previously worked still return the expected
   shape
4. Confirm RLS policies still allow the intended access patterns
5. Confirm new NOT NULL columns have safe defaults
6. Confirm new indexes don't break hot writes (watch write latency)

---

# STEP 6 — PROVIDER-DRIVEN REGRESSION HUNT

For every third-party integration that was changed:

- Re-trigger a real test-mode end-to-end interaction
- Confirm the request reaches the provider
- Confirm the response is handled correctly
- Confirm the webhook (if any) still verifies
- Confirm the success / failure / cancellation paths still grant /
  revoke correctly
- Confirm no new silent failure modes were introduced

---

# STEP 7 — UX & POLISH REGRESSIONS

Verify that hardening did not make the UI worse:

- Toast / error messages are still user-friendly
- Loading states still appear
- Error states still appear (instead of infinite loading)
- Empty states still appear
- Mobile layouts still work
- Keyboard navigation still works
- No "raw exception" leaks to the UI

If a repair introduced a regression, fix the regression without
removing the original fix.

---

# STEP 8 — SECURITY REGRESSIONS

Verify that other security controls still hold:

- RLS still enabled
- Service-role keys still server-only
- Webhook signatures still verified
- Ownership checks still enforced
- Auth still required on protected endpoints

The repair itself must not become the new vulnerability.

---

# STEP 9 — DOCUMENTATION REGRESSIONS

Verify that documentation reflects the new reality:

- `.env.example` matches the env vars code now reads
- `README.md` setup steps still work
- API docs (if any) match the actual contract
- Migration / schema docs match the actual schema

---

# STEP 10 — REPAIR THE REGRESSIONS

For every verified regression:

1. Fix the regression in code (do not revert the original fix)
2. Add a test that catches the regression
3. Confirm the fix holds under re-run
4. Document the regression in `REPAIR_STATUS.md` if the project keeps
  one

---

# STEP 11 — VERIFY

Re-run the entire pipeline:

TYPECHECK → LINT → TEST → BUILD → E2E (where feasible)

Confirm:

- All previously passing tests still pass
- All newly added tests still pass
- All 🟥 CRITICAL flows still deliver
- No new console errors or unhandled promise rejections
- No new Sentry / error monitoring events introduced by the repairs

---

# FINAL REPORT

## Regression Status

Overall: `CLEAN / MINOR REGRESSIONS / CRITICAL REGRESSIONS`

## Tests Re-Run

- Suite: pass / fail / flaky counts
- Newly failing tests: list
- Stale tests updated: list

## Flows Re-Walked

| Flow | Result | Notes |
| --- | --- | --- |
| ... | ✅ / 🟡 / 🔴 | ... |

## Diff-Driven Findings

List every caller of a modified file that needed a fix.

## Data-Driven Findings

List every migration that needed verification or backfill.

## Provider-Driven Findings

List every integration that needed a re-test.

## Documentation Drift

List docs that needed updates.

## Regressions Fixed

List each fix.

## Remaining Manual Actions

List anything that requires human review or provider config.

Do not claim the application is regression-free without re-running
the tests and re-walking the flows.

---

# CORE REGRESSION RULES

- Never revert a security fix to silence a regression.
- Never update a test just to make it pass; update it because the new
  behavior is correct.
- Never claim a regression is fixed without re-running it.
- Never skip the existing test suite; it is the fastest regression
  detector you have.
- Never assume the original fix is the only change since baseline.
```