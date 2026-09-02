# 🩺 VibeMedic: Prompt Catalog & Execution Index

This directory contains the modular, highly specialized prompt suites designed to turn AI coding agents (Cursor, Windsurf, Claude Code, Antigravity, ChatGPT, Copilot, etc.) into rigorous technical doctors, auditors, and repair engineers.

---

## Master Doctor Orchestrator

| Prompt | Target | Output |
|--------|--------|--------|
| [`MASTER_REPAIR.md`](./MASTER_REPAIR.md) | Full 9-phase Senior Engineer repository rescue & feature completion. | Comprehensive audit, verified fixes, zero-fake data guarantee, regression check, and production status. |

---

## Stage 1 — Diagnose (System Health & Forensic Audits)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 01 | [`01-codebase-technical-audit.md`](./stage-1-diagnose/01-codebase-technical-audit.md) | Full codebase syntax, imports, promises, types, error states, and runtime logic. | Prioritized Issue List (Critical, High, Medium, Low) & Safe Fixes |
| 02 | [`02-dummy-data-audit.md`](./stage-1-diagnose/02-dummy-data-audit.md) | Hardcoded arrays, mock users/products, fake charts, mock delays, and dummy counters. | Trace of all fake data & replacement with real DB/API sources |
| 03 | [`03-ui-functionality-audit.md`](./stage-1-diagnose/03-ui-functionality-audit.md) | Buttons with no onClick, empty handlers, dead toggles, broken forms, and fake toasts. | Interactive UI audit & complete handler-to-DB connection |
| 04 | [`04-database-backend-audit.md`](./stage-1-diagnose/04-database-backend-audit.md) | Schemas, columns, foreign keys, mutations, joins, ownership, and RLS policies. | Full data flow trace & schema/query mismatch resolution |
| 05 | [`05-auth-security-audit.md`](./stage-1-diagnose/05-auth-security-audit.md) | Sign-up, login, session refresh, role guards, admin isolation, and IDOR protection. | Auth & permissions hardening without breaking access |
| 06 | [`06-comprehensive-system-audit.md`](./stage-1-diagnose/06-comprehensive-system-audit.md) | End-to-end lifecycle across every route, component, API, and database interaction. | Definitive System Health Report & Manual Test Plan |
| 07 | [`07-architecture-mapping.md`](./stage-1-diagnose/07-architecture-mapping.md) | Architectural topology, core modules, coupling, circular deps, and legacy code. | Agent Architecture Report & Safe Modification Map |
| 08 | [`08-environment-setup-audit.md`](./stage-1-diagnose/08-environment-setup-audit.md) | Clean-clone onboarding, package manager, lockfile, env vars, build scripts. | Zero-friction setup verification & onboarding docs |
| 09 | [`09-dependency-audit.md`](./stage-1-diagnose/09-dependency-audit.md) | Unused packages, duplicate libraries, version conflicts, undeclared imports. | Clean dependency tree & package.json optimization |
| 10 | [`10-api-contract-audit.md`](./stage-1-diagnose/10-api-contract-audit.md) | REST/RPC endpoints, HTTP methods, payloads, responses, status codes, and validation. | API Contract Matrix & Frontend-Backend alignment |

---

## Stage 2 — Repair (Resilience, Security & Multi-Device Quality)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 11 | [`11-error-resilience-audit.md`](./stage-2-repair/11-error-resilience-audit.md) | Silent failures, stuck loaders, missing error boundaries, unhandled promises. | Robust Loading → Success → Error → Empty state coverage |
| 12 | [`12-security-audit.md`](./stage-2-repair/12-security-audit.md) | IDOR, XSS, SQLi, CSRF, RLS policies, token handling, client secret leaks. | Security Vulnerability Report & Remediation |
| 13 | [`13-application-security-audit.md`](./stage-2-repair/13-application-security-audit.md) | XSS, CSRF, injection, IDOR/BOLA, auth, authz, file upload security, unsafe redirects, SSRF, sensitive data exposure, session security, dependency CVEs. | Verified Application Security Posture & Remediation Backlog |
| 14 | [`14-performance-audit.md`](./stage-2-repair/14-performance-audit.md) | N+1 queries, React re-renders, bundle size, caching, memory leaks, realtime subs. | Safe high-impact performance optimizations |
| 15 | [`15-accessibility-audit.md`](./stage-2-repair/15-accessibility-audit.md) | Keyboard navigation, focus traps, aria labels, screen readers, contrast, forms. | a11y Conformance & Keyboard Navigation Fixes |
| 16 | [`16-responsive-design-audit.md`](./stage-2-repair/16-responsive-design-audit.md) | Breakpoints, overflows, mobile navigation, touch targets, horizontal scroll. | Multi-Viewport Responsiveness (Desktop/Tablet/Mobile) |

