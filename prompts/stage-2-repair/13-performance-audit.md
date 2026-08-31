# Prompt 13: Application Performance & Optimization Audit

> **Stage 2 — Repair**  
> **Target:** N+1 queries, React re-renders, bundle size, caching, memory leaks, realtime subs  
> **Output:** Performance Diagnostics & Safe High-Impact Optimizations

---

## Prompt Text

```text
Perform a complete application performance audit.

Inspect:

- Database queries
- API requests
- React rendering
- Component re-renders
- State management
- Large lists
- Images
- Assets
- Bundle size
- Lazy loading
- Code splitting
- Caching
- Network requests
- Duplicate requests
- N+1 database queries
- Expensive calculations
- Memory leaks
- Event listeners
- Timers
- Subscriptions
- Realtime connections

Find obvious performance problems.

Prioritize real measurable or clearly identifiable problems over premature optimization.

Fix safe, high-impact issues without changing application behavior.

Do not optimize code merely because it looks unconventional.

Verify that performance changes do not introduce regressions.

Run typecheck, lint, tests, and build afterward.
```
