# Supabase 03: Clean Database Installation Test

> **Suite:** Supabase Database Engine  
> **Target:** Dependency order execution (Schema -> Functions -> RLS -> Storage) in a blank DB  
> **Output:** First-Run Migration Audit & Safe Idempotent Execution Report

---

## Prompt Text

```text
Treat the four SQL files as if they are being given to a completely new developer with an empty Supabase/PostgreSQL database.

Determine whether they can establish the database required by the application from scratch.

Test the dependency order:

1. schema.sql
2. functions.sql
3. rls.sql
4. storage.sql

Identify any statements that would fail because:

- An object does not exist yet
- A referenced function is missing
- A referenced table is missing
- A referenced column is missing
- A policy references an invalid object
- A trigger references a missing function
- A storage policy references an invalid bucket
- Permissions are incorrect
- SQL syntax is invalid
- A statement is not idempotent
- Objects are created in the wrong order

If the repository has a local PostgreSQL/Supabase environment, execute the scripts against it.

If an actual Supabase project is connected and available, verify against it without destroying existing production data.

DO NOT:

- Drop production tables
- Delete production data
- Reset a production database
- Disable security merely to make the scripts execute

Fix verified problems.

At the end, report whether a clean installation succeeds.

If it cannot be executed in the current environment, perform static verification and clearly state that execution could not be performed.
```
