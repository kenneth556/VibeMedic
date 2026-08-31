# Architecture & Module Map Report

- **Date:** YYYY-MM-DD
- **Target App:** [App Name]
- **Auditor:** [AI Agent Name]

---

## 1. System Topology
- **Frontend Architecture:** (e.g. Next.js App Router, Vite React SPA, Remix)
- **State Management:** (e.g. Zustand, Redux, React Context, TanStack Query)
- **Backend / API Layer:** (e.g. Next.js Server Actions, Route Handlers, Express)
- **Database Layer:** (e.g. Supabase PostgreSQL, Prisma ORM, Drizzle)

---

## 2. Core Modules & Dependency Flow
```text
[Entry Point / Pages] ───▶ [Feature Modules] ───▶ [Shared Components / Hooks] ───▶ [Services / API Clients]
```

---

## 3. Coupling & Complexity Findings
- **Circular Dependencies Found:** None / [List if any]
- **Tightly Coupled Modules:** [List if any]
- **Dead / Orphaned Modules:** [List if any]

---

## 4. Safe Modification Zones
| Feature Area | Recommended Modification Location | Notes & Risks |
|--------------|-----------------------------------|---------------|
| Auth | `src/context/AuthContext.tsx` | Affects all protected routes |
| Dashboard Data | `src/services/analytics.ts` | Real DB queries only |
