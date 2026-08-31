# Accessibility & Semantic HTML Audit Report

- **Date:** YYYY-MM-DD
- **Target App:** [App Name]
- **Auditor:** [AI Agent Name]

---

## 1. Compliance Checklist
- [ ] **Keyboard Navigation:** All interactive controls reachable via `Tab` / `Shift+Tab`.
- [ ] **Focus Management:** Modals trap focus; closing returns focus to trigger.
- [ ] **Form Labels:** Every input has an associated `<label>` or `aria-label`.
- [ ] **Color Contrast:** Text meets WCAG AA contrast ratio standards.
- [ ] **Screen Readers:** Icon buttons have descriptive `aria-label` attributes.

---

## 2. Issues Remedied
| Component / Element | Failure Observed | Fix Implemented |
| :--- | :--- | :--- |
| `IconButton` | Missing accessible name | Added `aria-label="Close dialog"` |
