# Supabase 04: Post-Build Database & Codebase Re-Synchronization

> **Suite:** Supabase Database Engine  
> **Target:** Complete re-synchronization across Application Code, Schema, RLS, Functions, Storage, and Edge Functions  
> **Output:** Full Sync Report (Code Fixes, SQL Updates, Docs Sync, Mismatch Resolution)

---

## Prompt Text

```text
The application has gone through a significant development/brainstorming/feature-implementation session.

Your job is to perform a COMPLETE RE-SYNCHRONIZATION of the repository.

Do not assume previous documentation, SQL files, feature inventories, or architecture reports are still accurate.

Treat the CURRENT CODEBASE as the source of truth for what is actually implemented.

Inspect everything again.

━━━━━━━━━━━━━━━━━━━━
1. FEATURES
━━━━━━━━━━━━━━━━━━━━

Identify:

- New features
- Removed features
- Modified features
- Partially implemented features
- Newly broken features
- Newly required database functionality

Update the feature inventory/documentation accordingly.

━━━━━━━━━━━━━━━━━━━━
2. DATABASE
━━━━━━━━━━━━━━━━━━━━

Compare the CURRENT APPLICATION against:

schema.sql
rls.sql
functions.sql
storage.sql

Find all mismatches.

For every application database interaction verify:

TABLE
→ COLUMN
→ RELATIONSHIP
→ QUERY
→ RLS
→ RESPONSE

Update the SQL files so they represent the CURRENT intended application state.

━━━━━━━━━━━━━━━━━━━━
3. SCHEMA.SQL
━━━━━━━━━━━━━━━━━━━━

Update schema.sql to contain the complete current table structure.

Requirements:

- Tables only
- CREATE TABLE IF NOT EXISTS
- Correct columns
- Correct types
- Correct defaults
- Correct primary keys
- Correct foreign keys
- Correct constraints
- Required indexes where appropriate

Do not add obsolete tables.

Do not add speculative tables.

Do not include seed/demo data.

━━━━━━━━━━━━━━━━━━━━
4. RLS.SQL
━━━━━━━━━━━━━━━━━━━━

Update RLS for the current application.

For every table determine:

- Should RLS be enabled?
- Who can SELECT?
- Who can INSERT?
- Who can UPDATE?
- Who can DELETE?

Ensure policies match the CURRENT authentication and authorization architecture.

Remove obsolete policies.

Prevent duplicate policies.

Keep policies idempotent.

Never weaken security merely to make functionality work.

━━━━━━━━━━━━━━━━━━━━
5. FUNCTIONS.SQL
━━━━━━━━━━━━━━━━━━━━

Update PostgreSQL functions and triggers.

Inspect:

- RPC calls
- Database functions
- Trigger functions
- Triggers
- Automatic database behavior

Remove obsolete definitions from the source-of-truth script.

Add newly required functionality.

Use CREATE OR REPLACE FUNCTION where appropriate.

Do not confuse PostgreSQL functions with Supabase Edge Functions.

━━━━━━━━━━━━━━━━━━━━
6. STORAGE.SQL
━━━━━━━━━━━━━━━━━━━━

Re-scan the application for storage usage.

Determine:

- Required buckets
- Public/private configuration
- Upload requirements
- Download requirements
- Signed URLs
- Storage RLS policies
- File ownership

Add new required buckets.

Remove obsolete source-of-truth definitions.

Do not make private data public.

━━━━━━━━━━━━━━━━━━━━
7. EDGE FUNCTIONS
━━━━━━━━━━━━━━━━━━━━

Scan the repository for Supabase Edge Functions.

For every Edge Function verify:

- It still exists
- It is still referenced
- Environment variables
- Authentication
- Database access
- API dependencies
- Input validation
- Error handling

Do NOT put Edge Function source code into functions.sql.

If the project contains an Edge Function deployment/configuration document, update it as appropriate.

━━━━━━━━━━━━━━━━━━━━
8. APPLICATION CODE
━━━━━━━━━━━━━━━━━━━━

Search for:

- Queries against nonexistent tables
- Queries against nonexistent columns
- RPC calls to nonexistent functions
- Storage calls to nonexistent buckets
- Hardcoded IDs
- Old table names
- Old column names
- Obsolete feature flags
- Dead API endpoints
- Broken imports
- Broken types

Fix verified mismatches.

━━━━━━━━━━━━━━━━━━━━
9. DOCUMENTATION
━━━━━━━━━━━━━━━━━━━━

Update relevant documentation so it matches the current codebase.

Pay particular attention to:

README.md
FEATURES.md
ARCHITECTURE.md
DEVELOPMENT.md
AI_RULES.md
REPAIR_STATUS.md

Never document a feature as complete when the implementation is incomplete.

━━━━━━━━━━━━━━━━━━━━
10. VERIFICATION
━━━━━━━━━━━━━━━━━━━━

Run:

- Typecheck
- Lint
- Tests
- Build
- SQL validation where available

Perform a final consistency check:

APPLICATION
↕
SCHEMA
↕
RLS
↕
FUNCTIONS
↕
STORAGE
↕
AUTH
↕
EDGE FUNCTIONS

Everything should agree.

━━━━━━━━━━━━━━━━━━━━
FINAL REPORT
━━━━━━━━━━━━━━━━━━━━

Report:

### NEW FEATURES
What was added.

### MODIFIED FEATURES
What changed.

### DATABASE CHANGES
What changed in schema.sql.

### RLS CHANGES
What changed in rls.sql.

### FUNCTION CHANGES
What changed in functions.sql.

### STORAGE CHANGES
What changed in storage.sql.

### EDGE FUNCTIONS
What changed or needs attention.

### CODE FIXES
Application changes made.

### DOCUMENTATION
Files updated.

### REMAINING MISMATCHES
Anything still inconsistent.

### BLOCKED
Anything requiring actual Supabase credentials/project access or human decisions.

Do not claim synchronization is complete until the application and SQL source-of-truth files are consistent.
```
