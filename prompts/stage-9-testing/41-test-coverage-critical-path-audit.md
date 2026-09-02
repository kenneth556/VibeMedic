# Prompt 41: Test Coverage & Critical Path Audit

> **Stage 9 — Testing**  
> **Target:** Identification of critical user journeys and verification that they are actually tested  
> **Primary Output:** Critical Path Coverage Matrix & Test Authoring Plan

---

## Prompt Text

```text
# TEST COVERAGE & CRITICAL PATH AUDIT

You are performing a complete test-coverage audit focused on the
application's most important user journeys.

"Coverage %" is not the goal. The goal is to confirm that the journeys
that can cost real money, real data, or real trust are actually
exercised by real tests.

Do not invent coverage gaps.
Do not write tests that only call a function and assert true.

---

# STEP 1 — IDENTIFY CRITICAL USER JOURNEYS

For every feature in the application, classify each as one of:

- 🟥 CRITICAL — money, auth, data integrity, irreversible actions
- 🟧 HIGH — important to product value but reversible
- 🟨 MEDIUM — useful features with safe defaults
- 🟩 LOW — cosmetic or rarely-used

For each 🟥 CRITICAL and 🟧 HIGH journey, list:

1. Journey name
2. Starting screen / route
3. Required user state (logged out / logged in / specific role)
4. End-to-end happy path steps
5. Most damaging failure modes
6. Existing tests (if any) that cover it
7. Test framework(s) currently configured (Vitest, Jest, Playwright,
   Cypress, Supertest, etc.)
8. Confidence level that the journey is exercised today

Common journeys to evaluate:

- Signup (email, magic link, OAuth, phone)
- Login
- Logout
- Password reset / change
- 2FA / OTP
- Email verification
- Onboarding
- Profile update
- Create resource (post, project, order, listing, ticket)
- Edit resource
- Delete resource
- Upload file / image / video
- Search
- Filter / sort / paginate
- Checkout / payment
- Subscription upgrade / downgrade / cancel
- Refund
- Admin moderation
- Permission boundaries (regular user vs admin)
- Multi-tenant isolation (org A user cannot see org B data)
- Webhook processing
- Background job execution

---

# STEP 2 — TEST PYRAMID CHECK

Verify the project has the right layers:

- Unit tests for utilities, pure functions, validators
- Integration tests for server actions / API endpoints / RPCs
- End-to-end tests for the top critical user journeys
- Database tests for constraints, triggers, RLS
- Webhook tests using real signature verification

If the project has only one layer (e.g. unit only), call this out.

---

# STEP 3 — GAP ANALYSIS

For each CRITICAL / HIGH journey, ask:

> Is there a test that fails when this journey is broken?

If the answer is no, the journey is effectively untested regardless of
coverage %.

For each gap, recommend:

- The test type to add (unit / integration / e2e)
- The minimum assertions required to call it covered
- Where the test should live in the repo
- Whether it requires fixtures, factories, or seeded DB state

---

# STEP 4 — AUTHORING PLAN

For the highest-priority gaps (typically 🟥 CRITICAL), write the
tests in this sequence until time / scope is exhausted:

1. Auth journeys (signup, login, password reset)
2. Authorization (regular user cannot access admin; user A cannot
   read user B's data)
3. Payment / checkout / webhook
4. Create / edit / delete of the core resource
5. File upload
6. Search / filter
7. Background jobs and webhooks

Each test must:

- Set up only the data it needs (use factories / fixtures)
- Act through the real code path (not a shortcut mock)
- Assert on observable side effects (DB rows, emails sent, webhooks
  fired, status codes, UI text)
- Clean up after itself (or use a transaction that is rolled back)
- Be deterministic (no real network, no real time, no real randomness
  without a seed)

DO NOT write tests that:
- Only assert `expect(true).toBe(true)`
- Mock the very thing they are supposed to test
- Pass even when the feature is broken
- Depend on order with other tests
- Require real provider credentials to run in CI

---

# STEP 5 — TEST INFRASTRUCTURE

Verify the project has:

- A test command defined in `package.json` (`test`, `test:e2e`,
  `test:integration`)
- A way to spin up a local database (Supabase local, Docker, etc.)
- Factories / fixtures for creating users, organizations, etc.
- A consistent pattern for resetting state between tests
- CI wiring that runs the test suite on every PR

If any of these are missing, add or document them.

---

# STEP 6 — DETERMINISM & ISOLATION

Audit existing tests for:

- Tests that share mutable state
- Tests that depend on time / date / timezone
- Tests that hit the real network (should be mocked or use a sandbox)
- Tests that depend on previous tests having run
- Tests that fail intermittently

Fix:

- Use `vi.useFakeTimers()` / equivalent
- Mock external HTTP calls
- Use unique identifiers per test run
- Isolate DB state per test (transaction rollback or schema reset)

---

# STEP 7 — PERMISSIONS & ISOLATION TESTS

Especially important: write tests that confirm:

- A regular user cannot call admin-only endpoints
- A user from organization A cannot read or mutate data in
  organization B
- A user cannot use someone else's ID in a URL to access their data
  (IDOR)
- A logged-out user cannot reach protected endpoints

These tests should pass under normal config but FAIL if RLS / auth is
removed.

---

# STEP 8 — PAYMENT TESTS

Cover at minimum:

- Successful checkout grants access exactly once
- Duplicate webhook delivery does NOT grant access twice
- Invalid webhook signature is rejected with 4xx
- Mismatched amount is rejected
- Cancelled / failed checkout does not grant access
- Refund flow correctly updates DB and revokes access where required

(See the Payment Flow Audit prompt for the lifecycle.)

---

# STEP 9 — REPAIR

For every verified gap:

1. Add the test using the project's existing framework(s)
2. Run it; confirm it FAILS against the current code if the journey
   is actually broken
3. Fix the underlying bug
4. Confirm the test now passes
5. Keep the test — do not delete

If a gap cannot be tested (e.g. real AI provider, real KYC vendor):

- Abstract the call behind an interface
- Test against the interface with a fake implementation
- Keep one smoke test that hits the real provider in CI, gated behind
  a flag

---

# STEP 10 — VERIFY

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then:

- Show the count of new tests added
- Show the critical journeys now covered
- Show any remaining gaps and the plan to close them

---

# FINAL REPORT

## Test Coverage Status

Overall: `ADEQUATE / GAPS REMAIN / CRITICAL GAPS`

## Critical Journeys

| Journey | Test Exists? | Type | File | Confidence |
| --- | --- | --- | --- | --- |
| Signup | ... | ... | ... | ... |

## Gaps Closed

List every test added.

## Gaps Remaining

List unaddressed gaps with priority.

## Permission Tests Added

List IDOR / authz tests added.

## Payment Tests Added

List payment / webhook tests added.

## Remaining Manual Actions

List anything that requires CI setup, infra, or manual review.

Do not claim a journey is tested unless a real test for it exists and
passes.

---

# CORE TESTING RULES

- Never write a test that cannot fail.
- Never mock the thing you are trying to test.
- Never rely on test order.
- Never trust a coverage % as proof of safety.
- Never skip permission tests — they catch the worst bugs.
- Never run payment tests against live provider keys.
- Never claim a test passes without running it.
```