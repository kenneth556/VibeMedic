# Prompt 35: API Security Audit & Repair

> **Stage 6 — API Integrations**  
> **Target:** Exposed secrets, missing authentication/authorization, IDOR, broken ownership checks, missing webhook verification, replay/idempotency gaps, payment verification vulnerabilities, CORS, injection, logging leaks, least-privilege violations  
> **Primary Output:** Verified Security Posture Across Every External API, Backend Route, Edge Function, Webhook, and Credential

---

## Prompt Text

```text
# API SECURITY AUDIT & REPAIR

You are performing a complete security audit of the application's external
API integrations, backend API routes, server functions, Supabase Edge
Functions, webhooks, authentication flows, payment integrations,
environment variables, and secrets.

Your job is to **inspect the actual codebase, identify real security
weaknesses, repair verified issues, and verify the fixes**.

Do not assume an integration is secure because it appears to work.

Do not invent vulnerabilities.

Do not rewrite working integrations unnecessarily.

---

# OBJECTIVES

Audit every external API and backend integration in the application.

Identify and fix:

- Exposed API keys
- Exposed secrets
- Client-side use of server-only credentials
- Hardcoded credentials
- Insecure environment variable usage
- Missing authentication
- Missing authorization
- Broken ownership checks
- Insecure API routes
- Insecure Supabase Edge Functions
- Unsafe Supabase service-role usage
- Missing webhook verification
- Unvalidated webhook payloads
- Payment verification vulnerabilities
- Replay attacks
- Duplicate payment processing
- Missing idempotency
- Excessive API permissions
- Missing rate limiting
- Unsafe external API responses
- Injection risks
- Sensitive information leakage
- Secrets appearing in logs
- Sensitive information appearing in error responses
- Unsafe retry behavior
- Missing timeout handling
- Insecure CORS configuration
- Insecure redirect handling
- SSRF risks where applicable
- Weak authentication/session handling
- Missing input validation
- Missing output validation
- Dependency vulnerabilities where relevant

---

# STEP 1 — DISCOVER EVERY INTEGRATION

Search the entire repository.

Do not rely only on package.json.

Look for:

- API URLs
- SDK imports
- fetch()
- axios
- HTTP clients
- Supabase client calls
- Supabase Edge Functions
- PostgreSQL RPC calls
- Webhooks
- Payment providers
- Email providers
- SMS providers
- AI providers
- Storage providers
- Authentication providers
- Analytics services
- Maps
- KYC services
- Shipping providers
- Any other third-party service

Search for patterns such as:

- API_KEY
- SECRET
- TOKEN
- PRIVATE_KEY
- SERVICE_ROLE
- PASSWORD
- AUTH
- BEARER
- WEBHOOK
- SIGNATURE
- STRIPE
- FLUTTERWAVE
- PAYSTACK
- RESEND
- OPENAI
- ANTHROPIC
- GEMINI
- TWILIO
- TERMII
- VERIFYME
- and other provider-specific identifiers discovered in the codebase.

Create an internal inventory of every integration.

For each integration determine:

1. Provider
2. Purpose
3. Frontend or backend usage
4. Authentication method
5. Credentials required
6. Environment variables used
7. API endpoints
8. Webhooks
9. Sensitive operations
10. Required security controls

---

# STEP 2 — AUDIT SECRET HANDLING

Verify that secret credentials are never exposed to users.

Check:

- Frontend source code
- Vite environment variables
- React components
- Browser network requests
- Public configuration
- Git history where accessible
- .env files
- .env.example
- Build configuration
- Server functions
- Edge Functions

Never expose:

- Secret API keys
- Private API keys
- Database passwords
- Supabase service-role keys
- Payment secret keys
- Webhook signing secrets
- Private tokens
- OAuth client secrets
- Encryption keys
- Server credentials

For Vite applications, remember that variables exposed through the
frontend build are public.

Do not treat an environment variable as secret merely because it comes
from an environment file.

If a secret is required by the browser, redesign the flow so that the
sensitive operation occurs server-side.

---

# STEP 3 — SUPABASE SECURITY

Audit all Supabase usage.

Verify:

- The Supabase anon/publishable key is used appropriately on the client.
- Supabase service-role credentials are NEVER exposed to the browser.
- Service-role credentials exist only in trusted server-side environments.
- Row Level Security is enabled where required.
- RLS policies correctly enforce ownership and authorization.
- RPC functions do not bypass intended authorization.
- SECURITY DEFINER functions are justified.
- SECURITY DEFINER functions use a safe search_path.
- Edge Functions validate authentication where required.
- Edge Functions enforce authorization rather than merely authentication.
- Sensitive database operations are never trusted solely because they
  originate from the frontend.

Cross-check API behavior against `schema.sql`, `rls.sql`, and
`functions.sql` when those files exist.

---

# STEP 4 — INPUT VALIDATION

Every externally controllable input must be treated as untrusted.

Audit:

- Request bodies
- Query parameters
- URL parameters
- Headers
- File uploads
- Webhook payloads
- Payment metadata
- User-provided URLs
- IDs
- Search queries
- Filters
- Sort parameters

Verify that inputs are:

- Validated
- Type-checked
- Sanitized where appropriate
- Subject to reasonable size limits
- Rejected when malformed

Do not rely exclusively on frontend validation.

Important validation must happen server-side.

---

# STEP 5 — AUTHENTICATION & AUTHORIZATION

For every sensitive API operation determine:

> Who can call this?

Then determine:

> What are they allowed to do?

Do not confuse authentication with authorization.

An authenticated user must not automatically be allowed to:

- Read another user's data
- Modify another user's data
- Delete another user's resources
- Access another organization's resources
- Access another school's resources
- Perform administrative operations
- Trigger privileged functions
- View private files

Check for IDOR/BOLA-style vulnerabilities where a user can manipulate an
ID to access another user's resource.

---

# STEP 6 — PAYMENT SECURITY

For every payment integration such as Flutterwave, Paystack, Stripe, or
another provider:

Never trust the frontend's claim that payment succeeded.

Verify payment server-side.

Audit:

- Transaction verification
- Payment status
- Transaction/reference IDs
- Amount
- Currency
- Customer
- Product/order
- Expected merchant/account
- Webhook signatures
- Webhook payloads
- Duplicate events
- Replay attempts
- Refund handling
- Failed payments
- Cancelled payments
- Expired payments

A secure general flow should resemble:

User
→ Payment initialization
→ Payment provider
→ Provider callback/webhook
→ Verify webhook authenticity
→ Validate payload
→ Server-side transaction verification
→ Validate expected amount/currency/reference
→ Idempotently update database
→ Grant product/service access

Never grant paid access merely because:

- The browser redirected to a success page
- The frontend reported success
- A client-side callback said success
- A user supplied a transaction ID

---

# STEP 7 — WEBHOOK SECURITY

Find every webhook endpoint.

For each webhook verify:

- Signature verification
- Authenticity verification
- Payload validation
- Required fields
- Event type validation
- Timestamp/replay protection where supported
- Idempotent processing
- Duplicate-event handling
- Authorization where applicable
- Safe error handling

Do not blindly trust webhook JSON.

Do not perform destructive or financially significant operations before
authenticity has been established.

Where the provider supports webhook signatures, use the provider's
official verification mechanism.

---

# STEP 8 — IDEMPOTENCY

Identify operations that could accidentally execute more than once.

Especially:

- Payments
- Orders
- Subscriptions
- Refunds
- Credits
- Wallet transactions
- Email sending
- Webhooks
- Database mutations
- Account provisioning

Where appropriate, implement idempotency using:

- Provider-supported idempotency keys
- Unique database constraints
- Event IDs
- Transaction references
- Safe state transitions
- Database transactions

Do not solve duplicate processing merely with frontend button disabling.

---

# STEP 9 — RATE LIMITING

Identify sensitive or abuse-prone endpoints.

Consider rate limiting for:

- Login
- Signup
- Password reset
- OTP requests
- Email sending
- SMS sending
- AI generation
- Search
- File uploads
- Payment initialization
- Webhooks
- Expensive database operations
- Administrative operations

Do not add arbitrary rate limits without understanding the deployment
environment.

Use the appropriate mechanism for the application's architecture.

---

# STEP 10 — EXTERNAL API RESPONSES

Treat external API responses as untrusted input.

Verify:

- Expected status codes
- Expected response structure
- Required fields
- Data types
- Provider error states
- Unexpected/null values

Do not blindly trust an external API response and immediately write
arbitrary fields into the database.

Validate important values before using them.

---

# STEP 11 — TIMEOUTS & FAILURE HANDLING

Every important external API request should have appropriate timeout and
failure handling.

Check:

- Network failures
- Timeout failures
- DNS failures
- Provider downtime
- Rate limits
- 4xx errors
- 5xx errors
- Malformed responses

The application should fail gracefully.

Never leave users indefinitely waiting for an external service.

---

# STEP 12 — RETRIES

Identify retry logic.

Retries must be safe for the operation.

Safe retry candidates may include certain read operations or explicitly
idempotent operations.

Be extremely careful with:

- Payments
- Transfers
- Refunds
- Order creation
- Credit allocation
- Email/SMS sending
- Other operations with side effects

Never blindly retry a financially significant operation.

Use idempotency mechanisms where supported.

---

# STEP 13 — CORS & HTTP SECURITY

Audit:

- CORS
- Allowed origins
- HTTP methods
- Credentials
- Security headers
- Redirect behavior
- Content types
- Cache behavior for sensitive responses

Do not use unrestricted CORS merely to make an integration work.

If the application genuinely requires public cross-origin access,
document why.

---

# STEP 14 — LOGGING

Search logs and error handling.

Ensure the application does not log:

- API keys
- Passwords
- Access tokens
- Refresh tokens
- Webhook secrets
- Payment credentials
- Full sensitive identity information
- Private user data unnecessarily

Errors should provide enough information for debugging without exposing
sensitive information to users.

---

# STEP 15 — LEAST PRIVILEGE

For every integration determine:

> What is the minimum permission this credential needs?

Prefer:

- Restricted API keys
- Scoped tokens
- Read-only credentials where possible
- Separate development/production credentials
- Separate credentials for different services

Do not use a highly privileged credential when a restricted credential
is sufficient.

---

# STEP 16 — COMPROMISED CREDENTIALS

If the repository contains a credential that appears to be real:

1. Do not reproduce the credential in your final report.
2. Remove it from source code.
3. Replace the implementation with secure environment-variable usage.
4. Warn that the credential should be rotated/revoked immediately.
5. Check for other occurrences.
6. If Git history is accessible, determine whether the secret was
   committed previously.
7. Do not claim the credential has been revoked unless you actually
   have the ability to revoke it.

Never print secrets in your report.

---

# STEP 17 — REPAIR

After completing the audit:

Fix every **verified** security issue that can safely be fixed within the
repository.

Do not make speculative security changes that could break legitimate
application behavior.

Preserve existing functionality.

Use the project's existing architecture and conventions where possible.

If a security issue cannot be safely fixed automatically, document:

- The vulnerability
- Why it exists
- Recommended fix
- Files/components involved
- Whether manual provider/dashboard configuration is required

---

# STEP 18 — VERIFY

After making changes:

Run the project's available:

- Typecheck
- Linter
- Tests
- Build
- Relevant integration tests
- Security checks

Re-inspect the modified integrations.

Confirm:

- Secrets are no longer exposed.
- Server-only credentials remain server-side.
- Authentication works.
- Authorization works.
- Payment verification is server-side.
- Webhooks are verified.
- Duplicate webhook/payment processing is prevented where required.
- External responses are validated.
- Failures are handled.
- Sensitive data is not leaked through logs/errors.
- Existing functionality still works.

---

# FINAL REPORT

Return a concise but complete report containing:

## Security Status

Overall status:
`SECURE / NEEDS ATTENTION / CRITICAL ISSUES`

## Integrations Audited

List every discovered external integration.

## Critical Issues

List critical vulnerabilities and what was fixed.

## High-Risk Issues

List high-risk vulnerabilities and fixes.

## Medium / Low Issues

List remaining issues.

## Secrets

State whether secrets were found exposed.

Never print the actual secret.

## Payments

List payment providers and whether:

- Server-side verification exists
- Webhooks are verified
- Idempotency exists
- Duplicate processing is prevented

## Webhooks

List every webhook and its verification status.

## Supabase

Report:

- Service-role exposure
- RLS status
- Authorization issues
- RPC/function concerns
- Edge Function concerns

## Remaining Manual Actions

List anything that requires:

- API dashboard configuration
- Credential rotation
- Provider configuration
- Infrastructure changes
- Human review

## Verification

List the tests/checks executed and their results.

Do not claim something was tested if it was not actually tested.

---

# CORE SECURITY RULES

Always enforce these principles:

- Never expose secret API keys in frontend code.
- Never commit API keys or secrets to Git.
- Store secrets in environment variables or a secure secrets manager.
- Never trust payment success messages from the client.
- Verify payment transactions server-side.
- Verify webhook signatures.
- Validate all webhook payloads.
- Implement idempotency for payment/webhook operations.
- Apply rate limiting to sensitive endpoints.
- Never expose admin/service-role keys to browsers.
- Keep Supabase service-role keys server-side only.
- Validate and sanitize external API responses.
- Handle API timeouts and failures gracefully.
- Implement retries only when safe.
- Never blindly retry payment operations.
- Log useful errors without logging secrets or sensitive user data.
- Use least-privilege API credentials where supported.
- Rotate compromised credentials immediately.
- Never confuse authentication with authorization.
- Never trust client-side validation for security-sensitive operations.
- Never assume an external API response is trustworthy merely because
  it came from an established provider.
- Never claim a security fix was verified unless it was actually
  verified.
```