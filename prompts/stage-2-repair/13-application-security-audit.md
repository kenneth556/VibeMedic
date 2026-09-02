# Prompt 13: Application Security Audit

> **Stage 2 — Repair**  
> **Target:** XSS, CSRF, injection, IDOR/BOLA, authentication, authorization, file upload security, unsafe redirects, SSRF, sensitive data exposure, session security, dependency vulnerabilities  
> **Primary Output:** Verified Application Security Posture & Remediation Backlog

---

## Prompt Text

```text
# APPLICATION SECURITY AUDIT

You are performing a complete application-layer security audit. This
goes broader than the API Security prompt — it covers the full
attack surface of the application itself, not only provider
integrations.

Your job is to inspect the actual code, identify real security
weaknesses, repair verified issues, and verify the fixes.

Do not invent vulnerabilities.
Do not rewrite working flows unnecessarily.
Do not treat an integration as secure merely because it appears to
work.

---

# OBJECTIVES

Identify and fix application-layer weaknesses in:

- XSS (cross-site scripting)
- CSRF (cross-site request forgery) where applicable
- Injection (SQL, NoSQL, command, template, header, log)
- IDOR / BOLA (broken object-level authorization)
- Authentication weaknesses
- Authorization weaknesses
- File upload security
- Unsafe redirects
- SSRF (server-side request forgery)
- Sensitive data exposure
- Session security
- Dependency vulnerabilities

Cross-reference with:

- The API Security Audit prompt for third-party provider concerns
- The Environment Variables & Secrets Audit prompt for secrets
- The Database Integrity Audit prompt for RLS / FK / privilege issues

---

# STEP 1 — INVENTORY OF TRUST BOUNDARIES

For every layer where untrusted input can enter or untrusted output
can leave, document:

- Trust boundary (browser → server, server → provider, server → DB,
  worker → DB)
- Inputs received
- Outputs returned
- Authentication enforced
- Authorization enforced
- Validation performed
- Logging performed

Map the entire data flow before diagnosing anything.

---

# STEP 2 — XSS

Audit every place user-controlled content can be rendered.

Failures (any of these = vulnerability):

- `dangerouslySetInnerHTML` without a sanitizer
- `v-html` without sanitization
- Server-rendered HTML that includes user input without escaping
- Markdown rendered with HTML enabled (`marked`, `markdown-it` with
  HTML allowed)
- URL rendering (`href`, `src`) without protocol allowlist (javascript:
  URLs)
- File upload that returns user-controlled Content-Type
- CSS injection via `style` attributes
- SVG uploads containing script
- Template injection in email subjects or content

Fixes:

- Sanitize with DOMPurify (browser) or a server-side equivalent
- Escape on render
- Use a strict CSP (Content Security Policy) with no `unsafe-inline`
- Allowlist protocols (`https:`, `mailto:`)
- Disable HTML in Markdown where possible
- Render user content in iframes with `sandbox` if embedding is needed

---

# STEP 3 — CSRF

Audit:

- POST / PUT / PATCH / DELETE endpoints
- Forms that submit to mutating endpoints
- Cookie-based authentication
- Server actions

For each mutating endpoint that relies on cookies for auth:

- Verify a CSRF defense exists (token, double-submit cookie, same-site
  cookie, framework-level protection)
- Verify the defense is actually applied, not just configured
- Verify the defense covers the actual HTTP method, not only POST

For Supabase / Next.js Server Actions:

- Verify they are protected by the framework's built-in CSRF /
  same-origin check
- Verify custom server actions do not introduce CSRF holes

Fix:

- Add CSRF tokens to forms
- Use SameSite=Lax or SameSite=Strict on auth cookies
- Verify Origin / Referer headers server-side for state-changing
  requests
- Use framework-provided CSRF protection (e.g. Next.js Server Actions,
  Rails CSRF, etc.) and do not disable it

---

# STEP 4 — INJECTION

Audit every input sink:

- SQL queries built by string concatenation
- `prisma.$queryRaw` with template literals (Prisma is safe IF no
  interpolation; otherwise vulnerable)
- `supabase.rpc()` calls passing raw strings
- NoSQL queries using `$where` with user input
- Shell commands built from user input
- File paths built from user input
- Template engines that re-evaluate (Handlebars, EJS, Liquid)
- Email headers (Subject, From) with user input
- Log injection (`\n` in user-controlled log values)

Fix:

- Use parameterized queries
- Use the ORM safely (no interpolation)
- Allowlist file paths
- Allowlist shell arguments
- Strip CR/LF from log values
- Validate email headers with an allowlist

---

# STEP 5 — IDOR / BOLA

For every endpoint / server action / DB call that accesses a row by
ID, ask:

> Can a user manipulate the ID to access another user's data?

Specifically check:

- URLs like `/orders/:id` that don't verify ownership
- Server actions that take a user-supplied UUID and `UPDATE` /
  `SELECT` / `DELETE` directly
- File downloads that don't verify ownership
- Admin endpoints with `role === 'admin'` check missing
- Multi-tenant endpoints that don't verify tenant membership
- Soft-deleted records that still resolve and are still readable

Fix:

- Always derive the row from the **authenticated user's context**,
  not from a client-supplied ID
- Cross-check ownership / tenant membership server-side
- Use Supabase RLS as the canonical enforcement
- Never rely on the frontend to filter

---

# STEP 6 — AUTHENTICATION & AUTHORIZATION

Audit:

- Are protected endpoints actually protected?
- Is the auth check present on every route, not just the happy path?
- Does logout actually invalidate server-side session / refresh
  token?
- Is password storage using argon2id / bcrypt (cost ≥ 12)?
- Are passwords checked against breached-password lists where
  relevant?
- Are email-verification requirements enforced before sensitive
  actions?
- Are sessions / tokens short-lived?
- Are refresh tokens rotated and old ones invalidated?

For authorization, audit:

- Role checks (`admin`, `org_owner`, `school_admin`) actually present
  on every privileged action
- Capability checks per role
- Feature flags / entitlements enforced server-side, not just UI

Fix:

- Add auth middleware
- Add explicit role checks
- Use framework-provided helpers (e.g. NextAuth session helpers,
  Supabase RLS, Clerk has)
- Move authz to RLS where possible

---

# STEP 7 — FILE UPLOAD SECURITY

Audit:

- File type validation (extension + MIME + magic bytes)
- File size limits
- Storage location (private vs public bucket)
- Filename sanitization
- Path traversal protection
- Antivirus / malware scanning (where available)
- Content-Type sniffing prevention
- SVG uploads (script-capable)
- Image processing safety (ImageMagick, sharp, etc.)

Fix:

- Validate by both extension and content
- Strip EXIF where privacy matters
- Reject SVGs as uploads OR sanitize them with DOMPurify
- Generate new filenames server-side (do not trust client filenames)
- Store in private buckets with signed URLs
- Apply per-user / per-tenant rate limits

---

# STEP 8 — UNSAFE REDIRECTS

Audit:

- `redirect()` calls that use user input as the destination
- OAuth callback `redirect_uri` validation
- Login redirect after auth
- Email "magic link" redirect

Fix:

- Allowlist redirect destinations
- Validate against the application's own origin
- Use relative paths where possible

---

# STEP 9 — SSRF

Audit:

- Server-side `fetch` calls that accept user-supplied URLs
- Image / OG / preview generators that hit a user URL
- Webhook destination configuration
- File ingestion from a URL

Fix:

- Allowlist hosts / schemes
- Resolve hostnames and reject private IP ranges (RFC1918,
  link-local, loopback)
- Block redirects to internal addresses
- Use a vetted HTTP client with SSRF protections

---

# STEP 10 — SENSITIVE DATA EXPOSURE

Audit:

- Stack traces returned to clients in error responses
- Verbose error messages that reveal internal paths, keys, or schema
- Server-rendered HTML that includes secrets
- Logs containing PII / PHI / secrets / cookies / auth headers
- Analytics events containing sensitive fields
- API responses over-fetching (returning `password_hash`, `token`,
  `secret`, `internal_id`)
- Browser devtools / source maps in production
- Debug-only endpoints left enabled in production (`/debug`,
  `/adminer`, `/_debugbar`)

Fix:

- Return generic error messages to clients; log details server-side
- Scrub sensitive fields before logging
- Strip production source maps or gate them behind auth
- Tighten API response payloads to exactly what the UI needs
- Disable debug tooling in production builds

---

# STEP 11 — SESSION SECURITY

Audit:

- Session cookie attributes: `Secure`, `HttpOnly`, `SameSite`
- Session expiry (idle and absolute)
- Session invalidation on logout (server-side, not just client-side)
- Session fixation defenses (new session on login)
- Concurrent session policy
- Refresh-token rotation
- JWT signing algorithm (HS256 vs RS256, key strength)
- JWT `aud`, `iss`, `exp`, `nbf` claims
- JWT revocation list where supported

Fix:

- Set proper cookie attributes
- Rotate refresh tokens and invalidate old
- Verify JWT claims server-side
- Reduce token lifetimes
- Invalidate sessions on password change / logout

---

# STEP 12 — DEPENDENCY VULNERABILITIES

Audit:

- `npm audit` / `pnpm audit` / `yarn audit`
- Snyk / GitHub Dependabot alerts
- Outdated critical dependencies
- Packages with known CVEs
- Packages with no recent activity (abandoned)
- Suspicious packages (typosquats, unknown publishers)

Fix:

- Update vulnerable packages
- Replace packages with no active maintainer
- Pin versions where appropriate
- Run a CI check that fails the build on high-severity vulnerabilities

---

# STEP 13 — SECURITY HEADERS

Verify the application emits, at minimum:

- `Content-Security-Policy` (with sensible defaults; no
  `unsafe-inline` for scripts)
- `Strict-Transport-Security`
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY` or `frame-ancestors 'none'`
- `Referrer-Policy: strict-origin-when-cross-origin`
- `Permissions-Policy` (camera, microphone, geolocation, etc.
  disabled unless needed)

