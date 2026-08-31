# Prompt 08: Environment & Clean Setup Audit

> **Stage 1 — Diagnose**  
> **Target:** Package manager, lockfiles, runtime versions, scripts, env vars, clean clone readiness  
> **Output:** Setup Pipeline Audit & Developer Onboarding Fixes

---

## Prompt Text

```text
Audit the repository as if a completely new developer has just cloned it.

Determine whether the project can actually be installed, configured, run, tested, and built from a clean environment.

Check:

- package manager
- package.json
- lockfiles
- Node/runtime requirements
- dependencies
- missing dependencies
- conflicting dependencies
- scripts
- environment variables
- .env.example
- configuration files
- database configuration
- migrations
- seed scripts
- authentication configuration
- API configuration
- build configuration
- development configuration
- production configuration
- required external services

Attempt the complete setup process where possible:

INSTALL
→ CONFIGURE
→ START DEV SERVER
→ RUN TESTS
→ TYPECHECK
→ LINT
→ BUILD

Identify every step that fails.

Fix everything that can safely be fixed inside the repository.

Do not expose or hardcode secrets.

If an external credential/service is required, document exactly what variable or configuration is required.

At the end, create or update the project setup documentation so another developer or AI agent can understand exactly how to get the project running.
```
