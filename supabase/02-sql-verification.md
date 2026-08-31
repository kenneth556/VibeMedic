# Supabase 02: Independent SQL Verification

> **Suite:** Supabase Database Engine  
> **Target:** Static & runtime validation of `schema.sql`, `rls.sql`, `functions.sql`, `storage.sql`  
> **Output:** Mismatch Remediation, Multi-User Isolation Checks & Internal Consistency

---

## Prompt Text

```text
Now perform an independent verification of:

schema.sql
rls.sql
functions.sql
storage.sql

Treat these files as potentially incorrect.

Compare them against the ENTIRE application codebase.

For every database interaction, trace:

APPLICATION
→ SUPABASE CLIENT
→ TABLE/RPC/STORAGE
→ DATABASE OBJECT
→ RLS
→ RESPONSE

Find:

- Missing tables
- Missing columns
- Incorrect column types
- Wrong relationships
- Missing foreign keys
- Incorrect foreign keys
- Missing indexes where clearly required
- Incorrect defaults
- Incorrect nullable/non-nullable definitions
- Missing RLS
- Overly permissive RLS
- Policies that prevent legitimate application functionality
- Policies that allow unauthorized access
- Missing PostgreSQL functions
- Incorrect function signatures
- Missing triggers
- Incorrect trigger behavior
- Missing storage buckets
- Incorrect bucket access
- Incorrect storage policies
- Application references to nonexistent objects
- SQL references to nonexistent application objects
- Duplicate definitions
- Non-idempotent statements

Pay particular attention to multi-user data isolation.

Ask:

"Can User A access User B's data?"

"Can User A modify User B's data?"

"Can an unauthenticated user access protected data?"

"Can the frontend bypass the intended authorization?"

Fix every verified problem.

Then verify that the four SQL files remain internally consistent.

Do not create unnecessary schema objects.
```