Fix:

- Add headers at the framework level (e.g. Next.js `headers()`
  middleware, Express `helmet`, etc.)

---

# STEP 14 — REPAIR

For every verified vulnerability:

1. Apply the minimal, safe fix
2. Preserve existing functionality
3. Add or extend a test that fails without the fix
4. Run TYPECHECK → LINT → TEST → BUILD
5. Document the change

For vulnerabilities that cannot be fixed automatically (e.g.
provider-side, dashboard config), document:

- The vulnerability
- Why it exists
- The required fix
- Files / components involved
- Whether provider / dashboard configuration is required

---

# STEP 15 — VERIFY

After changes:

TYPECHECK → LINT → TEST → BUILD

Then, where feasible:

- Manual XSS payload test against every render path
- CSRF test on every mutating endpoint
- IDOR test for every row-by-ID endpoint
- SSRF test on every URL-accepting endpoint
- File upload test with malicious payloads
- Auth bypass attempts
- Authz escalation attempts (regular user → admin)
- Session fixation / replay attempts

---

# FINAL REPORT

## Security Status

Overall: `SECURE / NEEDS ATTENTION / CRITICAL ISSUES`

## Attack Surface

List every trust boundary and its current protection.

## Critical Issues

List critical vulnerabilities and what was fixed.

