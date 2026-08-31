# Supabase Edge Functions Contract & Inventory

This document tracks all deployed and intended Supabase Edge Functions for the project.

---

## Edge Function Registry

### 1. `[example-function-name]`
- **Location:** `supabase/functions/[function-name]/index.ts`
- **Purpose:** Brief description of what this function executes.
- **HTTP Method:** `POST` / `GET`
- **Authentication Required:** Yes (`Bearer <token>` / Supabase JWT)
- **Environment Variables Required:**
  - `SUPABASE_SERVICE_ROLE_KEY`
  - `STRIPE_SECRET_KEY` (if external)
- **Database Tables Accessed:**
  - `public.profiles` (Read/Write)
- **Status:** 🟢 Deployed & Verified / 🟡 In Progress / 🔴 Broken / ⚫ Blocked
- **Invocation Example:**
  ```typescript
  const { data, error } = await supabase.functions.invoke('example-function-name', {
    body: { foo: 'bar' }
  });
  ```
