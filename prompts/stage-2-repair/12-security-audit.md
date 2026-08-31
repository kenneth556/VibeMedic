# Prompt 12: Security, Vulnerability & IDOR Audit

> **Stage 2 — Repair**  
> **Target:** IDOR, XSS, SQLi, CSRF, RLS policies, token handling, client secret leaks  
> **Output:** Security Audit Matrix (Critical, High, Medium, Low) & Vulnerability Remediation

---

## Prompt Text

```text
Perform a security audit of the entire repository.

Inspect:

- Authentication
- Authorization
- Database access
- Row-level security/policies
- API endpoints
- User input
- Forms
- File uploads
- Storage
- Cookies
- Sessions
- Tokens
- Environment variables
- Secrets
- CORS
- CSRF protections where applicable
- XSS risks
- SQL injection risks
- Command injection risks
- Path traversal
- IDOR/access-control issues
- Sensitive data exposure
- Debug endpoints
- Development credentials
- Hardcoded secrets
- Client-side secrets
- Insecure redirects
- Overly permissive database policies

Pay special attention to:

"Can user A access, modify, delete, or retrieve user B's data by changing an ID?"

and:

"Can someone bypass a client-side restriction by calling the backend directly?"

Fix vulnerabilities that can safely be fixed.

Never solve a security issue by simply disabling authentication or authorization.

Never print secrets into logs.

Never commit credentials.

Afterward report:

CRITICAL
HIGH
MEDIUM
LOW

and explain every fix made.
```
