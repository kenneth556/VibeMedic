# Prompt 34: API Integration Audit & Repair

> **Stage 6 — API Integrations**  
> **Target:** Fake, mocked, half-connected, misconfigured, or UI-only third-party API integrations  
> **Primary Output:** Verified Integration Inventory & Repaired End-to-End Connectivity

---

## Prompt Text

```text
Perform a complete API integration audit of this repository.

GOAL
Find every third-party integration (payments, email, SMS, WhatsApp, AI, auth,
file storage, maps, analytics, push notifications, webhooks, KYC, video,
feature flags, currency FX, address validation, shipping, banking, etc.) and
verify it is REAL, CONNECTED, SECURE, and END-TO-END FUNCTIONAL — not faked,
mocked, partially wired, or visible only in the UI.

For every integration detected, document:

- Provider name (e.g. Resend, Stripe, Flutterwave, Paystack, Termii, Meta
  WhatsApp Business, OpenAI, Supabase, Cloudinary, Mapbox, Sentry, PostHog,
  Trigger.dev, Svix, Smile Identity, PDFMonkey, Mux, Open Exchange Rates,
  Mono, Okra, Plaid, Shippo, EasyPost, etc.)
- Purpose in the application
- Files where it is referenced (frontend, backend, edge functions, jobs)
- Environment variables it requires
- Whether the SDK / package is actually installed
- Whether credentials are present in `.env`, `.env.local`, server config,
  Vercel/Render/Fly secrets, etc.
- Whether the integration is REAL, MOCKED, HALF-WIRED, UI-ONLY, or DEAD
- Whether it touches the database where it should
- Whether webhooks / callbacks are verified and handled

DETECTION SIGNALS — treat any of these as FAILURES:

- Hardcoded `setTimeout` / `Promise.resolve` used to fake API latency
- Static arrays returned by helper functions labelled `getX` / `fetchX`
  when an external API exists
- Comments like `// TODO`, `// mock`, `// fake`, `// remove before prod`
- Try/catch that swallows errors and silently returns canned data
- API client modules with no real `fetch` / SDK calls
- Empty or disabled "Test mode" toggles left on
- Provider SDKs imported but never instantiated or called
- Webhook handlers that always return 200 without verifying anything
- Admin / dev-only test credentials in source
- Environment variables referenced but never defined
- "Looks like" integrations in the UI (toasts, fake receipts) with no DB row
  or no upstream provider call

CATEGORIZE EACH INTEGRATION:

- ✅ REAL — fully wired, credentials configured, working end-to-end
- 🟡 HALF-WIRED — partially connected, one or more gaps
- 🔴 FAKED — mocked data, no real provider call
- ⚫ DEAD — code exists but never reached or never used
- ❌ MISSING — required for the feature but not implemented at all

FOR EACH FAILURE, FIX IT:

1. Replace mocks with real provider calls using the official SDK.
2. Add proper environment variable handling (server-only).
3. Move all secret-bearing calls behind a server route, server action, edge
   function, or background job — NEVER call secret-bearing APIs directly
   from the browser.
4. Persist provider responses in the database where appropriate
   (payment intents, message IDs, KYC results, uploaded file URLs, etc.).
5. Add the real UI behavior tied to real success/failure responses
   (loading state, success state, error state, empty state).
6. Remove dead code paths that confused previous behavior.
7. Add minimal integration tests where feasible.

DO NOT:
- Hide missing functionality behind mock data.
- Hardcode provider secrets anywhere in the repo.
- Disable real provider calls to "make it build".
- Comment out integrations to silence errors.
- Reuse test mode / sandbox keys in production paths.

AFTER REPAIRS, ENFORCE THE 5-TIER FLOW:

UI → State → API → DB → Persistence

For every integration, prove the full path works in both success and
failure modes.

MANDATORY VERIFICATION:

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then produce a final Integration Health Report listing every provider with
its status (✅ / 🟡 / 🔴 / ⚫ / ❌), the files changed, the env vars
required, and the verification steps executed.
```