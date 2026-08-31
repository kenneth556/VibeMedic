# Prompt 05: Authentication, Permissions & User Data Isolation Audit

> **Stage 1 — Diagnose**  
> **Target:** Auth flows, sessions, roles, admin guards, IDOR, tenant data isolation  
> **Output:** Security & Authorization Vulnerability Report and Hardening Fixes

---

## Prompt Text

```text
Now perform a COMPLETE authentication, authorization, permissions, and user-data-isolation audit.

Inspect the ENTIRE codebase.

Trace:
- Sign up
- Login
- Logout
- Session persistence
- Session refresh
- Password reset
- Email verification
- Authentication middleware
- Protected routes
- Protected API endpoints
- User identity
- Roles
- Permissions
- Admin access
- Database ownership
- Row-level security/policies if applicable

Look for:
- Protected pages accessible without authentication
- Protected API endpoints accessible without authentication
- Missing authorization checks
- Admin functionality accessible to normal users
- Users able to access another user's records
- IDs accepted from the frontend without verifying ownership
- Missing server-side permission checks
- Client-side-only authorization
- Incorrect role checks
- Broken session handling
- Authentication state inconsistencies
- Logout not properly clearing state
- Expired sessions not handled
- Incorrect user IDs
- Hardcoded user IDs
- Test accounts accidentally used by production functionality
- Database queries that don't filter by the authenticated user where they should
- APIs trusting user-provided ownership information
- Sensitive data unnecessarily exposed to the frontend

For every important protected operation, verify:

Authenticated user → authorized role → ownership/permission → database operation.

Do not weaken security to make functionality work.

Fix verified security and authorization problems without breaking legitimate application access.

After fixing, run type checking, linting, tests, and build checks.

Report:
1. Authentication problems
2. Authorization problems
3. User-isolation problems
4. Security problems
5. Fixes made
6. Anything requiring manual security testing
```
