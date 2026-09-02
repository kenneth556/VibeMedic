# Recommended APIs & Services

This document catalogs recommended third-party APIs and services for building production-grade applications, with a focus on Africa (especially Nigeria) and global deployments. Each section follows a consistent structure:

- **Best for** — primary use cases
- **Use it for** — concrete features
- **Why** — key advantages
- **Alternatives** — fallback options
- **Never** — anti-patterns and security pitfalls
- **Typical architecture** — recommended flow

Choose services based on your region, budget, and compliance needs. Avoid mixing too many vendors for the same concern.

---

## Table of Contents

### Requested Categories

1. [Email](#1-email)
2. [Payments — Nigeria / Africa](#2-payments--nigeria--africa)
3. [Payments — Global](#3-payments--global)
4. [SMS / OTP](#4-sms--otp)
5. [WhatsApp](#5-whatsapp)
6. [AI](#6-ai)
7. [Authentication](#7-authentication)
8. [File Storage](#8-file-storage)
9. [Image / Media Processing](#9-image--media-processing)
10. [Maps / Geolocation](#10-maps--geolocation)
11. [Analytics](#11-analytics)
12. [Error Monitoring](#12-error-monitoring)
13. [Push Notifications](#13-push-notifications)
14. [Search](#14-search)
15. [Background Jobs / Workflows](#15-background-jobs--workflows)
16. [Webhooks](#16-webhooks)
17. [Identity / KYC](#17-identity--kyc)
18. [PDF Generation](#18-pdf-generation)
19. [Video](#19-video)
20. [Feature Flags](#20-feature-flags)
21. [Logging / Infrastructure Monitoring](#21-logging--infrastructure-monitoring)
22. [Currency / Exchange Rates](#22-currency--exchange-rates)
23. [Address / Location Data](#23-address--location-data)
24. [Shipping / Logistics](#24-shipping--logistics)
25. [Banking / Open Banking](#25-banking--open-banking)

### Additional Categories

- [Realtime](#realtime)
- [Email Marketing / Newsletters](#email-marketing--newsletters)
- [Customer Support](#customer-support)
- [Invoicing](#invoicing)
- [Translation](#translation)
- [Captcha / Bot Protection](#captcha--bot-protection)
- [Rate Limiting / API Protection](#rate-limiting--api-protection)
- [Secrets Management](#secrets-management)
- [Forms / Surveys](#forms--surveys)
- [Scheduling](#scheduling)
- [Spam / Abuse](#spam--abuse)
- [CDN](#cdn)
- [Background Image / Stock Photos](#background-image--stock-photos)

---

## 1. Email

### Recommended: Resend

**Best for:** Transactional email for modern web applications.

**Use it for:**
- Verification emails
- Password reset emails
- Welcome emails
- Receipts
- Notifications
- Contact forms

**Why:**
- Simple API
- Developer-friendly
- Good React/TypeScript support
- Works well with serverless applications

**Alternatives:**
- Postmark
- SendGrid
- Amazon SES

**Never:**
- Put the API key in frontend code
- Send emails directly from the browser
- Commit credentials to Git

**Typical architecture:**

```
Frontend
→ Backend / Edge Function
→ Resend API
→ User's email
```

---

## 2. Payments — Nigeria / Africa

### Recommended: Flutterwave

**Best for:**
- Nigerian payments
- African payments
- Card payments
- Bank transfers
- Mobile money where supported

**Use it for:**
- Checkout
- Subscriptions
- One-time payments
- Payment verification
- Webhooks

**Why:**
- Pan-African coverage
- Strong Naira support
- Multiple local payment methods
- Solid documentation

**Alternatives:**
- Paystack
- Interswitch
- Squad

**Never:**
- Trust the frontend's claim that a payment succeeded
- Skip webhook verification
- Store raw card data

**Typical architecture:**

```
User
→ Checkout
→ Flutterwave
→ Webhook / server verification
→ Verify transaction
→ Update database
→ Grant access
```

### Also Recommended: Paystack

**Best for:**
- Nigerian startups
- Recurring billing (subscriptions)
- Startups that want a simple API

**Why:**
- Excellent developer experience
- Simple subscriptions API
- Strong documentation

---

## 3. Payments — Global

### Recommended: Stripe

**Best for:**
- Global card payments
- Subscriptions
- Marketplace payments (Stripe Connect)
- Invoices
- Tax calculation

**Use it for:**
- Checkout
- Recurring billing
- One-time payments
- Refunds
- Disputes
- Tax

**Why:**
- Industry standard
- Best-in-class documentation
- Strong TypeScript support
- Excellent webhook reliability

**Alternatives:**
- Paddle (Merchant of Record)
- Lemon Squeezy (Merchant of Record)
- Adyen
- Braintree

**Never:**
- Confirm payment success only on the client
- Skip webhook signature verification
- Store card details yourself

**Typical architecture:**

```
User
→ Checkout Session (Stripe)
→ Stripe-hosted page or Elements
→ Webhook → verify signature
→ Update database
→ Grant access
```

---

## 7. Authentication

### Recommended: Supabase Auth / Clerk / Auth0

**Best for:**
- Email + password
- Magic links
- OAuth (Google, GitHub, etc.)
- Multi-factor authentication
- Role-based access control

**Use it for:**
- Sign up / sign in
- Password reset
- Session management
- User profiles
- Access control

**Why:**
- Drop-in auth UI
- Secure session handling
- Supports social providers
- JWT / session cookies

**Alternatives:**
- NextAuth / Auth.js
- Firebase Authentication
- WorkOS (for B2B SSO / SAML)
- Stytch

**Never:**
- Roll your own password hashing without argon2 / bcrypt
- Store passwords in plain text
- Use JWTs without expiration and revocation strategy

**Typical architecture:**

```
User
→ Frontend (Clerk/Supabase Auth UI)
→ Auth provider issues session/JWT
→ Backend verifies token
→ Grant access to protected resources
```

---

## 4. SMS / OTP

### Recommended: Termii

**Best for:**
- Nigerian phone numbers
- OTP (one-time passwords)
- Transactional SMS
- Bulk SMS

**Use it for:**
- Phone verification
- 2FA
- One-time passwords (OTP)
- Transactional alerts
- Bulk SMS

**Why:**
- Strong Nigerian carrier coverage
- Affordable local rates
- Simple REST API

**Alternatives:**
- Africa's Talking
- Twilio
- BulkSMS Nigeria
- InfoBip

**Never:**
- Send OTPs from the frontend
- Reuse OTPs
- Store OTPs in plain text without expiry

**Typical architecture:**

```
User submits phone
→ Backend generates OTP
→ Store OTP hash + expiry
→ Send via Termii
→ User submits OTP
→ Verify hash + expiry
```

---

## 5. WhatsApp

### Recommended: Meta WhatsApp Business API

**Best for:**
- Customer support at scale
- Notifications
- OTP delivery
- Order updates
- Conversational commerce

**Use it for:**
- Transactional notifications
- Customer service
- Marketing (within Meta policy)
- Order tracking

**Why:**
- Highest open rates of any channel
- Trusted by users
- Official Meta support

**Alternatives:**
- Twilio WhatsApp API
- 360dialog
- Gupshup
- WATI

**Never:**
- Send marketing messages outside the 24-hour service window without templates
- Spam users
- Use WhatsApp for sensitive data (PII / cards)

**Typical architecture:**

```
Event in your system
→ Backend / queue
→ Meta WhatsApp Business API
→ User receives message
→ Webhook for inbound replies
```

---

## 6. AI

### Recommended: OpenAI, Anthropic, Google Gemini

**Best for:**
- Text generation
- Summarization
- Chatbots
- Image / audio generation (some providers)
- Embeddings
- Code generation

**Use it for:**
- Customer support
- Search / RAG
- Document analysis
- Content moderation
- Translations
- Voice agents

**Why:**
- State-of-the-art models
- Strong SDKs
- Reasonable pricing

**Alternatives:**
- Mistral
- Cohere
- xAI (Grok)
- Open-source (self-hosted: Llama, Qwen)

**Never:**
- Send PII / PHI without a DPA
- Hardcode API keys
- Trust raw model output for medical / legal / financial decisions

**Typical architecture:**

```
User input
→ Backend (sanitize + add system prompt)
→ LLM provider API
→ Stream output to client
→ Log interactions (with consent)
```

---

## 8. File Storage

### Recommended: Supabase Storage

**Best for:**
- User uploads
- Avatars
- Documents
- Public assets
- Private buckets with signed URLs

**Use it for:**
- Profile pictures
- File uploads from forms
- PDF / document storage
- Private file access with signed URLs

**Why:**
- Integrated with Supabase Auth (RLS)
- S3-compatible
- Simple SDK

**Alternatives:**
- Cloudinary
- UploadThing
- AWS S3
- Backblaze B2
- Vercel Blob

**Never:**
- Make private buckets public
- Trust user-supplied filenames
- Skip virus scanning

**Typical architecture:**

```
Frontend
→ Signed upload URL
→ Direct upload to Supabase Storage
→ Store path in DB
→ Serve via signed URL when private
```

---

## 9. Image / Media Processing

### Recommended: Cloudinary

**Best for:**
- Image upload, transformation, and delivery
- Responsive images
- Format conversion (WebP / AVIF)
- Face / content detection
- Video thumbnails

**Use it for:**
- Profile pictures
- Product images
- Marketing assets
- Responsive image delivery

**Why:**
- On-the-fly transformations via URL
- Global CDN
- Excellent optimization

**Alternatives:**
- Imgix
- ImageKit
- Next/Image + S3
- Cloudflare Images

**Never:**
- Serve unoptimized originals
- Allow uploads without content-type validation
- Skip EXIF stripping for privacy

**Typical architecture:**

```
Upload original
→ Cloudinary stores asset
→ Frontend requests with transformation params
→ CDN delivers optimized variant
```

---

## 10. Maps / Geolocation

### Recommended: Google Maps Platform

**Best for:**
- Address autocomplete
- Geocoding
- Routing
- Distance matrix
- Static / embedded maps

**Use it for:**
- Checkout address forms
- Store locators
- Delivery tracking
- Distance / ETA calculations

**Why:**
- Best global coverage
- Strong documentation
- Reliable geocoding

**Alternatives:**
- Mapbox
- OpenStreetMap + Nominatim
- HERE Maps
- TomTom

**Never:**
- Embed API keys in client code without restrictions
- Use Maps for free without setting billing alerts
- Skip rate limiting on geocoding

**Typical architecture:**

```
User types address
→ Autocomplete API
→ Pick place
→ Geocode for lat/lng
→ Store coordinates in DB
```

---

## 11. Analytics

### Recommended: PostHog

**Best for:**
- Product analytics
- Feature flags
- Session recording (with consent)
- Funnels and retention
- Self-hostable

**Use it for:**
- User behavior tracking
- A/B testing
- Conversion tracking
- Heatmaps

**Why:**
- Open source / self-hostable
- Combines analytics + feature flags
- Strong developer experience

**Alternatives:**
- Plausible (privacy-friendly, lightweight)
- Google Analytics 4
- Mixpanel
- Amplitude
- Heap

**Never:**
- Track PII / passwords
- Skip cookie consent
- Use analytics for medical / health data without a legal basis

**Typical architecture:**

```
Frontend event
→ PostHog SDK (with consent)
→ PostHog ingest
→ Dashboards / exports
```

---

## 12. Error Monitoring

### Recommended: Sentry

**Best for:**
- Frontend and backend error tracking
- Performance monitoring
- Release health
- Source maps

**Use it for:**
- JS / React errors
- API exceptions
- Mobile crashes
- Background job failures

**Why:**
- Best-in-class error grouping
- Strong source map support
- Performance + error correlation

**Alternatives:**
- Bugsnag
- Rollbar
- GlitchTip (open source)

**Never:**
- Commit Sentry auth tokens
- Send PII to Sentry without scrubbing
- Ignore source map upload errors

**Typical architecture:**

```
App throws error
→ Sentry SDK captures
→ Sentry ingest
→ Alerts to Slack / PagerDuty
```

---

## 14. Search

### Recommended: Algolia

**Best for:**
- Instant search-as-you-type
- Faceted search
- High-quality ranking

**Use it for:**
- Product search
- Document search
- Autocomplete
- Multi-attribute filters

**Why:**
- Fastest hosted search
- Excellent relevance tuning
- Strong React InstantSearch library

**Alternatives:**
- Typesense (open source, fast)
- Meilisearch (open source, easy)
- Elasticsearch (self-hosted)
- PostgreSQL full-text search (small datasets)

**Never:**
- Index PII unnecessarily
- Skip write API key restrictions
- Reindex on every write — batch instead

**Typical architecture:**

```
Source DB
→ Backend sync worker
→ Algolia / Typesense
→ Frontend InstantSearch UI
```

---

## 13. Push Notifications

### Recommended: Firebase Cloud Messaging (FCM)

**Best for:**
- Android push
- iOS push (via APNs)
- Web push

**Use it for:**
- New message alerts
- Reminders
- Marketing pushes
- Order updates

**Why:**
- Free
- Cross-platform
- Reliable delivery

**Alternatives:**
- OneSignal
- Pusher Beams
- Expo Notifications (React Native)
- Knock (multi-channel)

**Never:**
- Send sensitive data in push payloads
- Spam users
- Skip notification permission prompts

**Typical architecture:**

```
Event in backend
→ Queue / job
→ FCM API
→ User device receives notification
```

---

## 15. Background Jobs / Workflows

### Recommended: Trigger.dev

**Best for:**
- Scheduled jobs
- Long-running workflows
- Event-driven background work
- TypeScript-first

**Use it for:**
- Nightly reports
- Webhook processing
- Retries with backoff
- Multi-step workflows

**Why:**
- Code-first (not UI-only)
- Strong retries and observability
- Works well with Next.js / serverless

**Alternatives:**
- Inngest
- Temporal (heavy workflows)
- BullMQ (Redis-based)
- Celery (Python)
- Vercel Cron (simple schedules)

**Never:**
- Run cron in client code
- Skip idempotency keys
- Trust schedules without monitoring

**Typical architecture:**

```
Schedule or event
→ Trigger.dev job
→ Run with retries + logging
→ Notify on failure
```

---

## 16. Webhooks

### Recommended: Svix

**Best for:**
- Sending webhooks to your customers
- Webhook reliability
- Replay / retry tooling

**Use it for:**
- Outgoing webhook infrastructure
- Webhook signing
- Webhook dashboards

**Why:**
- Handles retries, signing, and replay
- Drops in cleanly with any backend

**Alternatives:**
- Hookdeck
- Webhook.site (debugging)
- ngrok (local testing)

**Never:**
- Skip signature verification on inbound webhooks
- Process webhooks synchronously without idempotency
- Trust payload ordering

**Typical architecture:**

```
Event in your system
→ Svix message endpoint
→ Customer endpoint (signed)
→ Customer retries via Svix portal
```

---

## 17. Identity / KYC

### Recommended: Smile Identity / VerifyMe

**Best for:**
- Nigerian BVN verification
- NIN verification
- International ID verification
- Liveness checks

**Use it for:**
- Signup KYC
- Age verification
- AML compliance
- High-risk transactions

**Why:**
- Strong African ID coverage
- Liveness and biometric checks
- Regulatory alignment

**Alternatives:**
- Onfido
- Persona
- Trulioo
- Onboardbase (Africa)

**Never:**
- Store raw ID images longer than needed
- Skip liveness checks for high-risk flows
- Perform KYC from the frontend only

**Typical architecture:**

```
User submits ID + selfie
→ Backend forwards to Smile Identity
→ Verify result via callback / webhook
→ Store verification status only
```

---

## 18. PDF Generation

### Recommended: PDFMonkey

**Best for:**
- Server-side PDF generation from templates
- Invoices, receipts, contracts

**Use it for:**
- Order receipts
- Contracts and NDAs
- Reports
- Tickets

**Why:**
- HTML → PDF templates
- Simple REST API
- Document storage included

**Alternatives:**
- Gotenberg (self-hosted, open source)
- react-pdf (client + server)
- DocRaptor
- Puppeteer (DIY)

**Never:**
- Generate PDFs from untrusted HTML without sanitization
- Skip templating — hardcoding PDFs is unmaintainable
- Commit API keys

**Typical architecture:**

```
Trigger event (e.g. order paid)
→ Backend builds template payload
→ PDFMonkey API
→ Store PDF URL
→ Email to user
```

---

## 19. Video

### Recommended: Mux

**Best for:**
- Video upload and playback
- Live streaming
- Adaptive bitrate
- Analytics

**Use it for:**
- Course platforms
- User-generated content
- Live events
- Reels / short-form video

**Why:**
- Excellent video infrastructure
- HLS / DASH out of the box
- Mux Player simplifies playback

**Alternatives:**
- Cloudinary (video)
- Bunny Stream
- AWS MediaConvert + CloudFront
- Vimeo OTT

**Never:**
- Self-host MP4s for large audiences
- Skip transcoding — always deliver adaptive streams
- Skip signed URLs for private content

**Typical architecture:**

```
User uploads video
→ Mux direct upload
→ Mux transcodes to HLS
→ Mux Player delivers to user
```

---

## 20. Feature Flags

### Recommended: PostHog / Unleash

**Best for:**
- Gradual rollouts
- A/B testing
- Per-user / per-org targeting
- Kill switches

**Use it for:**
- Beta features
- Region-specific features
- Paywall experiments
- Rollback protection

**Why:**
- PostHog combines analytics + flags
- Unleash is open source

**Alternatives:**
- LaunchDarkly (enterprise)
- Flagsmith
- GrowthBook (open source)

**Never:**
- Mix feature flags and business logic permanently
- Ship with stale flags — clean them up

**Typical architecture:**

```
Flag evaluation
→ PostHog / Unleash server SDK
→ Return variant
→ Analytics correlates usage
```

---

## 21. Logging / Infrastructure Monitoring

### Recommended: Sentry + Better Stack

**Best for:**
- Application performance monitoring (APM)
- Uptime monitoring
- Log aggregation
- Status pages

**Use it for:**
- API uptime checks
- Heartbeat monitoring
- Incident response
- Synthetic checks

**Why:**
- Sentry for errors + APM
- Better Stack for logs + uptime + status pages
- Clear pricing

**Alternatives:**
- Datadog (full-stack)
- New Relic
- Grafana Cloud
- UptimeRobot
- Pingdom

**Never:**
- Log PII / secrets
- Skip alert routing
- Ignore uptime alerts during off-hours

**Typical architecture:**

```
App emits metrics + logs
→ Sentry (errors) + Better Stack (logs)
→ Dashboards + alert rules
→ On-call notifications
```

---

## 22. Currency / Exchange Rates

### Recommended: Open Exchange Rates / Fixer.io / exchangerate.host

**Best for:**
- Real-time FX rates
- Historical FX data
- Multi-currency pricing
- Crypto + fiat conversion (where supported)

**Use it for:**
- Displaying prices in user's local currency
- Charging customers in their preferred currency
- Settling payments across borders
- Financial reporting
- Treasury / treasury-style dashboards

**Why:**
- Centralized source of truth for FX
- Daily or hourly updated rates
- Historical data for audits

**Alternatives:**
- CurrencyLayer
- Frankfurter (free, open source, ECB rates)
- European Central Bank feed (RSS)
- CoinGecko / CoinMarketCap (for crypto)

**Never:**
- Cache rates for days — they drift
- Skip rate freshness timestamps on receipts
- Trust a single source for financial settlements without reconciliation

**Typical architecture:**

```
Cron job (hourly / daily)
→ Fetch rates from Open Exchange Rates
→ Store in DB with timestamp + base currency
→ Pricing engine reads DB
→ Display + invoice in target currency
```

---

## 23. Address / Location Data

### Recommended: Google Address Validation API / Loqate / Smarty

**Best for:**
- Address autocomplete
- Address parsing and standardization
- Postal code lookup
- Address verification at checkout

**Use it for:**
- Checkout address forms
- KYC address capture
- Delivery address cleanup
- Country / region dropdowns

**Why:**
- Reduces bad addresses at point of entry
- Standardizes for shipping carriers
- Improves geocoding accuracy downstream

**Alternatives:**
- Loqate (enterprise)
- Smarty (US-focused)
- GeoNames (free, no autocomplete)
- OpenStreetMap Nominatim (rate-limited)

**Never:**
- Auto-overwrite user-entered addresses without confirmation
- Skip storing raw input alongside cleaned output
- Rely on autocomplete for sensitive KYC fields without verification

**Typical architecture:**

```
User types address
→ Autocomplete API (debounced)
→ Pick suggestion
→ Validate + parse → standardized fields
→ Store raw + cleaned in DB
```

---

## 24. Shipping / Logistics

### Recommended: Shippo / EasyPost / Sendbox (Nigeria)

**Best for:**
- Multi-carrier label generation
- Real-time shipping rates
- Tracking updates
- Nigerian last-mile delivery

**Use it for:**
- E-commerce checkout
- Shipment tracking webhooks
- Return shipping labels
- International shipping

**Why:**
- One integration, many carriers
- Tracking normalization across carriers
- Strong webhook reliability

**Alternatives:**
- ShipStation
- ShipBob (fulfillment)
- GIG Logistics (Nigeria)
- Kwik Delivery (Nigeria)
- DHL / FedEx / UPS direct APIs (large volume)

**Never:**
- Trust the carrier's "delivered" status for sensitive flows without confirmation
- Skip insurance on high-value parcels
- Store customer addresses only in carrier systems — keep your own copy

**Typical architecture:**

```
Checkout
→ Shipping API rates API (carriers + address)
→ User selects option
→ Order created in your DB
→ Label purchased via Shippo/EasyPost
→ Tracking webhook → update order status
→ Notify customer
```

---

## 25. Banking / Open Banking

### Recommended: Mono / Okra (Nigeria) / Plaid (Global)

**Best for:**
- Linking bank accounts for payments
- Verifying account ownership
- Retrieving transaction history (with consent)
- Open Banking flows

**Use it for:**
- Direct debit / recurring payments
- Account verification at signup
- Affordability checks (with consent)
- Personal finance / lending flows
- B2B payouts

**Why:**
- Account-to-account payments at lower cost than cards
- Strong consent and audit trails
- Strong African and global coverage

**Alternatives:**
- Stitch (South Africa)
- Yapily (UK / EU)
- TrueLayer (UK / EU)
- Finicity (US)

**Never:**
- Store raw bank credentials — always go through provider tokens
- Skip consent records — regulators require them
- Use transaction data for unrelated advertising

**Typical architecture:**

```
User selects bank
→ Mono / Plaid Link flow
→ Provider returns account + transaction token
→ Backend uses token for payments / verification
→ Periodic re-auth via provider refresh flow
```

---

## Realtime

### Recommended: Supabase Realtime / Pusher / Ably

**Best for:**
- Live updates (chat, dashboards)
- Presence indicators
- Broadcast events

**Use it for:**
- Chat applications
- Collaborative editing
- Live sports / trading dashboards
- Notifications

**Why:**
- Supabase Realtime is integrated with Postgres
- Pusher / Ably are battle-tested

**Alternatives:**
- Socket.io (self-hosted)
- Liveblocks (collaboration)
- Centrifugo (self-hosted)

**Never:**
- Trust client-side realtime events as the source of truth
- Skip auth on realtime channels

**Typical architecture:**

```
DB change or event
→ Supabase Realtime / Pusher channel
→ Authorized clients receive update
```

---

## Email Marketing / Newsletters

### Recommended: Resend / ConvertKit / Beehiiv

**Best for:**
- Newsletters
- Drip campaigns
- Audience segmentation

**Use it for:**
- Weekly newsletters
- Onboarding sequences
- Re-engagement campaigns

**Why:**
- Resend for transactional + simple broadcasts
- ConvertKit / Beehiiv for creator-led newsletters

**Alternatives:**
- Mailchimp
- SendGrid Marketing Campaigns
- Loops.so
- Customer.io

**Never:**
- Send marketing emails without consent
- Mix transactional and marketing in the same stream without separation

**Typical architecture:**

```
Signup event
→ Add subscriber to list
→ Trigger welcome automation
→ Send newsletter via Resend / ConvertKit
```

---

## Customer Support

### Recommended: Crisp / Intercom / HelpScout

**Best for:**
- Live chat
- Shared inbox
- Helpdesk workflows

**Use it for:**
- Customer chat widget
- Ticketing
- Knowledge base
- Agent routing

**Why:**
- Crisp is affordable
- Intercom is feature-rich
- HelpScout is email-first

**Alternatives:**
- Tawk.to (free)
- Front
- Zendesk

**Never:**
- Store sensitive PII in chat without encryption
- Use support tools to send PHI without a BAA

**Typical architecture:**

```
User opens chat
→ Crisp / Intercom widget
→ Agent dashboard
→ Optional CRM / billing system context
```

---

## Invoicing

### Recommended: Stripe Invoices / Invoice Ninja

**Best for:**
- One-off invoices
- Recurring invoices
- Tax calculation
- Multi-currency

**Use it for:**
- B2B billing
- Freelance invoicing
- Subscription invoices
- Late-payment reminders

**Why:**
- Stripe handles tax, currency, and reminders
- Invoice Ninja is open source

**Alternatives:**
- FreshBooks
- QuickBooks
- Wave

**Never:**
- Send invoices without tax logic where required
- Skip invoice numbering

**Typical architecture:**

```
Order / subscription created
→ Stripe generates invoice
→ Auto-charges or emails invoice
→ Webhook on payment
```

---

## Translation

### Recommended: Google Cloud Translation / DeepL / Lokalise

**Best for:**
- Machine translation
- Localization workflows
- Translator collaboration

**Use it for:**
- Multi-language UI
- Document translation
- Localization of marketing content

**Why:**
- DeepL for quality in EU languages
- Google for breadth
- Lokalise for translation teams

**Alternatives:**
- LibreTranslate (self-hosted)
- AWS Translate
- Crowdin

**Never:**
- Auto-translate medical / legal content without a human reviewer

**Typical architecture:**

```
Source text
→ Translation API
→ Store localized strings
→ Serve by user locale
```

---

## Captcha / Bot Protection

### Recommended: Cloudflare Turnstile / hCaptcha / reCAPTCHA

**Best for:**
- Bot protection on forms
- Login / signup protection
- Comment spam prevention

**Use it for:**
- Signup forms
- Contact forms
- Search pages
- Comment sections

**Why:**
- Turnstile is privacy-friendly
- hCaptcha rewards site owners
- reCAPTCHA is ubiquitous

**Alternatives:**
- Friendly Captcha
- Proof of Work (custom)

**Never:**
- Use only captcha for security — layer it with rate limiting
- Rely on captcha for accessibility without fallback

**Typical architecture:**

```
User loads form
→ Fetch challenge token from Turnstile
→ Submit form with token
→ Backend verifies token
```

---

## Rate Limiting / API Protection

### Recommended: Upstash / Cloudflare / Arcjet

**Best for:**
- Per-IP rate limiting
- Per-user quotas
- Bot detection
- WAF rules

**Use it for:**
- Login attempts
- API endpoints
- Public forms
- Webhooks

**Why:**
- Upstash Redis is cheap and fast
- Cloudflare WAF / Rate Limits are edge-fast
- Arcjet combines multiple protections

**Alternatives:**
- NGINX limit_req
- Fastly
- AWS WAF

**Never:**
- Skip rate limiting on auth endpoints
- Trust client-supplied user IDs for quotas

**Typical architecture:**

```
Request hits edge
→ Cloudflare / Upstash check
→ Allow or 429
```

---

## Secrets Management

### Recommended: Doppler / AWS Secrets Manager / HashiCorp Vault

**Best for:**
- Storing API keys
- Rotating credentials
- Environment management

**Use it for:**
- Production secrets
- Per-environment secrets
- Shared service credentials

**Why:**
- Doppler is developer-friendly
- AWS / Vault are enterprise-grade

**Alternatives:**
- 1Password Teams (small teams)
- Infisical (open source)
- .env files in CI (with care)

**Never:**
- Commit secrets to Git
- Put secrets in frontend code
- Share secrets over Slack

**Typical architecture:**

```
CI / runtime
→ Doppler / Vault fetch
→ Inject into process
→ Audit access logs
```

---

## Forms / Surveys

### Recommended: Tally / Typeform / Formbricks

**Best for:**
- Public forms
- Internal surveys
- NPS / CSAT

**Use it for:**
- Lead capture
- Customer feedback
- Onboarding surveys

**Why:**
- Tally is free and easy
- Formbricks is open source

**Alternatives:**
- Google Forms
- Jotform
- Fillout

**Never:**
- Collect health data through third-party form tools without a BAA

**Typical architecture:**

```
User submits form
→ Tally / Formbricks
→ Webhook to your backend
→ Store + trigger follow-up
```

---

## Scheduling

### Recommended: Cal.com / Calendly

**Best for:**
- Booking meetings
- Time zone handling
- Calendar sync

**Use it for:**
- Sales calls
- Customer demos
- Interviews
- Onboarding sessions

**Why:**
- Cal.com is open source
- Calendly is polished

**Alternatives:**
- SavvyCal
- TidyCal

**Never:**
- Embed calendar tools that leak availability without auth

**Typical architecture:**

```
User picks slot
→ Cal.com / Calendly
→ Calendar invite sent
→ Optional CRM / billing integration
```

---

## Spam / Abuse

### Recommended: Akismet / Cleantalk / OOPSpam

**Best for:**
- Comment spam filtering
- Form spam filtering
- Email validation

**Use it for:**
- Blog comments
- Contact forms
- Signup forms

**Why:**
- Akismet is the standard for comment spam

**Alternatives:**
- Antispam Bee (WordPress)
- SpamAssassin (self-hosted)

**Never:**
- Rely on a single layer — combine captcha + rate limit + spam filter

**Typical architecture:**

```
User submits content
→ Captcha check
→ Rate limit check
→ Spam filter (Akismet)
→ Store or reject
```

---

## CDN

### Recommended: Cloudflare / Fastly / Vercel Edge Network

**Best for:**
- Static asset delivery
- Edge caching
- DDoS protection
- Image optimization

**Use it for:**
- Public website assets
- API caching
- Streaming media
- SPA hosting

**Why:**
- Cloudflare is global and affordable
- Fastly is excellent for purges and edge logic
- Vercel Edge is great for Next.js

**Alternatives:**
- AWS CloudFront
- Bunny CDN
- KeyCDN

**Never:**
- Cache private user data on a public CDN
- Skip cache invalidation strategy

**Typical architecture:**

```
Origin (your server)
→ CDN edge caches
→ Users served from nearest edge
```

---

## Background Image / Stock Photos

### Recommended: Unsplash / Pexels / Picsum

**Best for:**
- Marketing imagery
- Hero backgrounds
- Blog post headers

**Use it for:**
- Landing pages
- Documentation
- Sample content

**Why:**
- Free and high quality
- Proper licensing

**Alternatives:**
- Storyblocks
- Shutterstock

**Never:**
- Use stock photos without checking license terms
- Use recognizable faces for fake testimonials

**Typical architecture:**

```
Designer / dev picks photo
→ Download with proper attribution
→ Optimize via Cloudinary / Next/Image
→ Serve via CDN
```

---

## General Best Practices

Across all integrations, follow these principles:

1. **Secrets stay on the server.** Never expose provider API keys in frontend code. Use scoped, restricted keys where possible.
2. **Verify webhooks.** Always verify signatures using the provider's SDK before trusting webhook payloads.
3. **Idempotency.** Use idempotency keys for any state-changing API call (payments, emails, webhooks).
4. **Retries with backoff.** Build retry logic with exponential backoff and jitter for transient failures.
5. **Observability.** Log every external call with a correlation ID; alert on error rate spikes.
6. **Compliance.** For health, financial, or children's data, ensure the provider signs a BAA / DPA and supports the jurisdictions you serve.
7. **Region.** Choose providers that have data residency in your users' regions when required by law (NDPR in Nigeria, GDPR in EU, HIPAA in US).
8. **Cost ceilings.** Set billing alerts on every paid provider. Most outages start with a billing surprise.
9. **Vendor lock-in.** Abstract integrations behind interfaces so you can swap providers without rewriting the app.
10. **Graceful degradation.** If a provider is down, degrade gracefully — never make the whole app unusable because a single service is offline.

---

## Suggested Minimal Stack (for a new SaaS)

A pragmatic, production-ready baseline:

- **Email:** Resend
- **Auth:** Supabase Auth (or Clerk)
- **Payments (Nigeria):** Paystack or Flutterwave
- **Payments (Global):** Stripe
- **SMS / OTP:** Termii
- **WhatsApp:** Meta WhatsApp Business API
- **File storage:** Supabase Storage
- **Images:** Cloudinary
- **AI:** OpenAI or Anthropic
- **Maps / Geolocation:** Google Maps Platform
- **Errors:** Sentry
- **Analytics:** PostHog
- **Push notifications:** Firebase Cloud Messaging
- **Search:** Algolia or Typesense
- **Background jobs:** Trigger.dev or Inngest
- **Webhooks (outbound):** Svix or Hookdeck
- **Identity / KYC:** Smile Identity (Africa) or Persona (global)
- **PDF generation:** PDFMonkey or react-pdf
- **Video:** Mux
- **Feature flags:** PostHog or Unleash
- **Logging / infra monitoring:** Better Stack or Grafana Cloud
- **Currency / FX:** Open Exchange Rates (or Frankfurter for free)
- **Address validation:** Google Address Validation API or Loqate
- **Shipping / logistics:** Shippo or EasyPost (Sendbox / GIG for Nigeria)
- **Banking / Open Banking:** Mono or Okra (Nigeria), Plaid (global)
- **Captcha:** Cloudflare Turnstile
- **Secrets:** Doppler
- **CDN:** Cloudflare

This stack covers ~90% of needs for a typical African / global SaaS without overlapping vendors.