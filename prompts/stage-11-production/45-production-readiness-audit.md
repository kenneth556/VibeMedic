# Prompt 45: Production Readiness Audit

> **Stage 11 — Production**  
> **Target:** Environment, logging, monitoring, error handling, security, database, APIs, payments, backups, performance, PWA, accessibility, mobile, SEO, deployment, rate limiting, operational failures  
> **Primary Output:** Production Readiness Scorecard & Launch Blockers List

---

## Prompt Text

```text
# PRODUCTION READINESS AUDIT

You are performing the final readiness review of the application
*before it goes live*. The question is simple:

> "If this application went live tomorrow, what would break, embarrass
> us, cost us money, or expose users?"

Your job is to find every last operational, security, performance, and
UX weakness that could turn into an incident at launch, and to either
fix verified issues or document them as launch blockers.

Do not invent launch blockers.
Do not rewrite working systems unnecessarily.
Do not approve launch for an application that is not actually ready.

---

# OBJECTIVES

Inspect and verify readiness across every layer that matters in
production:

- Environment configuration
- Logging
- Monitoring / alerting
- Error handling
- Security (defense in depth)
- Database (schema, RLS, backups)
- APIs
- Payments
- Backups & disaster recovery
- Performance
- PWA (if applicable)
- Accessibility
- Mobile experience
- SEO (where relevant)
- Deployment & release process
- Rate limiting
- Operational failure modes

For each category, produce a verdict:

- ✅ READY
- 🟡 NEEDS ATTENTION
- 🔴 LAUNCH BLOCKER

Only "READY" means the application can launch with confidence in that
category.

---

# STEP 1 — ENVIRONMENT CONFIGURATION

Verify:

- `.env.example` is complete, accurate, and current
- No secrets in source, build output, or git history
- Required env vars are validated at startup (fail-fast)
- Production env values exist and are scoped to production
- Test, staging, production credentials are isolated
- `NODE_ENV=production` is honored everywhere
- Time zones / locales handled correctly
- Default feature flags set correctly for production

Tools:

- `git grep` for secret patterns
- Bundle inspection for accidentally inlined secrets
- Startup smoke test in production-shaped environment

Verdict: 🟢 / 🟡 / 🔴

---

# STEP 2 — LOGGING

Verify:

- Application emits structured logs (JSON or equivalent)
- Logs include correlation IDs / request IDs
- Logs do not contain PII / PHI / secrets / tokens / cards
- Log levels are appropriate (info / warn / error)
- Errors log with stack traces and context
- Audit logs exist for sensitive actions (auth, payment, admin)
- Log volume is reasonable (no debug spam in production)
- Logs are shipped to a central sink (CloudWatch, Better Stack, Datadog,
  Logtail, Sentry logs, etc.)
- Log retention policy defined

Verdict.

---

# STEP 3 — MONITORING & ALERTING

Verify:

- Uptime monitoring on critical endpoints (webhook endpoints, login,
  checkout, API base)
- Health check endpoint exists and reports DB + dependency health
- APM / tracing enabled (Sentry, Datadog, OpenTelemetry, etc.)
- Alerts wired for:
  - Error rate spikes
  - Latency spikes (p95 / p99)
  - Failed background jobs
  - Failed webhooks
  - Failed payments
  - Provider outages (Stripe status, etc.)
- Alert routing (email, Slack, PagerDuty)
- On-call rotation exists (or is acknowledged as not yet)
- Dashboard for core business metrics exists (even a simple one)

Verdict.

---

# STEP 4 — ERROR HANDLING

Verify:

- Global error boundaries in the UI
- Server-side error middleware returns safe error responses
- External API failures handled (timeouts, retries, fallbacks)
- Database failures handled (connection drops, deadlocks)
- Background job failures retried with idempotency
- User-facing error messages are clear and actionable
- No raw stack traces returned to clients
- No infinite loading states

Verdict.

---

# STEP 5 — SECURITY

Cross-reference with the Application Security Audit and API Security
Audit prompts. Verify, at minimum:

- RLS enabled on every user-data table
- Service-role keys server-only
- Webhook signatures verified
- Payment verification server-side
- No exposed secrets in client bundles
- CSP, HSTS, X-Frame-Options, Referrer-Policy, Permissions-Policy
- CSRF protection on mutating endpoints
- Rate limiting on auth, OTP, AI, search, uploads
- File upload validation
- IDOR prevention
- Dependency vulnerabilities patched or accepted-risked
- Dependency supply chain verified

Verdict.

---

# STEP 6 — DATABASE

Verify:

- Schema migrated cleanly from empty
- Migrations are idempotent
- RLS policies correct and tested
- Indexes exist for hot queries (especially RLS predicates)
- Foreign keys and cascades correct
- Backups configured (managed snapshots or pg_dump schedule)
- Backup restoration tested
- Connection pool sized for expected traffic
- Statement timeouts configured
- Slow-query log enabled

Verdict.

---

# STEP 7 — APIs

Verify:

- API contract documented and current
- Validation on every input
- Authentication on every protected route
- Authorization on every privileged action
- Error response shape consistent
- Status codes correct
- Timeouts configured
- Rate limits configured
- Idempotency on write endpoints where needed

Verdict.

---

# STEP 8 — PAYMENTS

Cross-reference with the Payment Flow Audit prompt. Verify:

- Server-side transaction verification on every flow
- Webhook signatures verified
- Idempotency enforced (no duplicate grants)
- Subscription state machine validated
- Refund flow works
- Failed / cancelled payments do not grant access
- Test mode vs live mode correctly separated
- No live keys in non-production env
- Receipts / invoices generated only on verified success

Verdict.

---

# STEP 9 — BACKUPS & DISASTER RECOVERY

Verify:

- Database backup schedule exists and is monitored
- Backup retention matches compliance / business needs
- Restoration has been tested at least once
- Object storage redundancy configured (Supabase / S3 / R2 / etc.)
- Recovery Time Objective (RTO) and Recovery Point Objective (RPO)
  documented
- Runbook for "DB is down" exists
- Runbook for "provider X is down" exists
- Runbook for "credentials leaked" exists

Verdict.

---

# STEP 10 — PERFORMANCE

Cross-reference with the Performance Audit prompt. Verify:

- Initial JS bundle within budget
- Initial route load within budget (LCP < 2.5s on 4G)
- Time to Interactive reasonable
- Database queries indexed
- No N+1 queries
- Image optimization enabled
- Caching headers correct
- Realtime / polling usage bounded
- Cold start time acceptable for the chosen runtime

Verdict.

---

# STEP 11 — PWA (IF APPLICABLE)

Verify:

- Web App Manifest valid
- Service Worker registered and versioned
- Offline shell works for known routes
- Install prompt appears (where supported)
- Background sync (if claimed) actually works
- App icons and splash screens in place
- Cache strategy documented

If PWA is not a goal for this application, mark this category N/A.

---

# STEP 12 — ACCESSIBILITY

Cross-reference with the Accessibility Audit prompt. Verify:

- WCAG 2.1 AA met on key flows
- Keyboard navigation complete
- Focus visible
- ARIA labels meaningful
- Color contrast ≥ 4.5:1 for text
- Form errors announced
- No keyboard traps

Verdict.

---

# STEP 13 — MOBILE EXPERIENCE

Cross-reference with the Mobile Experience Pass prompt. Verify:

- Touch targets ≥ 44×44 px
- No horizontal scroll
- Drawers / sheets work on small viewports
- Virtual keyboard does not break layouts
- One-handed usability considered
- Safe-area insets respected

Verdict.

---

# STEP 14 — SEO (IF APPLICABLE)

Verify:

- Meta tags (`title`, `description`, OG, Twitter)
- Canonical URLs
- Sitemap (if multi-page)
- robots.txt
- Structured data (where relevant)
- Server-rendered or statically generated HTML for indexable routes
- 404 / 500 pages exist and are sensible

If SEO is not a goal, mark N/A.

---

# STEP 15 — DEPLOYMENT & RELEASE PROCESS

Verify:

- CI runs TYPECHECK → LINT → TEST → BUILD on every PR
- Production deployments are reproducible from a clean clone
- Migrations run automatically and idempotently
- Rollback strategy exists
- Feature flags available for safe rollouts / kill switches
- Environment variables set in the hosting platform (Vercel, Fly,
  Render, AWS, etc.)
- Domain, TLS, and DNS configured
- Monitoring / error reporting enabled on production builds
- Source maps uploaded (gated to auth where appropriate)

Verdict.

---

# STEP 16 — RATE LIMITING

Verify:

- Login / signup rate-limited
- Password reset / OTP rate-limited
- Search / AI / upload endpoints rate-limited
- Webhook endpoints rate-limited at the edge
- Payment initialization rate-limited
- Admin endpoints rate-limited
- Rate limits tested under simulated load

Verdict.

---

# STEP 17 — OPERATIONAL FAILURE MODES

For each external dependency, document:

- What happens if it goes down?
- Is there a fallback or graceful degradation?
- Is there a status page / communication plan?
- Are customers notified of known issues?

Dependencies to consider:

- Auth provider (Clerk / Supabase Auth / Auth0)
- Database (Supabase / Postgres)
- Payment provider (Stripe / Flutterwave / Paystack)
- Email provider (Resend / Postmark / SES)
- SMS provider (Termii / Twilio)
- AI provider (OpenAI / Anthropic)
- Storage (Supabase Storage / S3 / Cloudinary)
- Realtime (Pusher / Supabase Realtime)
- Monitoring / error reporting (Sentry)
- Analytics (PostHog / Plausible)

Verdict.

---

# STEP 18 — REPAIR LAUNCH BLOCKERS

For every 🔴 LAUNCH BLOCKER:

1. Fix the underlying issue minimally and safely
2. Add a test or runbook entry that catches the regression
3. Verify in production-shaped environment

For every 🟡 NEEDS ATTENTION:

1. Triage: must-fix-before-launch, must-fix-this-week, nice-to-have
2. Document the must-fix-before-launch items as launch blockers

For each remaining issue that cannot be fixed in time:

- Document precisely
- Get explicit human sign-off
- Track with a clear owner and date

---

# STEP 19 — VERIFY

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then:

- Run a production-shaped smoke test
- Walk the most critical user journey
- Trigger one real webhook from a sandbox provider
- Trigger one real test-mode payment
- Confirm monitoring / alerting is wired
- Confirm backup / restore tested
- Confirm rollback rehearsed

---

# FINAL REPORT

## Production Readiness

Overall: `READY TO LAUNCH / LAUNCH WITH RISK / NOT READY`

## Category Scorecard

| Category | Verdict | Notes |
| --- | --- | --- |
| Environment | ... | ... |
| Logging | ... | ... |
| Monitoring | ... | ... |
| Error Handling | ... | ... |
| Security | ... | ... |
| Database | ... | ... |
| APIs | ... | ... |
| Payments | ... | ... |
| Backups | ... | ... |
| Performance | ... | ... |
| PWA | ... | ... |
| Accessibility | ... | ... |
| Mobile | ... | ... |
| SEO | ... | ... |
| Deployment | ... | ... |
| Rate Limiting | ... | ... |
| Operational Failures | ... | ... |

## Launch Blockers (🔴)

List every blocker with file / config / owner / fix.

## Must-Fix-This-Week (🟡 → must-fix)

List with owner / date.

## Accepted Risks

List with rationale and review date.

## Runbooks

List runbooks written or updated.

## Verification

List checks executed and results.

Do not declare the application ready for production unless the
scorecard shows green on every category that applies.

---

# CORE PRODUCTION READINESS RULES

- Never approve launch with an unfixed launch blocker.
- Never skip backup / restore testing.
- Never trust "it works on my machine" as production evidence.
- Never ignore monitoring gaps because no one is on call yet.
- Never declare PWA / SEO / accessibility ready without measuring.
- Never trust a payment flow without a verified end-to-end run.
- Never declare readiness without running the full verification
  pipeline.
```