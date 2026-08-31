# Supabase Source of Truth Engine

This directory provides the canonical SQL architecture and synchronization workflow for Supabase-backed applications.

---

## Directory Architecture

When an AI coding agent executes the Supabase audit prompts on a target application, it produces and maintains the following canonical database files:

```text
supabase/
├── schema.sql           # Table definitions, columns, primary keys, foreign keys, indexes
├── rls.sql              # Row Level Security enablement and granular tenant/ownership policies
├── functions.sql        # PostgreSQL triggers, stored procedures, RPC functions, and audit logic
├── storage.sql          # Supabase Storage bucket configurations and storage RLS policies
├── edge-functions.md    # Documentation and contract definitions for Supabase Edge Functions
└── README.md            # Database guide and setup instructions
```

---

## Supabase Workflow Prompts

| # | Prompt File | Purpose |
|---|-------------|---------|
| 1 | [`01-source-of-truth-generator.md`](./01-source-of-truth-generator.md) | Complete codebase audit to generate clean, idempotent SQL source-of-truth files. |
| 2 | [`02-sql-verification.md`](./02-sql-verification.md) | Independent verification of the 4 SQL files against application code, multi-user isolation, and syntax. |
| 3 | [`03-clean-db-setup-test.md`](./03-clean-db-setup-test.md) | Static and runtime verification of dependency order (`schema` → `functions` → `rls` → `storage`) for fresh project onboarding. |
| 4 | [`04-complete-resynchronization.md`](./04-complete-resynchronization.md) | Post-build re-synchronization across code, database schema, policies, storage, edge functions, and documentation. |

---

## Execution Dependency Order

When deploying SQL files to a blank PostgreSQL database or Supabase project, execute in this strict sequence:

1. **`schema.sql`** — Defines tables, columns, constraints, and relationships.
2. **`functions.sql`** — Defines PostgreSQL functions, trigger procedures, and security-definer routines referenced by triggers and RLS.
3. **`rls.sql`** — Enables RLS and attaches policies to existing tables.
4. **`storage.sql`** — Creates buckets and attaches storage policies.

---

## Starter Templates

Reference starter templates are located in [`templates/`](./templates/):
- [`schema.sql`](./templates/schema.sql)
- [`rls.sql`](./templates/rls.sql)
- [`functions.sql`](./templates/functions.sql)
- [`storage.sql`](./templates/storage.sql)
- [`edge-functions.md`](./templates/edge-functions.md)
