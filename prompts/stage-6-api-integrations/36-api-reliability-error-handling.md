# Prompt 36: API Reliability & Error Handling

> **Stage 6 — API Integrations**  
> **Target:** Timeouts, retries, fallbacks, loading states, provider failures, rate limits, malformed responses, network drops, idempotency, circuit breakers  
> **Primary Output:** Resilient Provider Communication with Full UX State Coverage

---

## Prompt Text

```text
Perform a complete reliability audit of every external API call in this
repository.

GOAL
Ensure every third-party call (payments, email, SMS, WhatsApp, AI, auth,
file storage, maps, analytics, push notifications, webhooks, KYC, video,
feature flags, currency FX, address validation, shipping, banking, etc.)
handles timeouts, retries, fallbacks, rate limits, malformed responses,
and provider outages gracefully — and that the user interface clearly
reflects every possible state.

FOR EVERY EXTERNAL CALL, AUDIT:

1. TIMEOUT
   - Is there an explicit request timeout? (recommended ≤ 10s for sync,
     longer only with justification)
   - Does the call hang indefinitely if the provider stalls?

2. RETRIES
   - Are retries implemented for transient failures (5xx, network)?
   - Is retry behavior idempotent (idempotency keys where supported)?
   - Is exponential backoff with jitter used?
   - Are non-retryable errors (4xx) NOT retried?
   - Are 4xx errors surfaced clearly to the user?

3. RATE LIMITS
   - Is the call rate-limited client-side or by a queue?
   - Are 429 responses handled with `Retry-After`?
   - Are bulk operations batched under the provider's quota?

4. FALLBACKS
   - If the provider is down, does the UI degrade gracefully or break?
   - Is there a sensible cached / queued fallback (e.g. queue an email
     instead of failing signup)?
   - Are critical flows blocked by a single provider outage?

5. MALFORMED RESPONSES
   - Is the response validated against an expected schema?
   - Are unexpected fields ignored safely?
   - Are partial responses handled?

6. LOADING / SUCCESS / ERROR / EMPTY STATES
   - Does the UI show a loading indicator while waiting?
   - Does it show a success state on 2xx?
   - Does it show a clear, actionable error on failure?
   - Does it show an empty state when the response is legitimately empty?

7. CIRCUIT BREAKERS / OBSERVABILITY
   - Is there a circuit breaker for known-flaky providers?
   - Are failures logged with a correlation ID?
   - Are alerts wired for sustained failure rates?

FIX PROTOCOL:

For every finding:

1. Add explicit timeouts to all provider calls (use `AbortController`
   where applicable).
2. Implement idempotent retries with exponential backoff and jitter
   (consider a small wrapper, e.g. `p-retry`, `async-retry`, or custom).
3. Treat 4xx as terminal where appropriate (don't retry bad requests).
4. Handle 429 with provider-supplied or sensible backoff.
5. Validate responses with a schema validator (Zod, Valibot, etc.).
6. Replace silent `catch {}` blocks with explicit error propagation.
7. Persist provider responses to the database when downstream flows
   depend on them.
8. Surface user-facing errors with copy that explains what to do next.
9. Add a queued fallback for non-blocking flows (email, notifications).
10. Add structured logging including: provider, endpoint, status,
    duration, correlation ID.

UI STATE ENFORCEMENT (5-TIER FLOW):

UI → State → API → DB → Persistence

For every provider-driven UI:

- Loading: skeleton / spinner / disabled control
- Success: real data + clear confirmation
- Error: copy that is human-readable, with retry where appropriate
- Empty: instructive copy, not a broken-looking blank screen

DO NOT:
- Leave silent `catch {}` that swallows provider errors.
- Block user flows on non-critical providers without an obvious escape.
- Use `setTimeout(fakeload, 800)` to simulate latency.
- Retry forever without backoff caps.
- Surface raw provider error strings to end users without translation.

AFTER REPAIRS:

TYPECHECK → LINT → TEST → BUILD

Produce a Reliability Report:
- Provider × operation matrix
- Before / after timeout, retry, fallback, and error UX
- Failure-mode simulation evidence (e.g. killing the network in dev)
- Open risks and mitigations
```