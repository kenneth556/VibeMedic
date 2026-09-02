# Prompt 37: Webhook Audit & Repair

> **Stage 6 — API Integrations**  
> **Target:** Inbound and outbound webhooks — signatures, idempotency, retries, replay protection, dead-letter handling, DB updates, secret rotation  
> **Primary Output:** Verified Webhook Inventory with Signature-Secured, Idempotent Endpoints

---

## Prompt Text

```text
Perform a complete webhook audit of this repository.

GOAL
Find every inbound webhook endpoint (Stripe, Flutterwave, Paystack, Svix,
GitHub, Supabase, Mux, etc.) and every outbound webhook we send to
customers, then verify each is correctly registered, signature-verified,
idempotent, retried safely, and updates the database correctly.

INVENTORY — for every webhook discovered, document:

- Direction (inbound / outbound)
- Provider
- URL / route
- Events handled
- Trigger source (provider dashboard, CLI, code)
- Auth method (signature header, shared secret, mTLS, none)
- Database tables / columns it updates
- Idempotency strategy (event ID, idempotency key, deduplication window)
- Retry behavior (inbound: provider retries; outbound: our retries)
- Dead-letter handling (queue, log, alert)

INBOUND WEBHOOK AUDIT — for every endpoint, verify:

1. SIGNATURE VERIFICATION
   - Signature is verified using the provider's official helper before any
     state change.
   - Raw request body is used for verification, not a re-stringified JSON.
   - Verification failures return 4xx and are logged.
   - Secret is loaded server-side, never hardcoded.

2. EVENT FILTERING
   - Only relevant event types are processed.
   - Unknown events are accepted (2xx) but ignored.

3. IDEMPOTENCY
   - Each event has a stable ID (provider event ID, Svix message ID, etc.).
   - Replayed events do not cause duplicate DB writes.
   - Either: insert into a dedup table; or use upsert with event ID as key.

4. DB UPDATES
   - DB writes happen AFTER signature verification.
   - All writes are transactional where multi-step.
   - State changes are tied to provider-issued IDs
     (payment_intent.id, customer.id, etc.) — not request body fields
     the client could spoof.

5. RETRIES / REPLAY
   - Returning 5xx causes provider to retry (intended for transient
     failure).
   - Returning 2xx means "do not retry".
   - No endpoint silently 200s on partial processing.

6. RESPONSE / LOGGING
   - Latency is logged with provider event ID and route.
   - Failures are alerted (Sentry, log sink, etc.).
   - Sensitive fields are scrubbed before logging.

7. SECURITY
   - Endpoint requires HTTPS.
   - Endpoint is not protected by CSRF / session auth in a way that
     would block provider calls.
   - Rate limit / abuse protection is in place at the edge.

OUTBOUND WEBHOOK AUDIT (webhooks WE send to customers):

1. SIGNING
   - Outgoing payloads are signed with a per-endpoint secret.
   - Signature header name is documented.

2. RETRIES
   - Transient failures (5xx, network, timeout) retried with backoff.
   - Permanent failures (4xx) routed to a dead-letter queue after a
     sensible cap.
   - Customer can replay deliveries from a self-serve dashboard.

3. EVENT DELIVERY
   - Events emitted are exactly the events customers subscribed to.
   - Payload schema is versioned.
   - At-least-once delivery with clear "delivered_at" semantics.

4. SECRETS
   - Endpoint URLs and secrets stored encrypted at rest.
   - Secrets rotatable without code change.

FIX PROTOCOL:

For every finding:

1. Add / fix signature verification using the provider's helper.
2. Add an event-ID-based dedup table or unique constraint.
3. Move DB writes into a single transaction per event.
4. Add a dead-letter queue (or at minimum structured error logs and
   alert rules).
5. Add outbound retry + replay if missing (Svix / Hookdeck / custom).
6. Add tests:
   - Valid signature → 200, DB updated
   - Invalid signature → 4xx, DB unchanged
   - Duplicate event → 200, no duplicate DB write
   - Provider transient failure → 5xx, retried by provider
7. Document the webhook contract in `docs/` or `README.md`.

DO NOT:
- Trust webhook payloads without signature verification.
- Skip idempotency because "we'll never get a duplicate".
- Log full webhook bodies with secrets / PII.
- Reply with 200 when DB updates failed.
- Couple outbound webhook sending to the user's request path.

AFTER REPAIRS, ENFORCE THE 5-TIER FLOW:

UI → State → API → DB → Persistence

For each webhook, prove the path:

Provider → signature verify → dedup → business logic → DB write → log
→ 2xx response (or controlled 5xx for retry)

MANDATORY VERIFICATION:

TYPECHECK → LINT → TEST → BUILD

Produce a Webhook Health Report:
- Inbound / outbound inventory
- Per-endpoint: signature, idempotency, retries, DB impact
- Test matrix (positive, negative, replay)
- Provider dashboard configuration checklist
```