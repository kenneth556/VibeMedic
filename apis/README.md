# 🔌 VibeMedic: Third-Party APIs & Services Guide

This directory contains recommended third-party APIs, vendor selections, and architecture patterns for building resilient, production-ready applications.

---

## Catalog Index

| Document | Purpose | Scope |
| :--- | :--- | :--- |
| [`RECOMMENDED_APIS.md`](./RECOMMENDED_APIS.md) | Curated catalog of vetted APIs & services with code examples, anti-patterns, fallbacks, and security rules. | Global & African (Nigeria) deployments across 30+ categories. |

---

## When to Consult this Guide

1. **During Stage 6 (API Integrations):**
   - When replacing mock/fake APIs with real production providers.
   - When choosing reliable providers for email, SMS, authentication, storage, search, error monitoring, and webhooks.
2. **During Stage 7 (Payments):**
   - When setting up Paystack, Flutterwave, Stripe, or LemonSqueezy with server-verified webhooks and idempotency.
3. **During Architecture & Production Audits:**
   - When evaluating provider fallbacks, rate limits, secret rotation, and vendor lock-in.

---

## Principles for Production Integrations

1. **Never leak secrets to the client:** All third-party secret keys, private tokens, and webhook secrets must remain on the backend or in Edge Functions.
2. **Always verify webhook signatures:** Validate incoming payloads using the provider's cryptographic signature before updating database records.
3. **Implement idempotency:** Prevent duplicate charges or actions using database constraints and unique event/idempotency keys.
4. **Handle all 4 UX states:** Provide explicit UI feedback for **Loading**, **Success**, **Error**, and **Empty** states for every external call.
