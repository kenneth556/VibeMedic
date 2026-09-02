# Prompt 46: VibeMedic Final Doctor's Checkup 🩺

> **Stage 11 — Production**  
> **Target:** Whole-application verification across every layer after all other VibeMedic prompts have run  
> **Primary Output:** Definitive Ship / Don't Ship Verdict & Final Doctor's Report

---

## Prompt Text

```text
# VIBEMEDIC FINAL DOCTOR'S CHECKUP 🩺

You are performing the **final**, non-destructive whole-application
verification after every other VibeMedic prompt has been executed.

This prompt is a **doctor's checkup**, not a surgery.

It does **not** rewrite features.
It does **not** introduce new dependencies.
It does **not** make sweeping refactors.

It inspects the entire application, cross-checks every layer, and
answers one question:

> **"Is this thing actually ready to ship?"**

If the answer is no, it produces a precise, prioritized punch list
of the remaining issues with clear ownership and verification steps.

If the answer is yes, it produces a Ship Manifest that records what
was verified, how, and by whom — so the team can ship with
confidence.

Do not invent failures.
Do not invent successes.
Do not declare ship-ready if there is a 🔴 remaining.

---

# THE FULL CHECKUP LIFECYCLE

Verify the entire application end-to-end through this exact
sequence:

CODE
↓
 DATABASE
 ↓
 RLS
 ↓
 APIs
 ↓
 SECURITY
 ↓
 PAYMENTS
 ↓
 WEBHOOKS
 ↓
 TESTS
 ↓
 UI / UX
 ↓
 MOBILE
 ↓
 PWA
 ↓
 PERFORMANCE
 ↓
 PRODUCTION
 ↓
 VERIFY

For each layer, record:

- Layer
- Verdict (✅ / 🟡 / 🔴 / N/A)
- Last VibeMedic prompt that touched it
- Last manual verification date
- Evidence of verification
- Open issues (if any)

If a layer cannot be verified (e.g. no test infra exists), say so
explicitly and mark it 🟡 — that itself is a launch consideration.

---

# STEP 1 — CODE

Verify:

- TYPECHECK passes
- LINT passes
- No debug `console.log` left in production code paths
- No `TODO` / `FIXME` / `XXX` / `HACK` markers in critical paths
- No commented-out blocks of important logic
- No dead exports in critical modules
- Consistent code style across the codebase
- Architecture patterns are consistent (no leftover mixed patterns)

Verdict.

---

# STEP 2 — FEATURES

Cross-reference with the Master Feature Inventory (prompt 16) and
Deep Feature Verification (prompt 17):

- Every 🟥 CRITICAL feature is 🟢 Complete
- Every 🟧 HIGH feature is 🟢 Complete or has an explicit deferral
- No 🟡 Partial features in critical user journeys
- No 🔴 Not Started features in the launch scope

Verdict.

---

# STEP 3 — DATABASE

Cross-reference with the Database & Backend Audit (prompt 4) and
Database Integrity Audit (prompt 37):

- Schema is migrated cleanly
- Migrations are idempotent
- No orphan rows
- Foreign keys correct
- Cascades correct
- Indexes exist for hot queries
- RLS policies tested

Verdict.

---

# STEP 4 — RLS

For every public-schema table that contains user data:

- RLS is enabled
- Policies use `(SELECT auth.uid())` for performance
- Policies have consistent USING + WITH CHECK
- Storage RLS aligned with table RLS
- No accidental `USING (true)` on sensitive tables
- No `SECURITY DEFINER` functions with weak `search_path`

Test:

- User A cannot read / mutate user B's rows
- Logged-out user cannot read protected rows
- Admin role works as intended

Verdict.

---

# STEP 5 — APIs

Cross-reference with the API Contract Audit (prompt 10), API
Integration Audit (prompt 31), and Reliability (prompt 33):

- Every endpoint documented
- Every endpoint has auth + authz where required
- Every endpoint validates input
- Every endpoint returns consistent error shape
- Every external call has timeout + error handling
- Every state-changing endpoint is idempotent where required

Verdict.

---

# STEP 6 — SECURITY

Cross-reference with Application Security (prompt 43) and API
Security (prompt 32):

- No exposed secrets
- CSP, HSTS, X-Frame-Options, Referrer-Policy, Permissions-Policy
- CSRF on mutating endpoints
- IDOR / BOLA prevented
- File upload validation
- SSRF protection
- Dependency vulnerabilities patched or accepted-risked
- Audit logs for sensitive actions

Verdict.

---

# STEP 7 — PAYMENTS

Cross-reference with the Payment Flow Audit (prompt 36):

- Server-side transaction verification on every flow
- Webhook signatures verified
- Idempotency enforced (no duplicate grants)
- Subscription state machine validated
- Refund flow works
- Test / live keys separated
- Live keys server-only

Test with a real test-mode transaction end-to-end.

Verdict.

---

# STEP 8 — WEBHOOKS

Cross-reference with the Webhook Audit (prompt 34):

- Every webhook endpoint signature-verified
- Idempotency enforced via event ID
- Dead-letter / replay strategy
- DB writes inside a transaction
- Order of events handled safely

Test:

- Valid webhook → 200, DB updated
- Invalid signature → 4xx, DB unchanged
- Duplicate webhook → no duplicate grant

Verdict.

---

# STEP 9 — TESTS

Cross-reference with Test Coverage & Critical Path (prompt 38) and
E2E User Flow Verification (prompt 39):

- Auth journeys tested
- Payment journeys tested
- Permission boundaries tested
- Critical CRUD journeys tested
- Background jobs / webhooks tested
- Tests are deterministic and isolated

Verdict.

---

# STEP 10 — UI / UX

Cross-reference with UI/UX Design Audit (prompt 22), Final Production
Polish (prompt 28), and User Journey Audit (prompt 27):

- Typography and spacing consistent
- Shared primitives in use
- Loading / success / error / empty states everywhere
- User journey feels coherent
- No "AI-generated" roughness

Verdict.

---

# STEP 11 — MOBILE

Cross-reference with the Mobile Experience Pass (prompt 26) and
Responsive Design Audit (prompt 15):

- Touch targets ≥ 44×44 px
- No horizontal scroll
- Mobile navigation works
- Virtual keyboard friendly
- Safe-area insets respected

Verdict.

---

# STEP 12 — PWA (IF APPLICABLE)

Cross-reference with PWA Conversion (prompt 25):

- Manifest valid
- Service Worker installed and versioned
- Offline shell works
- Installable

If not a goal, mark N/A.

---

# STEP 13 — PERFORMANCE

Cross-reference with the Performance Audit (prompt 13):

- LCP < 2.5s on mid-tier mobile + 4G
- TTI reasonable
- Initial JS bundle within budget
- DB queries indexed
- No N+1
- Caching headers correct

Measure, do not estimate.

Verdict.

---

# STEP 14 — PRODUCTION

Cross-reference with the Production Readiness Audit (prompt 46):

- Environment validated at startup
- Logging structured and clean of secrets
- Monitoring and alerting wired
- Backups tested
- Runbooks exist
- Rate limiting in place
- Operational failure modes documented

Verdict.

---

# STEP 15 — VERIFY

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then:

- A real test-mode payment end-to-end
- A real test webhook delivery
- A backup-and-restore test
- A cold-start deploy to a production-shaped environment
- A monitored alert firing on injected failure
- A rollback drill

If any of these fails, mark the corresponding layer 🔴 and stop.

---

# STEP 16 — REMAINING WORK

For any 🔴 or 🟡 layer, produce a precise punch list:

| # | Layer | Issue | File / Config | Owner | Fix Effort | Fix By |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | ... | ... | ... | ... | S/M/L | ... |

For each punch list item:

- Owner
- Effort estimate
- Date the issue was identified
- Date by which it must be resolved (before launch / this week /
  backlog)

Do not include vague items. Every item must be:

- Verifiable
- Owned by a real person or team
- Time-bound

---

# STEP 17 — SHIP MANIFEST (if verdict is ✅)

Produce a Ship Manifest suitable for posting in the launch channel:

```
SHIP MANIFEST — [Application Name] — [Date]

