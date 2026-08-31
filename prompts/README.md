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
| 13 | [`13-performance-audit.md`](./stage-2-repair/13-performance-audit.md) | N+1 queries, React re-renders, bundle size, caching, memory leaks, realtime subs. | Safe high-impact performance optimizations |
| 14 | [`14-accessibility-audit.md`](./stage-2-repair/14-accessibility-audit.md) | Keyboard navigation, focus traps, aria labels, screen readers, contrast, forms. | a11y Conformance & Keyboard Navigation Fixes |
| 15 | [`15-responsive-design-audit.md`](./stage-2-repair/15-responsive-design-audit.md) | Breakpoints, overflows, mobile navigation, touch targets, horizontal scroll. | Multi-Viewport Responsiveness (Desktop/Tablet/Mobile) |

---

## Stage 3 — Build & Complete (Feature Execution Engine)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 16 | [`16-master-feature-inventory.md`](./stage-3-build-and-complete/16-master-feature-inventory.md) | Discovery of all intended features across UI copy, routes, database, and APIs. | Master Feature Inventory (🟢 Complete, 🟡 Partial, 🔴 Not Started, ⚫ Blocked) |
| 17 | [`17-deep-feature-verification.md`](./stage-3-build-and-complete/17-deep-feature-verification.md) | 17-point lifecycle verification of every inventoried feature from UI to DB. | Feature Health Report & Prioritized Roadmap |
| 18 | [`18-feature-implementation-engine.md`](./stage-3-build-and-complete/18-feature-implementation-engine.md) | Systematically implements unfinished features by priority order. | Full End-to-End Feature Completion with Database, API, and UI |
| 19 | [`19-partial-feature-completion.md`](./stage-3-build-and-complete/19-partial-feature-completion.md) | Partial & incomplete features requiring 5-tier verification. | 5-Tier Verification (UI, Backend, DB, UX, Integration) |
| 20 | [`20-feature-discovery-pass.md`](./stage-3-build-and-complete/20-feature-discovery-pass.md) | Unconnected schemas, orphaned types, disabled buttons, TODOs, abandoned endpoints. | Newly Discovered Feature Roster & Implementation |
| 21 | [`21-zero-defect-feature-pass.md`](./stage-3-build-and-complete/21-zero-defect-feature-pass.md) | Final comprehensive completion pass to leave zero unfinished features. | Definitive Feature Completion Report & Verification |

---

## Stage 4 — Experience & Polish (Design, Mobile & PWA)

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 22 | [`22-ui-ux-design-audit.md`](./stage-4-experience-and-polish/22-ui-ux-design-audit.md) | Typography, spacing, borders, cards, shared primitives, visual hierarchy. | Consistent UI Design System & Component Standardization |
| 23 | [`23-icons-and-visual-assets.md`](./stage-4-experience-and-polish/23-icons-and-visual-assets.md) | Icon libraries (Lucide/Heroicons/Icons8), asset tree, Lottie animations, licensing. | Cohesive Icon Architecture & Dynamic Feedback |
| 24 | [`24-animation-and-microinteractions.md`](./stage-4-experience-and-polish/24-animation-and-microinteractions.md) | Page transitions, modal choreography, hover/active states, feedback, motion. | Purposeful Animation System with `prefers-reduced-motion` |
| 25 | [`25-pwa-conversion.md`](./stage-4-experience-and-polish/25-pwa-conversion.md) | Manifest, service workers, asset caching, installability, offline UX. | Production-Grade PWA Suite (Manifest, Service Worker, Shell) |
| 26 | [`26-mobile-experience-pass.md`](./stage-4-experience-and-polish/26-mobile-experience-pass.md) | Touch ergonomics, mobile drawers, safe areas, one-handed usability, virtual keyboard. | Dedicated Mobile UX Polish across all Primary Screens |
| 27 | [`27-user-journey-audit.md`](./stage-4-experience-and-polish/27-user-journey-audit.md) | First-time users, returning users, empty/heavy data states, edge journeys, error recovery. | User Journey Map & Navigation Streamlining |
| 28 | [`28-final-production-polish.md`](./stage-4-experience-and-polish/28-final-production-polish.md) | Micro-spacing, typography, alignment, state transitions, cohesive finish. | Elimination of "AI-Generated" Roughness |

---

## Stage 5 — Standards & Documentation

| # | Prompt File | Focus Area | Primary Output |
|---|-------------|------------|----------------|
| 29 | [`29-project-documentation-generator.md`](./stage-5-standards-and-docs/29-project-documentation-generator.md) | README, CONTRIBUTING, ARCHITECTURE, DEVELOPMENT, FEATURES, TROUBLESHOOTING, .env.example. | Code-Derived Developer & AI Documentation Suite |
| 30 | [`30-ai-rules-generator.md`](./stage-5-standards-and-docs/30-ai-rules-generator.md) | Permanent AI operating rules, coding constraints, verification pipeline, reporting format. | Tailored `AI_RULES.md` and `AGENTS.md` at Repository Root |