---

## Stage 3 — Build & Complete (Feature Execution Engine)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 17 | [`17-master-feature-inventory.md`](./stage-3-build-and-complete/17-master-feature-inventory.md) | Discovery of all intended features across UI copy, routes, database, and APIs. | Master Feature Inventory (🟢 Complete, 🟡 Partial, 🔴 Not Started, ⚫ Blocked) |
| 18 | [`18-deep-feature-verification.md`](./stage-3-build-and-complete/18-deep-feature-verification.md) | 17-point lifecycle verification of every inventoried feature from UI to DB. | Feature Health Report & Prioritized Roadmap |
| 19 | [`19-feature-implementation-engine.md`](./stage-3-build-and-complete/19-feature-implementation-engine.md) | Systematically implements unfinished features by priority order. | Full End-to-End Feature Completion with Database, API, and UI |
| 20 | [`20-partial-feature-completion.md`](./stage-3-build-and-complete/20-partial-feature-completion.md) | Partial & incomplete features requiring 5-tier verification. | 5-Tier Verification (UI, Backend, DB, UX, Integration) |
| 21 | [`21-feature-discovery-pass.md`](./stage-3-build-and-complete/21-feature-discovery-pass.md) | Unconnected schemas, orphaned types, disabled buttons, TODOs, abandoned endpoints. | Newly Discovered Feature Roster & Implementation |
| 22 | [`22-zero-defect-feature-pass.md`](./stage-3-build-and-complete/22-zero-defect-feature-pass.md) | Final comprehensive completion pass to leave zero unfinished features. | Definitive Feature Completion Report & Verification |
| 23 | [`23-dead-code-dependency-audit.md`](./stage-3-build-and-complete/23-dead-code-dependency-audit.md) | Unused components, functions, routes, API clients, duplicates, obsolete feature flags, abandoned experiments. | Dead Code Inventory, Duplicate-Component Map & Lean Dependency Tree |
| 24 | [`24-dependency-supply-chain-audit.md`](./stage-3-build-and-complete/24-dependency-supply-chain-audit.md) | Vulnerable, abandoned, suspicious, outdated, duplicate, and unnecessary packages; lockfile consistency; license compliance. | Hardened Dependency Manifest, Supply-Chain Risk Report & Lockfile Reconciliation |

---

## Stage 4 — Experience & Polish (Design, Mobile & PWA)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 25 | [`25-ui-ux-design-audit.md`](./stage-4-experience-and-polish/25-ui-ux-design-audit.md) | Typography, spacing, borders, cards, shared primitives, visual hierarchy. | Consistent UI Design System & Component Standardization |
| 26 | [`26-icons-and-visual-assets.md`](./stage-4-experience-and-polish/26-icons-and-visual-assets.md) | Icon libraries (Lucide/Heroicons/Icons8), asset tree, Lottie animations, licensing. | Cohesive Icon Architecture & Dynamic Feedback |
| 27 | [`27-animation-and-microinteractions.md`](./stage-4-experience-and-polish/27-animation-and-microinteractions.md) | Page transitions, modal choreography, hover/active states, feedback, motion. | Purposeful Animation System with `prefers-reduced-motion` |
| 28 | [`28-pwa-conversion.md`](./stage-4-experience-and-polish/28-pwa-conversion.md) | Manifest, service workers, asset caching, installability, offline UX. | Production-Grade PWA Suite (Manifest, Service Worker, Shell) |
| 29 | [`29-mobile-experience-pass.md`](./stage-4-experience-and-polish/29-mobile-experience-pass.md) | Touch ergonomics, mobile drawers, safe areas, one-handed usability, virtual keyboard. | Dedicated Mobile UX Polish across all Primary Screens |
| 30 | [`30-user-journey-audit.md`](./stage-4-experience-and-polish/30-user-journey-audit.md) | First-time users, returning users, empty/heavy data states, edge journeys, error recovery. | User Journey Map & Navigation Streamlining |
| 31 | [`31-final-production-polish.md`](./stage-4-experience-and-polish/31-final-production-polish.md) | Micro-spacing, typography, alignment, state transitions, cohesive finish. | Elimination of "AI-Generated" Roughness |

---

## Stage 5 — Standards & Documentation

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 32 | [`32-project-documentation-generator.md`](./stage-5-standards-and-docs/32-project-documentation-generator.md) | README, CONTRIBUTING, ARCHITECTURE, DEVELOPMENT, FEATURES, TROUBLESHOOTING, .env.example. | Code-Derived Developer & AI Documentation Suite |
| 33 | [`33-ai-rules-generator.md`](./stage-5-standards-and-docs/33-ai-rules-generator.md) | Permanent AI operating rules, coding constraints, verification pipeline, reporting format. | Tailored `AI_RULES.md` and `AGENTS.md` at Repository Root |

