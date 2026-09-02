# Prompt 40: Database Integrity Audit

> **Stage 8 — Database**  
> **Target:** Orphaned records, missing foreign keys, incorrect relationships, nullable fields, duplicate data, missing unique constraints, missing indexes, inconsistent timestamps, broken cascades, race conditions  
> **Primary Output:** Database Integrity Report & Schema/Constraint Repairs

---

## Prompt Text

```text
# DATABASE INTEGRITY AUDIT

You are performing a complete data-integrity audit of the application's
database. If the project uses Supabase, cross-check against
`supabase/schema.sql`, `rls.sql`, `functions.sql`, and `storage.sql`
where they exist. If the project uses Prisma / Drizzle / Knex / raw SQL,
cross-check against the corresponding schema / migration files.

Your job is to inspect the actual schema and queries, identify real
integrity issues, and repair verified problems safely.

Do not invent issues.
Do not rewrite the schema unnecessarily.
Do not introduce breaking changes to existing data without a migration
plan.

---

# STEP 1 — INVENTORY

For every table / collection:

1. Table name
2. Primary key (type, default)
3. Columns (name, type, nullable, default)
4. Foreign keys (column → referenced table.column, on delete, on update)
5. Unique constraints (single + composite)
6. Check constraints
7. Indexes
8. Triggers
9. RLS policies (Supabase)
10. Owner / grants
11. Approximate row count (if known)
12. Hot write paths (which endpoints mutate this table)

Build the inventory before diagnosing anything.

---

# STEP 2 — ORPHANED RECORDS

Find rows that reference missing parents.

For each foreign-key-like column:

- Identify the intended referenced table
- Count rows where the value is non-null but the referenced row does
  not exist
- Identify the application code that creates or deletes these rows
- Determine whether the FK was missing or whether it was bypassed

Fixes:

- Add the foreign key (with a safe `ON DELETE` behavior)
- Backfill / reconcile orphans before adding NOT NULL constraints
- If a true FK is impossible (multi-tenant sharding), enforce the
  relationship in code with strict validation

---

# STEP 3 — MISSING FOREIGN KEYS

For every column whose name ends in `_id`, `Id`, `_uuid`, etc.:

- Verify a real FK exists (or is intentionally absent and justified)
- Verify the referenced table and column are correct
- Verify `ON DELETE` behavior is intentional (`CASCADE`, `SET NULL`,
  `RESTRICT`, `NO ACTION`)

Common fixes:

- `parent_id` missing FK
- `user_id`, `org_id`, `school_id`, `tenant_id` missing FKs
- `owner_id` typos (e.g. `userId` vs `user_id`)

---

# STEP 4 — INCORRECT RELATIONSHIPS

Audit:

- One-to-one relationships that should be one-to-many (or vice versa)
- Many-to-many tables missing their join table
- Polymorphic associations implemented via strings instead of typed FKs
- Self-referential trees without proper indexing
- Soft-delete patterns that never actually delete (acceptable, but
  document them)

For Supabase:

- Confirm `schema.sql` matches what queries assume
- Confirm the actual migration history is consistent

---

# STEP 5 — NULLABLE FIELDS THAT SHOULDN'T BE NULLABLE

For each nullable column determine:

- Is null a meaningful state? (e.g. `deleted_at`)
- Or is null a bug waiting to happen? (e.g. `user_id`, `email`,
  `amount`, `currency`, `status`, `created_at`)

For columns that should be `NOT NULL`:

- Add `NOT NULL` with a safe default (`DEFAULT now()`, `DEFAULT ''`,
  `DEFAULT 0`) where appropriate
- Backfill existing nulls before adding the constraint
- Avoid breaking reads that legitimately depend on optional fields

---

# STEP 6 — DUPLICATE DATA

Find:

- Tables where the same row can be inserted multiple times without
  intent (e.g. one user has two active subscriptions)
- Columns that store denormalized data and drift from the source of
  truth
- Missing unique constraints on natural keys:
  - `(provider, provider_transaction_id)`
  - `(provider, provider_event_id)`
  - `(user_id, slug)`
  - `(org_id, name)`
  - `(email)` where email is intended unique

Fixes:

- Add the unique constraint
- Deduplicate existing data first (keep the most recent or the one
  referenced by other tables)
- Update application code to use `INSERT ... ON CONFLICT` or upserts

---

# STEP 7 — MISSING INDEXES

For every:

- WHERE clause column
- JOIN column
- ORDER BY column
- GROUP BY column
- RLS policy that compares to the current user's id

…verify there is an index that covers the access pattern.

Supabase-specific:

- RLS policies that use `auth.uid()` and compare to `user_id` MUST be
  backed by an index on `(user_id)` (or composite) or the policy
  becomes a full-table scan

Fixes:

- Add B-tree indexes for equality / range
- Add partial indexes where only a subset of rows is queried
- Add GIN / BRIN / GiST indexes only when truly needed

Do not blindly add indexes — they have write cost.

---

# STEP 8 — INCONSISTENT TIMESTAMPS

Audit:

- `created_at`, `updated_at`, `deleted_at` consistency
- Mix of `timestamp without time zone` and `timestamptz`
- Mix of `now()` and `CURRENT_TIMESTAMP` and `Date.now()` from JS
- Columns where time is stored in different timezones
- Application code that reads a timestamp and assumes one zone

Fixes:

- Prefer `timestamptz` everywhere
- Set `DEFAULT now()` on `created_at`
- Use triggers (or app code) to maintain `updated_at`
- Avoid JS `Date.now()` for DB time — let the DB author the value

---

# STEP 9 — BROKEN CASCADE BEHAVIOR

For each FK:

- Confirm the chosen `ON DELETE` matches product intent
- Look for accidental `CASCADE` on `user_id` that wipes paid records
- Look for `RESTRICT` where you actually want soft delete

Common mistakes:

- Deleting a user cascades to their paid invoices (wrong)
- Deleting an organization keeps orphaned members (wrong)
- Deleting a subscription deletes the underlying order (wrong)

Fix:

- Replace with `SET NULL` or `RESTRICT` where cascades are wrong
- Use soft deletes (`is_deleted`, `deleted_at`) where history matters
- Document cascade behavior in the schema file

---

# STEP 10 — RACE CONDITIONS & CONCURRENCY

Find places where two simultaneous requests can corrupt data:

- `SELECT ... THEN INSERT` without unique protection
- Counter increments without `RETURNING` / atomic SQL
- "First check then write" patterns on payment, wallet, stock, credits
- Background workers running while users are also writing

Fixes:

- Use unique constraints to make inserts race-safe
- Use atomic updates (`UPDATE ... SET count = count + 1`)
- Use `SELECT ... FOR UPDATE` or advisory locks for read-modify-write
- Move the operation behind a transaction with proper isolation
- Use idempotency keys for externally-triggered writes (see STEP 11)

---

# STEP 11 — IDEMPOTENCY & EVENT TABLES

Where external events (webhooks, provider callbacks, queued jobs)
mutate the DB:

- Verify an event table exists with `(provider, provider_event_id)`
  unique
- Verify the handler inserts the event row inside the same transaction
  as the state change, so a duplicate event is rejected at the DB
  layer

If missing, add the table and the constraint.

---

# STEP 12 — SUPABASE-SPECIFIC

- RLS enabled on every public-schema table that contains user data
- Policies use `(SELECT auth.uid())` form for performance
- Policies are `USING` + `WITH CHECK` consistent
- `SECURITY DEFINER` functions have a locked `search_path` and are
  justified
- Storage RLS is consistent with table RLS
- Service-role usage is server-only (see API security prompts)
- `audit` columns exist for sensitive tables (`created_by`, `updated_by`,
  `deleted_by`)
- Sensitive columns (`password_hash`, `token`, `secret`) are not
  accidentally exposed via `select *` policies

---

# STEP 13 — REPAIR

For every verified issue:

1. Add migrations (idempotent: `CREATE TABLE IF NOT EXISTS`,
   `ALTER TABLE ... ADD CONSTRAINT IF NOT EXISTS`, etc., per
   `AI_RULES.md`)
2. Backfill or reconcile before adding NOT NULL / FK / UNIQUE
3. Add indexes in a migration with `CONCURRENTLY` where supported
4. Add RLS policies with explicit USING + WITH CHECK
5. Add the event-table + unique constraint for external events
6. Replace dangerous patterns with safe ones (atomic updates,
   transactions, locks)
7. Keep changes additive where possible

If a change requires dropping data or rewriting a column:

- Document the migration
- Provide a safe backfill plan
- Do not run destructive changes automatically if data loss is possible

---

# STEP 14 — VERIFY

Run, in order, and confirm all pass:

TYPECHECK → LINT → TEST → BUILD

Then, where feasible:

- Re-run the schema validation script
- Re-run any orphan detection queries
- Re-run any duplicate detection queries
- Re-run performance checks on hot queries (EXPLAIN / EXPLAIN ANALYZE)
- Confirm RLS is enabled and policies are correct on every table
- Smoke test affected user flows

---

# FINAL REPORT

Return a concise but complete report:

## Database Status

Overall: `HEALTHY / NEEDS ATTENTION / CRITICAL ISSUES`

## Tables Audited

List every table with its integrity health.

## Critical Issues

- Orphans
- Missing FKs
- Duplicate data risks
- Race conditions
- Missing event idempotency

## High-Risk Issues

- Missing indexes (especially for RLS)
- Cascade mistakes
- Nullable sensitive fields

## Medium / Low Issues

List remaining items.

## Migrations Applied

List every migration you added with file name and what it does.

## Verification

List checks executed and results.

## Remaining Manual Actions

Anything requiring data backfill, manual review, or provider config.

Do not claim a fix was verified unless it was actually verified.

---

# CORE DATABASE RULES

- Never silently drop columns or data.
- Always make migrations idempotent.
- Always add `IF NOT EXISTS` guards per project conventions.
- Never bypass RLS where it is required.
- Never store denormalized data that can drift without a trigger.
- Never use `SELECT ... THEN INSERT` for safety-critical writes.
- Never trust application-level "uniqueness checks" instead of DB
  constraints.
- Never claim integrity is healthy without running checks.
```