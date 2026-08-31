# Master Feature Inventory & Verification Report

- **Date:** YYYY-MM-DD
- **Target App:** [App Name]
- **Auditor:** [AI Agent Name]

---

## 1. Feature Status Legend
- 🟢 **COMPLETE:** Implemented end-to-end and functional.
- 🟡 **PARTIAL:** Implemented partially; missing database persistence, loading states, or validation.
- 🔴 **NOT STARTED:** UI copy or empty route exists but no functionality.
- ⚫ **BLOCKED:** Missing external third-party API key, credentials, or architectural decision.

---

## 2. Master Feature Roster

| # | Feature Name | Location / Route | DB Tables | API / Handler | Status | Missing Components | Priority |
|---|--------------|------------------|-----------|---------------|--------|--------------------|----------|
| 1 | User Auth & Profile | `/login`, `/profile` | `profiles` | `supabase.auth` | 🟢 Complete | None | High |
| 2 | Billing & Stripe Checkout | `/pricing`, `/checkout` | `subscriptions` | `/api/checkout` | 🟡 Partial | Webhook handler unlinked | High |

---

## 3. Implementation Roadmap
1. [ ] **High Value / Quick Wins:**
2. [ ] **Core Functional Gaps:**
3. [ ] **Edge Cases & Verification:**
