# Supabase 01: Database Source-of-Truth Generation

> **Suite:** Supabase Database Engine  
> **Target:** Complete codebase inspection to generate canonical SQL infrastructure  
> **Output:** `schema.sql`, `rls.sql`, `functions.sql`, `storage.sql`

---

## Prompt Text

```text
Perform a COMPLETE Supabase database audit of the entire repository.

This is a DATABASE SOURCE-OF-TRUTH GENERATION TASK.

Inspect the ENTIRE codebase before creating anything.

Inspect:

- All frontend code
- Backend code
- API routes
- Supabase client usage
- Supabase queries
- Supabase RPC calls
- Database types
- TypeScript interfaces
- Existing migrations
- Existing SQL files
- Database services
- Authentication logic
- Storage usage
- File upload/download code
- Realtime subscriptions
- Database triggers
- PostgreSQL functions
- Edge Functions
- Environment configuration
- Feature implementations
- Forms that write to the database
- Pages that read from the database

Determine EXACTLY what database infrastructure the application actually requires.

Then create/update these files at the appropriate repository location:

schema.sql
rls.sql
functions.sql
storage.sql

IMPORTANT:
These files must represent the CURRENT intended database state of the application.

━━━━━━━━━━━━━━━━━━━━
SCHEMA.SQL
━━━━━━━━━━━━━━━━━━━━

Create schema.sql containing TABLE CREATION ONLY.

It should define:

- All required tables
- Columns
- Data types
- Defaults
- Primary keys
- Foreign keys
- Unique constraints
- Check constraints
- Required indexes where appropriate

Every CREATE TABLE statement MUST use:

CREATE TABLE IF NOT EXISTS

Do not put the following in schema.sql:

- RLS policies
- CREATE POLICY
- Storage buckets
- Storage policies
- PostgreSQL functions
- Triggers
- Edge Functions
- Application seed/demo data
- Fake data

The purpose of schema.sql is ONLY to establish the tables and their structural relationships.

Before creating a table, verify that it is actually required by the application.

Do not create tables merely because they seem useful.

━━━━━━━━━━━━━━━━━━━━
RLS.SQL
━━━━━━━━━━━━━━━━━━━━

Create rls.sql containing the Row Level Security configuration for ALL application tables.

For every table determine whether RLS is required.

Where appropriate:

ALTER TABLE ... ENABLE ROW LEVEL SECURITY;

Then create policies for:

- SELECT
- INSERT
- UPDATE
- DELETE

as required by the application's actual authorization model.

Policies must reflect:

- authenticated users
- user ownership
- roles
- organizations/schools/teams where applicable
- admin access
- public access where intentionally required

Do NOT create insecure policies such as:

USING (true)

or

WITH CHECK (true)

unless the table is genuinely intended to be publicly writable/readable.

Do not rely on frontend authorization.

Database security must enforce authorization independently.

Use:

CREATE POLICY IF NOT EXISTS

where supported by the project's PostgreSQL/Supabase environment.

If PostgreSQL syntax does not support CREATE POLICY IF NOT EXISTS in the target environment, use a safe idempotent DO block instead.

Every policy must be safe to run repeatedly.

Do not create duplicate policies.

━━━━━━━━━━━━━━━━━━━━
FUNCTIONS.SQL
━━━━━━━━━━━━━━━━━━━━

Create functions.sql containing PostgreSQL-side functionality actually required by the application.

Inspect the codebase for:

- Supabase RPC calls
- PostgreSQL functions
- Triggers
- Trigger functions
- Database-side calculations
- Automatic timestamps
- Automatic profile creation
- Audit functionality
- Business logic intentionally implemented in PostgreSQL

For each required PostgreSQL function:

- Make it idempotent where practical.
- Use CREATE OR REPLACE FUNCTION where appropriate.
- Preserve correct permissions/security.
- Use SECURITY DEFINER only when genuinely required.
- Set an appropriate search_path when using SECURITY DEFINER.
- Do not introduce insecure dynamic SQL.

Include required triggers and trigger functions here if they are part of the application's database behavior.

IMPORTANT:

Supabase Edge Functions are NOT PostgreSQL functions.

If the repository contains Supabase Edge Functions, DO NOT convert them into SQL.

Instead, document the Edge Functions separately in the final report and identify:

- Function name
- Location
- Purpose
- Required environment variables
- Database tables accessed
- Whether authentication is required
- Whether it is complete/broken

━━━━━━━━━━━━━━━━━━━━
STORAGE.SQL
━━━━━━━━━━━━━━━━━━━━

Inspect the ENTIRE application for Supabase Storage usage.

Search for:

- storage.from(...)
- bucket names
- file uploads
- file downloads
- public URLs
- signed URLs
- avatars
- documents
- images
- attachments
- videos
- exports
- generated files

Determine which buckets are ACTUALLY required.

For each required bucket:

- Create the bucket safely/idempotently.
- Configure public/private access correctly.
- Define appropriate file restrictions where applicable.
- Define Storage RLS policies.
- Ensure users cannot access files belonging to other users unless intentionally allowed.
- Ensure upload/update/delete permissions match the application.

Do not create unnecessary buckets.

Do not make private buckets public just to make the UI work.

━━━━━━━━━━━━━━━━━━━━
DATABASE CONSISTENCY CHECK
━━━━━━━━━━━━━━━━━━━━

After generating all four files, verify consistency between them.

Check:

schema.sql
      ↓
rls.sql
      ↓
functions.sql
      ↓
storage.sql

Make sure:

- Every referenced table exists.
- Every referenced column exists.
- Every foreign key references a real table/column.
- Every RLS policy references valid columns/functions.
- Every PostgreSQL function references valid tables/columns.
- Every trigger references a valid function.
- Every storage policy references valid bucket configuration.
- No duplicate definitions exist.
- No orphaned tables exist unless intentionally required.
- No application code references missing database objects.

Also compare the generated SQL against the existing database migrations.

If migrations contain functionality that the application still requires, incorporate that final intended state into the appropriate SQL file.

Do NOT blindly copy old migrations.

The four SQL files should represent the CLEAN CURRENT STATE, not historical migration steps.

━━━━━━━━━━━━━━━━━━━━
IDEMPOTENCY
━━━━━━━━━━━━━━━━━━━━

The SQL files should be designed to be safely rerunnable wherever PostgreSQL/Supabase syntax permits.

Avoid scripts that fail simply because the object already exists.

Use appropriate:

CREATE TABLE IF NOT EXISTS
CREATE OR REPLACE FUNCTION
safe DO blocks
safe ALTER logic

where appropriate.

Do not use destructive commands such as:

DROP TABLE
DROP COLUMN
DROP DATABASE

unless explicitly required and explicitly justified.

━━━━━━━━━━━━━━━━━━━━
FINAL VERIFICATION
━━━━━━━━━━━━━━━━━━━━

Search the entire codebase one final time.

Find every:

table
column
foreign key
RPC
PostgreSQL function
trigger
storage bucket
storage operation
Supabase query

and verify it has a corresponding database definition where required.

Then report:

### TABLES
Every table discovered and its purpose.

### RLS
Every table and whether RLS is enabled, including the policies created.

### FUNCTIONS
Every PostgreSQL function/trigger created.

### STORAGE
Every bucket and its purpose.

### EDGE FUNCTIONS
Every Supabase Edge Function discovered separately.

### MISMATCHES
Anything the code expects that the SQL does not provide.

### UNUSED DATABASE OBJECTS
Objects that appear unused.

### BLOCKED
Anything requiring access to the actual Supabase project or information unavailable in the repository.

Do not invent database requirements.

Do not create fake data.

Do not modify application functionality unless necessary to resolve a verified database mismatch.
```