---

## Stage 6 — API Integrations (Third-Party Connectivity, Security, Reliability & Webhooks)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 34 | [`34-api-integration-audit.md`](./stage-6-api-integrations/34-api-integration-audit.md) | Fake, mocked, half-wired, UI-only, or misconfigured third-party integrations. | Verified Integration Inventory & Repaired End-to-End Connectivity |
| 35 | [`35-api-security-audit.md`](./stage-6-api-integrations/35-api-security-audit.md) | Leaked secrets, missing signature verification, IDOR on provider resources, broad scopes, exposed service-role keys. | Hardened Provider Security Posture & Secrets Hygiene Report |
| 36 | [`36-api-reliability-error-handling.md`](./stage-6-api-integrations/36-api-reliability-error-handling.md) | Timeouts, retries, fallbacks, rate limits, malformed responses, loading/error/empty UX states. | Resilient Provider Communication with Full UX State Coverage |
| 37 | [`37-webhook-audit.md`](./stage-6-api-integrations/37-webhook-audit.md) | Inbound & outbound webhooks — signatures, idempotency, retries, replay, dead-letters, DB updates. | Verified Webhook Inventory with Signature-Secured, Idempotent Endpoints |
| 38 | [`38-environment-secrets-audit.md`](./stage-6-api-integrations/38-environment-secrets-audit.md) | `.env`, `.env.example`, public-prefix exposure, hardcoded credentials, name mismatches, rotation gaps. | Clean, Documented, Audited Environment Configuration with `.env.example` Sync |

---

## Stage 7 — Payments (Financial Flows, Verification & Idempotency)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 39 | [`39-payment-flow-audit.md`](./stage-7-payments/39-payment-flow-audit.md) | End-to-end payment lifecycle: init → provider → webhook → verify → DB → grant access; refunds, subscriptions, state machines, financial integrity. | Verified Payment Lifecycle Report & Financially-Safe Flows |

---

## Stage 8 — Database (Schema Integrity, Constraints, Performance & Concurrency)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 40 | [`40-database-integrity-audit.md`](./stage-8-database/40-database-integrity-audit.md) | Orphans, missing FKs, nullable sensitive columns, duplicates, missing unique constraints / indexes, cascade mistakes, race conditions, event idempotency. | Database Integrity Report & Schema/Constraint Repairs |

---

## Stage 9 — Testing (Coverage, End-to-End Verification & Regression)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 41 | [`41-test-coverage-critical-path-audit.md`](./stage-9-testing/41-test-coverage-critical-path-audit.md) | Identification of critical user journeys and verification that they are actually tested (auth, payments, permissions, CRUD, uploads, search, admin). | Critical Path Coverage Matrix & Test Authoring Plan |
| 42 | [`42-end-to-end-user-flow-verification.md`](./stage-9-testing/42-end-to-end-user-flow-verification.md) | Walk major workflows as a real user; inject failure modes; verify persistence, permissions, cross-device behavior, and notification delivery. | Verified End-to-End Flow Report with Reproducible Steps & Fixes |
| 43 | [`43-regression-testing-after-repairs.md`](./stage-9-testing/43-regression-testing-after-repairs.md) | Verify VibeMedic repairs did not break existing functionality across the test suite, data, providers, UX, security, and docs. | Regression Report with Re-Activated Test Suite & Verified Adjacent Flows |

---

## Stage 10 — Architecture (Pattern Standardization & Consolidation)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 44 | [`44-architecture-consistency-audit.md`](./stage-10-architecture/44-architecture-consistency-audit.md) | Competing patterns across data fetching, components, auth, validation, state, error handling, styling, logging, routing. | Architecture Standardization Map & Consolidated Pattern Library |

---

## Stage 11 — Production (Launch Readiness & Final Doctor's Checkup)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 45 | [`45-production-readiness-audit.md`](./stage-11-production/45-production-readiness-audit.md) | Environment, logging, monitoring, error handling, security, database, APIs, payments, backups, performance, PWA, accessibility, mobile, SEO, deployment, rate limiting, operational failures. | Production Readiness Scorecard & Launch Blockers List |
| 46 | [`46-final-doctors-checkup.md`](./stage-11-production/46-final-doctors-checkup.md) | Non-destructive whole-application verification across every layer after all other VibeMedic prompts have run. | Definitive Ship / Don't Ship Verdict & Final Doctor's Report |
