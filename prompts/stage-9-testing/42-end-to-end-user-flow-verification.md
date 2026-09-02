# Prompt 42: End-to-End User Flow Verification

> **Stage 9 — Testing**  
> **Target:** Major user workflows traced from first click to final persisted state, including real failure modes  
> **Primary Output:** Verified End-to-End Flow Report with Reproducible Steps & Fixes

---

## Prompt Text

```text
# END-TO-END USER FLOW VERIFICATION

You are walking through the application's major workflows as if you were
a real user, on a real device, on a real network, in a real browser.

Your job is to actually attempt each critical journey, observe where it
breaks, and either repair it or document the gap with a precise
reproduction.

This is not unit testing. This is not contract testing. This is the
question:

> "If a real person does this, does the system actually deliver?"

Do not invent problems.
Do not rewrite working flows unnecessarily.

---

# STEP 1 — IDENTIFY THE FLOWS TO WALK

Pick the top journeys, ranked by user impact and damage when broken:

🟥 CRITICAL (must walk):

- Signup (each method: email/password, magic link, OAuth, phone/OTP)
- Login / logout / session persistence
- Password reset
- Email verification
- Onboarding
- First real action after signup (create core resource)
- Checkout / payment
- Subscription lifecycle
- File upload
- Permission boundary (user A → user B)
- Webhook processing end-to-end

🟧 HIGH:

- Search / filter / sort
- Edit / update core resource
- Delete core resource
- Notification flows (email / SMS / push)
- Admin moderation
- Background job execution
- Multi-tenant boundary

---

# STEP 2 — PREPARE THE ENVIRONMENT

For each flow:

- Reset to a known starting state (fresh test user / DB snapshot)
- Use seeded data only where the flow requires it
- Disable or sandbox flaky third-party providers where possible
- Use a real browser / device where UI behavior matters
- Note the environment (OS, browser, viewport, network conditions)

---

# STEP 3 — WALK EACH FLOW

For each flow, record:

1. **Setup**
   - Starting state
   - Seed data required
   - User role / permissions

2. **Steps attempted**
   - Numbered, click-by-click
   - Exact URLs / routes visited
   - Exact inputs entered
   - Exact responses observed

3. **Observations**
   - Did the loading state appear?
   - Did the success state appear?
   - Did the error state appear correctly on injected failure?
   - Did the empty state appear when no data exists?
   - Was anything logged to console / Sentry / etc.?

4. **Result**
   - ✅ Pass — delivered as intended
   - 🟡 Partial — works but with rough edges
   - 🔴 Fail — broken at a specific step
   - ⚫ Blocked — cannot test (missing infra / data)

For 🔴 Fail and 🟡 Partial:

- Record the exact step that failed
- Capture the error message, screenshot, or DB row
- Inspect the code path
- Determine the root cause

---

# STEP 4 — REPAIR VERIFIED FAILURES

For every verified failure:

1. Fix the underlying code path (UI → State → API → DB → Persistence)
2. Preserve existing functionality
3. Add a regression test that fails without the fix and passes with it
4. Re-walk the flow manually to confirm the fix

Do not "fix" by hiding the error from the user. Fix the actual logic.

---

# STEP 5 — FAILURE-MODE INJECTION

For each critical flow, also attempt:

- Network drop mid-flow
- Slow network (throttled)
- Provider timeout
- Provider 5xx
- Provider 429 (rate limit)
- Webhook out-of-order or duplicated
- User double-clicking the submit button
- User navigating away and coming back
- User using stale tab from yesterday
- User on a logged-out session hitting a protected route
- User with no data seeing the empty state
- User with massive data seeing pagination / scrolling

Record which failure modes break the flow and which are handled
gracefully.

For each broken failure mode:

- Either fix it
- Or document it as a known limitation with a recommendation

---

# STEP 6 — CROSS-DEVICE / CROSS-VIEWPORT CHECK

For each critical flow, also verify at minimum:

- Mobile (small viewport)
- Tablet
- Desktop
- Touch interactions where applicable (mobile)
- Keyboard-only navigation (a11y)

---

# STEP 7 — CROSS-USER / CROSS-TENANT CHECK

For each flow:

- Can user A see / mutate user B's data? (must be NO)
- Can a logged-out user reach the protected route? (must be NO)
- Can a free-tier user reach a paid feature? (must be NO unless
  intentional and clearly marked)
- Can a non-admin reach an admin route? (must be NO)

For each YES where answer should be NO → 🔴 Fail.

---

# STEP 8 — PERSISTENCE CHECK

For flows that claim to save data:

- Refresh the page → does the data still appear?
- Log out and back in → does the data still appear?
- Switch devices → does the data sync?
- Edit and refresh → is the edit visible?
- Delete and refresh → is the data really gone?

For each flow, the answer must be YES where the product promises it.

---

# STEP 9 — NOTIFICATION CHECK

For flows that should trigger notifications:

- Did the email actually send? (check provider dashboard / inbox)
- Did the SMS actually send?
- Did the push notification fire?
- Did the in-app notification appear?
- Did the user receive the right notification (not someone else's)?
- Is the notification idempotent (no duplicates on retry)?

---

# STEP 10 — REGRESSION SCENARIOS

While walking flows, watch for regressions caused by recent fixes:

- Other buttons on the same page broken
- Other resources broken by the same migration / change
- Other roles broken by the same policy change
- Other environments broken (staging, prod)

---

# STEP 11 — REPAIR

For every verified failure:

1. Trace the full lifecycle UI → State → API → DB → Persistence
2. Identify the weakest link
3. Fix it minimally and safely
4. Add or extend a test
5. Re-run the flow

For issues that cannot be fixed automatically:

- Document the failure
- Document the precise reproduction
- Document the proposed fix
- Document the manual steps the developer must take

---

# STEP 12 — VERIFY

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then re-walk every flow that previously failed.

Confirm:

- Loading / Success / Error / Empty states all work
- Persistence works across reload, logout/login, and devices
- Permission boundaries hold
- Notifications fire correctly
- No regressions in other flows

---

# FINAL REPORT

## Flow Verification Status

Overall: `HEALTHY / NEEDS ATTENTION / CRITICAL FAILURES`

## Flows Walked

| Flow | Result | Notes |
| --- | --- | --- |
| Signup (email/password) | ✅ / 🟡 / 🔴 | ... |
| ... | ... | ... |

## Failures Fixed

List each failure with file and fix applied.

## Failures Documented

List failures that need human intervention.

## Permission Boundaries Verified

List each boundary and its test outcome.

## Persistence Verified

List each persistence claim and its test outcome.

## Failure Modes Covered

List injected failure modes and how they were handled.

## Remaining Manual Actions

List anything that needs manual config / data backfill / review.

Do not claim a flow works unless you actually walked it end-to-end.

---

# CORE E2E RULES

- Never declare success without walking the full path.
- Never fix only the symptom (toast copy) when the cause is elsewhere.
- Never trust a green test suite alone — verify by hand.
- Never allow a silent failure mode on a critical flow.
- Never claim permission isolation without testing it.
- Never claim persistence without refreshing the page.
- Never claim a flow works on mobile without trying mobile.
```