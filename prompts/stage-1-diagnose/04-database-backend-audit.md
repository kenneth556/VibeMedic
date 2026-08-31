# Prompt 04: Database & Backend Integration Audit

> **Stage 1 — Diagnose**  
> **Target:** Schemas, tables, columns, foreign keys, queries, mutations, ownership & RLS  
> **Output:** Full Data Flow Trace & Schema/Query Mismatch Fixes

---

## Prompt Text

```text
Now perform a COMPLETE database and backend integration audit.

Inspect the ENTIRE application and trace all data flows between:

Frontend → API → Backend/Services → Database → Backend response → Frontend state/UI.

Audit:
- Database schemas
- Tables
- Columns
- Relationships
- Foreign keys
- Queries
- Inserts
- Updates
- Deletes
- Selects
- Joins
- RPC/functions
- API endpoints
- Server actions
- Services
- Repositories
- Database clients
- Authentication/session handling
- User IDs
- Organization IDs
- Ownership checks
- Authorization
- Row-level security/policies if applicable

Find:
- Database columns referenced by code but missing from the schema
- Schema columns never used
- Wrong column names
- Wrong table names
- Incorrect relationships
- Queries returning incorrect data
- Queries missing filters
- Data being written to the wrong record
- User data being mixed between users
- Missing ownership checks
- Missing authorization checks
- API endpoints that don't connect to the database
- UI expecting fields that the backend doesn't return
- Backend returning fields the frontend doesn't use
- Writes that appear successful but aren't persisted
- Database records that are created but never used
- Foreign-key problems
- Missing error handling
- Incorrect null handling
- Race conditions
- Duplicate records
- Missing transaction handling where necessary

Pay special attention to CRUD functionality.

For every major feature, verify:

CREATE → database
READ → database
UPDATE → database
DELETE → database

Do not modify database schema blindly.

If a schema change is genuinely required, clearly identify it before making it and ensure the application remains consistent with the change.

Fix verified integration problems.

Then run all available type checks, linting, tests, migrations/schema validation, and builds.

Report:
- Broken data flows
- Broken database connections
- Schema mismatches
- Security/authorization problems
- Fixes made
- Database changes made
- Remaining issues
```
