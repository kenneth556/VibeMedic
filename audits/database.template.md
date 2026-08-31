# Database & Backend Integration Report

- **Date:** YYYY-MM-DD
- **Target App:** [App Name]
- **Auditor:** [AI Agent Name]

---

## 1. Schema & Table Status
| Table Name | Purpose | RLS Enabled | Indexes Defined | Foreign Keys Valid |
|------------|---------|-------------|-----------------|--------------------|
| `public.profiles` | User accounts | ✅ Yes | `idx_profiles_email` | `auth.users(id)` |

---

## 2. Query & Mutation Alignment
- [ ] Every frontend query references existing columns.
- [ ] Every insert/mutation includes mandatory non-null fields.
- [ ] No N+1 query patterns observed in data tables or lists.

---

## 3. Discrepancies & Fixes Made
- **Mismatch:** [Column name typo in frontend vs. DB] ➔ **Fix:** [Synchronized query payload]