Verdict: ✅ READY TO SHIP

Verified:
- Typecheck / Lint / Test / Build: PASS
- Auth flows: PASS
- Payment flows: PASS (test mode)
- Webhook flows: PASS
- RLS isolation: PASS
- Critical user journeys: PASS
- Performance budget: PASS
- Monitoring / alerting: WIRED
- Backups: TESTED
- Rollback: REHEARSED

Known accepted risks:
- ...
- ...

On-call:
- ...

Rollback plan:
- ...

Sign-offs:
- Engineering: __________
- Product: __________
- Security: __________ (if applicable)
```

---

# FINAL REPORT

## Ship Verdict

`SHIP / SHIP WITH RISK / HOLD`

## Layer Scorecard

| Layer | Verdict | Evidence | Open Issues |
| --- | --- | --- | --- |
| Code | ... | ... | ... |
| Features | ... | ... | ... |
| Database | ... | ... | ... |
| RLS | ... | ... | ... |
| APIs | ... | ... | ... |
| Security | ... | ... | ... |
| Payments | ... | ... | ... |
| Webhooks | ... | ... | ... |
| Tests | ... | ... | ... |
| UI / UX | ... | ... | ... |
| Mobile | ... | ... | ... |
| PWA | ... | ... | ... |
| Performance | ... | ... | ... |
| Production | ... | ... | ... |

## Remaining Work

Punch list with owner / effort / date.

## Ship Manifest (if applicable)

Included.

## Sign-Offs

Who has signed off and when.

---

# CORE FINAL CHECKUP RULES

- Never declare "ship" if any layer is 🔴.
- Never declare "ship" without running TYPECHECK → LINT → TEST →
  BUILD.
- Never declare a payment flow verified without a real test-mode run.
- Never declare RLS verified without actually testing cross-user
  isolation.
- Never declare backups verified without testing a restore.
- Never declare monitoring verified without firing a real alert.
- Never claim evidence you do not have.
- Never rewrite the application — this is a checkup, not surgery.
- Never approve launch alone without the documented sign-offs.
```