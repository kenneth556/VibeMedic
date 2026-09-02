# Prompt 39: Payment Flow Audit & Repair

> **Stage 7 — Payments**  
> **Target:** Payment initialization, provider callbacks/webhooks, server-side verification, idempotency, duplicate processing, subscription state, refund handling, financial integrity  
> **Primary Output:** Verified Payment Lifecycle Report & End-to-End Financially-Safe Flows

---

## Prompt Text

```text
# PAYMENT FLOW AUDIT & REPAIR

You are performing a complete, financially serious audit of every
payment integration in the application (Flutterwave, Paystack, Stripe,
Interswitch, Squad, Paddle, Lemon Squeezy, Adyen, Braintree, Monnify,
Open Banking / Mono / Okra direct debits, banking transfers, wallet
top-ups, mobile money, etc.).

Your job is to inspect the actual code and trace every payment-related
operation **end-to-end**, identify real risks, repair verified issues,
and verify the fixes.

Payment bugs can cause real monetary loss. Treat every step as if real
money is on the line.

Do not assume a payment flow is secure because the success URL renders.
Do not invent issues.
Do not rewrite working flows unnecessarily.

---

# MANDATORY END-TO-END TRACE

For every payment-related feature, trace this exact lifecycle:

Frontend
↓
Payment initialization (server creates intent / transaction)
↓
Provider checkout / redirect / hosted page / inline element
↓
Provider callback (frontend redirect) and/or provider webhook
↓
Signature / authenticity verification (server)
↓
Server-side transaction verification (call provider verify API)
↓
Validate expected amount, currency, reference, customer, product
↓
Idempotently update database (order / subscription / wallet / access)
↓
Grant product / service / subscription access
↓
Notify user (email / SMS / in-app)
↓
Reconcile / log

For each step, record:

- File(s) involved
- Server vs client
- Provider API used
- Auth / signature verification
- Idempotency mechanism
- DB writes (and their transactional scope)
- Failure handling

If any step is missing, fake, mocked, client-only, or unverifiable —
flag it as a **CRITICAL** issue.

---

# STEP 1 — DISCOVERY

Find every payment-related:

- Provider SDK imports and initializations
- Server endpoints that initialize transactions
- Frontend "Pay" / "Subscribe" / "Donate" / "Top up" buttons and forms
- Webhook / callback endpoints
- Verify / status-check calls to the provider
- Refund, cancel, dispute handlers
- Subscription create / upgrade / downgrade / cancel handlers
- Wallet, credit, or balance mutations
- Promo codes, coupons, tax, and discount calculations
- Order / invoice / receipt generation
- Payouts and transfers (where applicable)

Document each in a Payment Inventory:

1. Provider
2. Purpose (one-time, recurring, wallet, transfer)
3. Currency(ies) supported
4. Initiation point (UI → server)
5. Callback URL / success URL / cancel URL
6. Webhook URL
7. Verification mechanism
8. Idempotency strategy
9. DB tables mutated
10. Failure / refund / dispute paths

---

# STEP 2 — INITIALIZATION

Verify that payment initialization happens **server-side**.

FAILURES (any of these = critical):

- Frontend directly calls provider secret API to create an intent
- Amount or currency is sent from the client without server recomputation
- Product / order details are sent from the client without server lookup
- The same payment reference can be initialized twice for the same order
- Server stores amount or currency in a way that allows tampering

REQUIREMENTS:

- Server fetches authoritative price from DB / catalog
- Server creates provider transaction with a unique server-generated
  reference (idempotency key)
- Server stores a `pending` order / payment record keyed by the
  reference
- Reference is included in provider metadata so it can be matched on
  return

---

# STEP 3 — CALLBACK vs WEBHOOK

The application must treat these as two separate events:

1. **Callback** (frontend redirect) — UX only. Inform the user.
   Never grants access on its own.
2. **Webhook** (provider → server) — source of truth. Grants access.

If the application grants access on the callback alone, that is a
**CRITICAL** vulnerability. Anyone can fake a success URL.

REQUIREMENTS:

- Callback is best-effort UX (loading state, "verifying…" screen)
- All financial state changes happen only after webhook verification
- Webhook handler returns 200 quickly (acknowledge) and processes
  work asynchronously (queue / background job) where possible
- Webhook is idempotent (see STEP 7)

---

# STEP 4 — SIGNATURE VERIFICATION

For every webhook endpoint that affects money:

- Verify the provider's signature using the **official** SDK / helper
- Verify against the **raw request body** (not re-stringified JSON)
- Reject (4xx) any request with a missing or invalid signature
- Use a server-only secret loaded from environment variables
- Reject requests where the timestamp is too old (replay protection)

References:

- Stripe: `stripe.webhooks.constructEvent(rawBody, sigHeader, secret)`
- Flutterwave: `verifyWebhook(rawBody, signatureHeader, secret)`
- Paystack: HMAC SHA-512 over raw body, compare with `x-paystack-signature`

---

# STEP 5 — SERVER-SIDE TRANSACTION VERIFICATION

After verifying the webhook signature, **call the provider's verify /
status API** to confirm the transaction is genuinely settled.

This defends against:

- Forged / replayed webhooks
- Webhook events for test transactions
- Race conditions where the provider initially reports `pending` then
  later reports `success`

Verify:

- Transaction ID matches what the provider actually settled
- Amount matches what you expected (use minor units, e.g. kobo / cents)
- Currency matches
- Customer / email / metadata matches
- Status is `successful` (not `pending`, `failed`, `cancelled`, `expired`)
- Reference matches the order / subscription you created

If anything mismatches → reject the webhook and do not grant access.

---

# STEP 6 — AMOUNT, CURRENCY, AND REFERENCE INTEGRITY

CRITICAL RULES:

- The amount written to your DB must come from the **provider's verify
  response**, NOT from the original checkout request
- Never trust `amount` or `currency` sent by the client
- Validate that the provider's settled amount equals your expected
  amount in the correct currency, before converting / comparing
- Store amounts in **minor units** (integers) to avoid float drift
- Always reference the order / subscription / user from a server-side
  lookup keyed by the provider reference — never let the client pick
  which order is being paid for

---

# STEP 7 — IDEMPOTENCY & DUPLICATE PROCESSING

Payment webhooks can be delivered multiple times. Make processing
idempotent:

- Use a unique constraint on `(provider, provider_event_id)` (or
  equivalent) in your events table
- Use a unique constraint on `(provider, provider_transaction_id)` in
  your payments table
- Inside a transaction:
  1. Check if event already processed (insert event row with unique
     constraint; if conflict, return 200 and stop)
  2. Verify provider transaction
  3. Update order / subscription state machine with safe transitions
     (`pending` → `paid`, never `paid` → `paid` again)
  4. Grant access exactly once

Audit and fix:

- Webhook handlers that re-credit wallets on each delivery
- "Mark paid" code that can run twice
- Subscriptions granted twice because both callback and webhook ran
- Refund flows that double-refund
- Order fulfillment that emails / ships / credits multiple times

Do NOT solve this with frontend button disabling alone.

---

# STEP 8 — STATE MACHINES & SUBSCRIPTIONS

For subscriptions:

- Audit status transitions: `trialing`, `active`, `past_due`,
  `cancelled`, `expired`, `paused`
- Ensure transitions are valid (e.g. you cannot move from `cancelled`
  back to `active` without a new checkout)
- Verify webhook events update state correctly:
  - `invoice.paid` → `active`
  - `invoice.payment_failed` → `past_due`
  - `customer.subscription.deleted` → `cancelled`
- Audit grace periods and dunning
- Audit renewal logic — never auto-renew silently without user consent
- Audit proration on plan changes

For one-time orders:

- `pending` → `paid` → `fulfilled` (or `refunded`, `disputed`)
- Ensure invalid transitions are impossible in code AND in the DB
  (CHECK constraints where supported)

---

# STEP 9 — REFUNDS, DISPUTES, CHARGEBACKS, AND CANCELLATIONS

Audit:

- Refund initiation: server-side, authorized, logged, idempotent
- Partial vs full refunds handled correctly
- Refunded orders marked in DB and access revoked where appropriate
- Dispute / chargeback webhooks captured and reflected in DB
- Cancellations before capture
- Expired checkout sessions
- Abandoned carts cleaned up but never silently charged

---

# STEP 10 — TAX, DISCOUNTS, AND FEES

- Tax calculation: server-side, never trust client-computed tax
- Discount codes: validated server-side; one-use codes enforced; expired
  codes rejected
- Provider fees: stored separately from your revenue; never assume
  gross = net
- Currency conversion: if you convert for display, mark the figure
  clearly; never use a converted amount to compare against the
  provider's settled amount

---

# STEP 11 — RECEIPTS, INVOICES, AND EMAILS

- Receipts / invoices are issued only after successful verification
- Receipts reference the provider transaction ID
- Email sending is idempotent (or you risk duplicate receipts)
- Receipts do not contain full card numbers, CVV, or secrets
- Refund receipts follow the same rules

---

# STEP 12 — SECURITY ADJACENT TO PAYMENTS

- Webhook endpoint behind HTTPS only
- Webhook endpoint not gated by user auth (providers don't authenticate
  as your users)
- Webhook endpoint rate-limited at the edge (defense in depth)
- Provider secret keys restricted to minimum scopes
- Test / live keys never mixed
- Live keys never present in client bundles
- No payment credentials in logs
- No full payment payload printed in error responses

---

# STEP 13 — REPAIR

For every verified issue:

1. Move any client-side payment logic that uses secrets to the server.
2. Add signature verification using the provider's official helper.
3. Add server-side transaction verification.
4. Add the unique constraints / state-machine guards to prevent double
   processing.
5. Centralize amount / currency / reference handling behind a single
   payment module.
6. Document the lifecycle in code comments.
7. Add a minimal test for each verified scenario:
   - Valid webhook → DB updated, access granted once
   - Duplicate webhook → DB unchanged on second delivery
   - Invalid signature → 4xx, DB unchanged
   - Mismatched amount / currency → access not granted
   - Cancelled / failed / expired → access not granted

If a fix cannot be safely applied automatically, document:

- The vulnerability
- Why it exists
- Required fix
- Files involved
- Whether provider dashboard / config change is needed

---

# STEP 14 — VERIFY

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then perform (where feasible):

- Trigger a real test-mode payment end-to-end
- Replay the webhook → confirm idempotency
- Send a forged webhook (bad signature) → confirm 4xx
- Send a mismatched amount → confirm no access granted
- Cancel mid-flow → confirm no access granted
- Refund → confirm DB updated and access revoked where appropriate

Re-inspect modified code paths.

---

# FINAL REPORT

Return a concise but complete report:

## Payment Status

Overall: `SECURE / NEEDS ATTENTION / CRITICAL ISSUES`

## Providers & Flows Audited

One row per provider × flow with status.

## Critical Issues

List and fix each.

## High-Risk Issues

List and fix each.

## Medium / Low Issues

List remaining issues.

## Idempotency

For each provider, confirm:
- Unique constraint exists
- Duplicate webhooks produce no duplicate grants

## Verification

- Server-side verification: yes / no
- Webhook signature: yes / no
- Replay protection: yes / no

## Supabase / DB Impact

List tables, columns, and RLS policies touched.

## Remaining Manual Actions

Anything requiring provider dashboard config or credential rotation.

## Tests Executed

List exactly what you ran and the results.

Do not claim a payment flow is verified unless it was actually verified.

---

# CORE PAYMENT RULES

- Never grant access because the browser redirected to success.
- Never trust the frontend's claim that a payment succeeded.
- Always verify the webhook signature with the provider's helper.
- Always re-verify the transaction server-side before granting access.
- Always validate amount, currency, and reference server-side.
- Always make payment processing idempotent.
- Always store amounts in minor units (integers).
- Never log payment credentials or full payment payloads.
- Never expose secret keys in frontend code.
- Never blindly retry payment operations.
- Never assume a webhook is trustworthy just because it came from a
  known provider.
- Never claim a fix was verified unless it was actually verified.
```