## High-Risk Issues

List high-risk vulnerabilities and fixes.

## Medium / Low Issues

List remaining issues.

## XSS / CSRF / Injection / IDOR

Specific findings and fixes per category.

## File Uploads

Findings and fixes.

## SSRF

Findings and fixes.

## Sensitive Data Exposure

Findings and fixes (no actual secrets in the report).

## Session Security

Findings and fixes.

## Dependency Vulnerabilities

Findings and fixes.

## Security Headers

Findings and fixes.

## Remaining Manual Actions

Anything requiring provider / dashboard / infra changes.

## Verification

List tests executed and results.

Do not claim a vulnerability was fixed unless it was actually fixed
and verified.

---

# CORE APPLICATION SECURITY RULES

- Never trust user input — anywhere.
- Never sanitize only on the client.
- Never rely on the frontend to enforce authorization.
- Never return stack traces to clients in production.
- Never log credentials, tokens, or PII.
- Never use `dangerouslySetInnerHTML` without sanitization.
- Never concatenate SQL.
- Never accept user-supplied URLs without allowlisting.
- Never accept user-supplied filenames without sanitization.
- Never store passwords in plain text or with weak hashing.
- Never trust an auth header without verifying it.
- Never ship with debug routes or source maps exposed.
- Never claim a fix is verified unless you actually verified it.
```