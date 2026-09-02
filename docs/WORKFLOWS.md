# VibeMedic: Preset Workflows & Recipes

Use these recipes for specific engineering scenarios.

---

## 1. The "Clean Clone / Fresh Developer" Onboarding Pass
When preparing a project for team collaboration or open-source release:

```text
Step 1: prompts/stage-1-diagnose/08-environment-setup-audit.md
Step 2: prompts/stage-1-diagnose/09-dependency-audit.md
Step 3: prompts/stage-5-standards-and-docs/32-project-documentation-generator.md
Step 4: prompts/stage-5-standards-and-docs/33-ai-rules-generator.md
```

---

## 2. The "Pre-Deployment Security & Resilience" Pass
Before shipping to production:

```text
Step 1: prompts/stage-1-diagnose/05-auth-security-audit.md
Step 2: prompts/stage-2-repair/12-security-audit.md
Step 3: prompts/stage-2-repair/13-application-security-audit.md
Step 4: prompts/stage-2-repair/11-error-resilience-audit.md
Step 5: supabase/02-sql-verification.md (if using Supabase)
Step 6: prompts/stage-1-diagnose/06-comprehensive-system-audit.md
```

---

## 3. The "Frontend-Backend Contract Alignment" Pass
When APIs return 400s or fields are silently missing from the UI:

```text
Step 1: prompts/stage-1-diagnose/10-api-contract-audit.md
Step 2: prompts/stage-1-diagnose/04-database-backend-audit.md
Step 3: prompts/stage-1-diagnose/02-dummy-data-audit.md
```

---

## 4. The "Mobile & Accessibility Certification" Pass
Ensuring ADA compliance, screen reader support, and mobile friendliness:

```text
Step 1: prompts/stage-2-repair/15-accessibility-audit.md
Step 2: prompts/stage-2-repair/16-responsive-design-audit.md
Step 3: prompts/stage-4-experience-and-polish/29-mobile-experience-pass.md
Step 4: prompts/stage-4-experience-and-polish/30-user-journey-audit.md
```

---

## 5. The "Third-Party APIs & Payments Hardening" Pass
Ensuring all external providers, secrets, webhooks, and payments are financially safe:

```text
Step 1: prompts/stage-6-api-integrations/34-api-integration-audit.md
Step 2: prompts/stage-6-api-integrations/35-api-security-audit.md
Step 3: prompts/stage-6-api-integrations/37-webhook-audit.md
Step 4: prompts/stage-7-payments/39-payment-flow-audit.md
```

---

## 6. The "Launch Readiness & Doctor's Checkup" Pass
Final comprehensive audit before going live:

```text
Step 1: prompts/stage-10-architecture/44-architecture-consistency-audit.md
Step 2: prompts/stage-9-testing/41-test-coverage-critical-path-audit.md
Step 3: prompts/stage-9-testing/43-regression-testing-after-repairs.md
Step 4: prompts/stage-11-production/45-production-readiness-audit.md
Step 5: prompts/stage-11-production/46-final-doctors-checkup.md
```
