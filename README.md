<div align="center">

# 🩺 VibeMedic

### *Because "the AI said it's finished" isn't QA.*

**Your AI-built app looks finished. Is it actually finished?**

**VibeMedic** is an open-source AI engineering prompt toolkit and systematic verification workflow. It helps developers use their own AI coding agents to **audit**, **diagnose**, **repair**, **complete**, **secure**, and **productionize** vibe-coded applications.

```text
AUDIT  ➔  UNDERSTAND  ➔  DIAGNOSE  ➔  REPAIR  ➔  COMPLETE  ➔  SECURE  ➔  POLISH  ➔  VERIFY  ➔  SHIP
```

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Maintained by: Amararu Kenneth / Blakkaverse](https://img.shields.io/badge/Maintained%20by-Amararu%20Kenneth%20%2F%20Blakkaverse-purple.svg)](https://github.com/kenneth556)
[![Support VibeMedic](https://img.shields.io/badge/Support-VibeMedic%20❤️-ff5a5f.svg)](https://flutterwave.com/donate/b6p187tamegm)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)
[![Zero Dependencies](https://img.shields.io/badge/Dependencies-Pure%20Markdown%20%26%20SQL-success.svg)](#)

</div>

---

> [!IMPORTANT]
> **What VibeMedic is:** An open-source collection of structured, battle-tested engineering prompts and workflows that you provide to your AI coding agent (Cursor, Claude Code, Windsurf, Codex, Gemini, Antigravity, etc.).  
> **What VibeMedic is not:** VibeMedic is **not** a SaaS platform, automated CLI scanner, or standalone binary. You provide the prompts to your coding agent; the agent performs the repository inspection, debugging, and code modifications under your supervision.

---

## 💥 The Problem with "Vibe Coded" Apps

Building software with AI assistants feels like magic. In hours, you have a slick interface, multiple routes, and modern styling. But beneath the surface, AI-generated prototypes frequently hide subtle landmines:

- 🎭 **Illusion of Completion:** A stunning dashboard displaying hardcoded numbers rather than querying a database.
- 🧪 **Mock Data & Fake Delays:** Arrays of static fake users and `setTimeout(() => setSuccess(true), 1000)` calls posing as working APIs.
- 🖱️ **Dead Interactive Elements:** Buttons without `onClick` handlers, toggles that reset on page reload, and forms that display a toast notification without persisting data.
- 🔌 **Disconnected Pipelines:** Frontend components expecting JSON response shapes that the backend never returns.
- 🗄️ **Database & Schema Desync:** Missing foreign keys, orphaned tables, and broken queries.
- 🔐 **Security & RLS Gaps:** Supabase tables with Row Level Security disabled or permissive `USING (true)` policies that expose all user records.
- 📱 **Mobile & Ergonomic Breakdowns:** Layouts that overflow viewports, unclickable touch targets, and broken modal behaviors.
- 🚧 **Abandoned Partial Features:** Code that works only along the single happy path demonstrated during prompting, failing completely on errors, edge cases, or network hiccups.

---

## 💡 The Solution: Focused AI Engineering Stages

When developers tell an AI agent:

> *"Check my whole app and fix all bugs."*

The model gets overwhelmed by context, hallucinates that *"everything looks great!"*, and makes superficial edits that introduce regressions.

**VibeMedic** replaces vague instructions with a structured, 11-stage engineering playbook. Each prompt assigns your AI coding agent a single, forensic objective—forcing it to trace data end-to-end, inspect real database schemas, eliminate fake mocks, and run tests before declaring work complete.

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            MASTER_REPAIR.md                                 │
│        (Autonomous 9-Phase Senior Engineer Rescue & Regression Check)       │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
        ┌──────────────────────────────┼──────────────────────────────┐
        ▼                              ▼                              ▼
 ┌──────────────┐               ┌──────────────┐               ┌──────────────┐
 │   STAGE 1    │               │   STAGE 2    │               │   STAGE 3    │
 │   Diagnose   │──────────────▶│    Repair    │──────────────▶│Build/Complete│
 │  (01 - 10)   │               │  (11 - 16)   │               │  (17 - 24)   │
 └──────────────┘               └──────────────┘               └──────────────┘
                                                                      │
        ┌──────────────────────────────┬──────────────────────────────┘
        ▼                              ▼
 ┌──────────────┐               ┌──────────────┐
 │   STAGE 4    │               │   STAGE 5    │
 │ Polish & PWA │──────────────▶│Standards/Docs│
 │  (25 - 31)   │               │  (32 - 33)   │
 └──────────────┘               └──────────────┘
        │
        ├──────────────────────────────┬──────────────────────────────┐
        ▼                              ▼                              ▼
 ┌──────────────┐               ┌──────────────┐               ┌──────────────┐
 │   STAGE 6    │               │   STAGE 7    │               │   STAGE 8    │
 │  APIs & Keys │──────────────▶│   Payments   │──────────────▶│   Database   │
 │  (34 - 38)   │               │     (39)     │               │     (40)     │
 └──────────────┘               └──────────────┘               └──────────────┘
                                                                      │
        ┌──────────────────────────────┬──────────────────────────────┘
        ▼                              ▼
 ┌──────────────┐               ┌──────────────┐
 │   STAGE 9    │               │   STAGE 10   │
 │   Testing    │──────────────▶│ Architecture │
 │  (41 - 43)   │               │     (44)     │
 └──────────────┘               └──────────────┘
                                       │
                                       ▼
                                ┌──────────────┐
                                │   STAGE 11   │
                                │  Production  │
                                │  (45 - 46)   │
                                └──────────────┘
                                       │
                                       ▼
                                ┌──────────────┐
                                │   SUPABASE   │
                                │ Database RLS │
                                │  (01 - 04)   │
                                └──────────────┘
```

---

## 🎯 What VibeMedic Covers

Every prompt in this repository targets a specific layer of the application stack:

| Focus Area | Description & Diagnostic Scope |
| :--- | :--- |
| **Codebase Health** | Broken imports, syntax errors, missing files, undefined variables, and type errors. |
| **Architecture Mapping** | Component hierarchy, tightly coupled modules, circular dependencies, and dead code. |
| **Dummy & Mock Data** | Hardcoded statistics, fake arrays, static charts, and simulated `setTimeout` delays. |
| **UI Functionality** | Dead buttons, empty event handlers, non-persisting toggles, and unhooked forms. |
| **Feature Completeness** | 17-point lifecycle verification of every inventoried feature from UI to database. |
| **Database & Schema** | Schema alignment, table constraints, foreign keys, missing columns, and query fixes. |
| **Supabase SQL Suite** | Canonical `schema.sql`, `rls.sql`, `functions.sql`, `storage.sql`, and Edge Functions. |
| **Security & IDOR** | Row Level Security, user data isolation, role guards, and client-side secret exposure. |
| **Application Security** | Broad attack surface review: XSS, CSRF, injection, authz, file uploads, and session tokens. |
| **API Contracts** | Request payloads, response structures, status codes, and frontend-backend mismatches. |
| **API Integrations & Webhooks** | Third-party provider wiring, secrets hygiene, signature validation, and idempotency. |
| **Payments & Billing** | End-to-end payment lifecycle, webhooks, duplicate processing, and refund/subscription states. |
| **Error Resilience** | Loading, error, success, and empty states across all asynchronous operations. |
| **Dependencies & Supply Chain** | Dead code removal, unused package bloat, supply-chain risks, and lockfile consistency. |
| **Performance** | N+1 database queries, unnecessary React re-renders, bundle size, and memory leaks. |
| **Accessibility (a11y)** | Keyboard navigation, focus traps, ARIA labels, contrast, and screen-reader support. |
| **Responsive Design** | Viewport overflows, layout clipping, touch targets, and mobile breakpoints. |
| **UI/UX Consistency** | Typography scales, spacing systems, card primitives, and visual hierarchy. |
| **Visual Assets & Motion** | Lucide icon standardization, Lottie animations, and micro-interactions. |
| **PWA & Offline Mode** | Web app manifest, service worker caching, installability, and offline shell. |
| **Documentation & AI Rules**| Code-accurate documentation and permanent `AI_RULES.md` operating constraints. |
| **Testing & Regression** | Critical user journey coverage, end-to-end workflow verification, and post-repair checks. |
| **Architecture Consistency** | Pattern standardization across fetching, state, logging, and error handling. |
| **Production Readiness** | Launch readiness scorecard, operational failure audits, and final ship verdict. |

---

## 🚀 How to Use VibeMedic

```text
┌────────────────┐      ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
│ 1. Open App in │ ───▶ │  2. Copy Desired│ ───▶ │ 3. Agent Cures │ ───▶ │ 4. Verify &    │
│ AI Coding Tool │      │  VibeMedic Doc │      │ & Runs Checks  │      │    Ship It     │
└────────────────┘      └────────────────┘      └────────────────┘      └────────────────┘
```

1. **Clone VibeMedic** or browse the prompts in this repository:
   ```bash
   git clone https://github.com/kenneth556/VibeMedic.git
   ```
2. **Open your target application** in your preferred AI coding environment (e.g., Cursor, Windsurf, Claude Code, Antigravity, etc.).
3. **Choose the appropriate prompt:**
   - For an autonomous, full-repository rescue: Copy [`prompts/MASTER_REPAIR.md`](./prompts/MASTER_REPAIR.md).
   - For targeted issues: Pick the exact prompt from the [Prompt Directory](#-prompt-directory).
4. **Feed the prompt to your coding agent** in a clean conversation session.
5. **Allow the agent to perform the audit:** The agent will inspect files, trace data flows, propose minimal safe changes, and execute verification commands (type checks, linting, tests, build).
6. **Review diffs & maintain human oversight:** Verify changes before accepting them.
7. **Re-synchronize when features change:** Use [`supabase/04-complete-resynchronization.md`](./supabase/04-complete-resynchronization.md) after major feature development.

---

## 🤖 Compatible AI Coding Environments

VibeMedic prompts are agent-agnostic and work with any LLM coding tool capable of reading files and editing code:

- **Cursor** (`Composer`, `Agent Mode`, `Cmd+K`)
- **Claude Code CLI** & **Claude 3.7 Sonnet**
- **Windsurf** (`Cascade`)
- **Google Antigravity IDE**
- **OpenAI Codex / ChatGPT Canvas**
- **Google Gemini**
- **GitHub Copilot Workspace**
- **Aider CLI**

*(Note: Mention of tools does not imply official endorsement or integration. Different LLM models may execute instructions with varying degrees of precision.)*

---

## 🗂️ Prompt Directory

### 🏥 Master Doctor Orchestrator
| File | Name | Purpose | Recommended Stage |
| :--- | :--- | :--- | :--- |
| [`MASTER_REPAIR.md`](./prompts/MASTER_REPAIR.md) | Master Senior Engineer Rescue | 9-phase autonomous diagnostic, repair, feature completion, and regression check. | All-In-One Rescue |

---

### 🩺 Stage 1 — Diagnose (System Health & Forensic Audits)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`01-codebase-technical-audit.md`](./prompts/stage-1-diagnose/01-codebase-technical-audit.md) | Codebase Technical Audit | Full inspection for syntax errors, broken imports, type bugs, and runtime crashes. |
| [`02-dummy-data-audit.md`](./prompts/stage-1-diagnose/02-dummy-data-audit.md) | Dummy & Mock Data Audit | Detects and replaces hardcoded arrays, mock counters, static charts, and fake delays. |
| [`03-ui-functionality-audit.md`](./prompts/stage-1-diagnose/03-ui-functionality-audit.md) | UI Functionality Audit | Finds and connects dead buttons, empty handlers, unpersisted toggles, and broken forms. |
| [`04-database-backend-audit.md`](./prompts/stage-1-diagnose/04-database-backend-audit.md) | Database & Backend Audit | Traces data flows from UI to database; verifies schemas, mutations, and queries. |
| [`05-auth-security-audit.md`](./prompts/stage-1-diagnose/05-auth-security-audit.md) | Auth & User Isolation Audit | Audits authentication, session persistence, role guards, and multi-tenant isolation. |
| [`06-comprehensive-system-audit.md`](./prompts/stage-1-diagnose/06-comprehensive-system-audit.md) | Comprehensive System Audit | End-to-end validation across every page, route, and external integration with test plan. |
| [`07-architecture-mapping.md`](./prompts/stage-1-diagnose/07-architecture-mapping.md) | Architecture Mapping | Generates module dependency graph, coupling analysis, and safe modification map. |
| [`08-environment-setup-audit.md`](./prompts/stage-1-diagnose/08-environment-setup-audit.md) | Clean Setup & Env Audit | Tests fresh-clone installation, env vars, lockfile integrity, and build scripts. |
| [`09-dependency-audit.md`](./prompts/stage-1-diagnose/09-dependency-audit.md) | Dependency & Package Audit | Identifies unused packages, duplicate libraries, and peer-dependency version conflicts. |
| [`10-api-contract-audit.md`](./prompts/stage-1-diagnose/10-api-contract-audit.md) | API Contract Audit | Compares frontend payload expectations against actual backend endpoint implementations. |

---

### 🔧 Stage 2 — Repair (Resilience, Security & Multi-Device Quality)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`11-error-resilience-audit.md`](./prompts/stage-2-repair/11-error-resilience-audit.md) | Error Resilience Audit | Implements robust Loading ➔ Success ➔ Error ➔ Empty states across async flows. |
| [`12-security-audit.md`](./prompts/stage-2-repair/12-security-audit.md) | Security & IDOR Audit | Detects access-control bypasses, XSS, SQLi, CSRF, and leaked client secrets. |
| [`13-application-security-audit.md`](./prompts/stage-2-repair/13-application-security-audit.md) | Application Security Audit | Broad application attack surface audit covering injections, authz, file uploads, and session security. |
| [`14-performance-audit.md`](./prompts/stage-2-repair/14-performance-audit.md) | Performance & Query Audit | Resolves N+1 database queries, bundle bloat, React re-renders, and memory leaks. |
| [`15-accessibility-audit.md`](./prompts/stage-2-repair/15-accessibility-audit.md) | Accessibility (a11y) Audit | Enforces keyboard navigation, focus management, ARIA tags, and contrast standards. |
| [`16-responsive-design-audit.md`](./prompts/stage-2-repair/16-responsive-design-audit.md) | Responsive Design Audit | Fixes layout breaks, horizontal scrolling, and touch ergonomics across viewports. |

---

### 🏗️ Stage 3 — Build & Complete (Feature Execution Engine)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`17-master-feature-inventory.md`](./prompts/stage-3-build-and-complete/17-master-feature-inventory.md) | Master Feature Inventory | Discovers all intended features and categorizes status (Complete, Partial, Not Started). |
| [`18-deep-feature-verification.md`](./prompts/stage-3-build-and-complete/18-deep-feature-verification.md) | Deep Feature Verification | 17-point lifecycle trace per feature to detect hidden dummy or broken logic. |
| [`19-feature-implementation-engine.md`](./prompts/stage-3-build-and-complete/19-feature-implementation-engine.md) | Feature Implementation Engine | Systematically implements missing features end-to-end by priority order. |
| [`20-partial-feature-completion.md`](./prompts/stage-3-build-and-complete/20-partial-feature-completion.md) | Partial Feature Completion Pass | 5-tier completion pass for half-implemented features. |
| [`21-feature-discovery-pass.md`](./prompts/stage-3-build-and-complete/21-feature-discovery-pass.md) | Hidden Feature Discovery Pass | Unearths and connects orphaned schema tables, TODOs, and disabled buttons. |
| [`22-zero-defect-feature-pass.md`](./prompts/stage-3-build-and-complete/22-zero-defect-feature-pass.md) | Zero-Defect Feature Pass | Final sweep ensuring zero legitimately unfinished features remain. |
| [`23-dead-code-dependency-audit.md`](./prompts/stage-3-build-and-complete/23-dead-code-dependency-audit.md) | Dead Code & Dependency Audit | Removes unused components, routes, API clients, and obsolete feature flags. |
| [`24-dependency-supply-chain-audit.md`](./prompts/stage-3-build-and-complete/24-dependency-supply-chain-audit.md) | Dependency & Supply Chain Audit | Detects vulnerable, abandoned, or suspicious packages and reconciles lockfiles. |

---

### 🎨 Stage 4 — Experience & Polish (Design, Mobile & PWA)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`25-ui-ux-design-audit.md`](./prompts/stage-4-experience-and-polish/25-ui-ux-design-audit.md) | UI/UX Design System Audit | Standardizes typography, spacing scales, card design, and component primitives. |
| [`26-icons-and-visual-assets.md`](./prompts/stage-4-experience-and-polish/26-icons-and-visual-assets.md) | Icons & Visual Assets Strategy | Implements consistent Lucide icon imports, asset tree structure, and Lottie animations. |
| [`27-animation-and-microinteractions.md`](./prompts/stage-4-experience-and-polish/27-animation-and-microinteractions.md) | Motion & Micro-Interactions | Adds purposeful UI transitions with strict `prefers-reduced-motion` compliance. |
| [`28-pwa-conversion.md`](./prompts/stage-4-experience-and-polish/28-pwa-conversion.md) | Progressive Web App Conversion | Implements Web App Manifest, Service Worker caching, and an offline shell. |
| [`29-mobile-experience-pass.md`](./prompts/stage-4-experience-and-polish/29-mobile-experience-pass.md) | Mobile-First Experience Pass | Optimizes one-handed touch ergonomics, mobile menus, drawers, and keyboards. |
| [`30-user-journey-audit.md`](./prompts/stage-4-experience-and-polish/30-user-journey-audit.md) | User Journey & UX Flow Audit | Simulates first-time visit, onboarding, edge journeys, and error recovery. |
| [`31-final-production-polish.md`](./prompts/stage-4-experience-and-polish/31-final-production-polish.md) | Final Production Polish Pass | Micro-spacing, typography alignment, and eliminating "AI-generated" roughness. |

---

### 📚 Stage 5 — Standards & Documentation
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`32-project-documentation-generator.md`](./prompts/stage-5-standards-and-docs/32-project-documentation-generator.md) | Project Docs Generator | Generates code-derived `README`, `ARCHITECTURE`, `DEVELOPMENT`, and `.env.example`. |
| [`33-ai-rules-generator.md`](./prompts/stage-5-standards-and-docs/33-ai-rules-generator.md) | AI Rules Generator | Creates a tailored `AI_RULES.md` file to govern future AI coding agents. |

---

### 🔌 Stage 6 — API Integrations (Connectivity, Security, Reliability & Webhooks)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`34-api-integration-audit.md`](./prompts/stage-6-api-integrations/34-api-integration-audit.md) | API Integration Audit & Repair | Finds fake, mocked, half-wired, UI-only, or misconfigured third-party integrations and wires them end-to-end. |
| [`35-api-security-audit.md`](./prompts/stage-6-api-integrations/35-api-security-audit.md) | API Security Audit & Repair | Hardens secrets hygiene, signature checks, ownership verification, scopes, and rotation. |
| [`36-api-reliability-error-handling.md`](./prompts/stage-6-api-integrations/36-api-reliability-error-handling.md) | API Reliability & Error Handling | Adds timeouts, retries, fallbacks, rate-limit handling, and full Loading/Success/Error/Empty UX states. |
| [`37-webhook-audit.md`](./prompts/stage-6-api-integrations/37-webhook-audit.md) | Webhook Audit & Repair | Verifies signatures, idempotency, retries, replay, dead-letter handling, and DB updates for every webhook. |
| [`38-environment-secrets-audit.md`](./prompts/stage-6-api-integrations/38-environment-secrets-audit.md) | Environment Variables & Secrets Audit | Reconciles `.env` / `.env.example` / code, removes leaks, fixes naming, and tightens scope. |

---

### 💳 Stage 7 — Payments (Financial Flows, Verification & Idempotency)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`39-payment-flow-audit.md`](./prompts/stage-7-payments/39-payment-flow-audit.md) | Payment Flow Audit & Repair | Traces init → provider → webhook → verify → DB → grant; fixes duplicates, replay, refund, and subscription state bugs. |

---

### 🗄️ Stage 8 — Database (Schema Integrity, Constraints, Performance & Concurrency)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`40-database-integrity-audit.md`](./prompts/stage-8-database/40-database-integrity-audit.md) | Database Integrity Audit | Detects orphans, missing FKs, nullable sensitive columns, duplicate data, missing unique constraints/indexes, race conditions, and cascade mistakes. |

---

### 🧪 Stage 9 — Testing (Coverage, End-to-End Verification & Regression)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`41-test-coverage-critical-path-audit.md`](./prompts/stage-9-testing/41-test-coverage-critical-path-audit.md) | Test Coverage & Critical Path Audit | Identifies critical user journeys and verifies they are actually tested; authors the missing tests. |
| [`42-end-to-end-user-flow-verification.md`](./prompts/stage-9-testing/42-end-to-end-user-flow-verification.md) | End-to-End User Flow Verification | Walks major workflows as a real user; injects failure modes; verifies persistence, permissions, cross-device behavior, and notifications. |
| [`43-regression-testing-after-repairs.md`](./prompts/stage-9-testing/43-regression-testing-after-repairs.md) | Regression Testing After Repairs | Verifies that VibeMedic repairs did not break existing functionality across tests, data, providers, UX, security, and docs. |

---

### 🏛️ Stage 10 — Architecture (Pattern Standardization & Consolidation)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`44-architecture-consistency-audit.md`](./prompts/stage-10-architecture/44-architecture-consistency-audit.md) | Architecture Consistency Audit | Finds competing patterns across data fetching, components, auth, validation, state, error handling, styling, logging; consolidates into a single canonical pattern. |

---

### 🚀 Stage 11 — Production (Launch Readiness & Final Doctor's Checkup)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`45-production-readiness-audit.md`](./prompts/stage-11-production/45-production-readiness-audit.md) | Production Readiness Audit | Final pre-launch review across environment, logging, monitoring, security, database, payments, backups, performance, PWA, accessibility, mobile, SEO, deployment, rate limiting. |
| [`46-final-doctors-checkup.md`](./prompts/stage-11-production/46-final-doctors-checkup.md) | VibeMedic Final Doctor's Checkup 🩺 | Non-destructive whole-application verification across every layer; produces a definitive Ship / Don't Ship verdict and Ship Manifest. |

---

## 🔌 Third-Party APIs & Services Guide

VibeMedic includes a dedicated catalog of recommended, battle-tested APIs and services:

- **Directory Guide:** [`apis/README.md`](./apis/README.md)
- **Master API Catalog:** [`apis/RECOMMENDED_APIS.md`](./apis/RECOMMENDED_APIS.md) — Covers payments (Africa & Global), auth, storage, SMS, email, AI, analytics, webhooks, and 30+ service categories with code examples and anti-patterns.

---

## 🗄️ Supabase Database Source-of-Truth Suite

For applications built on PostgreSQL and Supabase, historical migrations often become disorganized during rapid prototyping. VibeMedic includes a dedicated 4-file database synchronization system:

```text
supabase/
├── schema.sql           # Table definitions, columns, primary keys, foreign keys, constraints, indexes
├── rls.sql              # Row Level Security enablement and granular tenant/ownership policies
├── functions.sql        # PostgreSQL triggers, stored procedures, RPC functions, and audit logic
├── storage.sql          # Supabase Storage bucket configurations and storage RLS policies
├── edge-functions.md    # API contracts and documentation for Supabase Edge Functions
└── README.md            # Execution guide and database architecture documentation
```

### Supabase Workflow Prompts
| # | Prompt File | Purpose |
|---|-------------|---------|
| 01 | [`01-source-of-truth-generator.md`](./supabase/01-source-of-truth-generator.md) | Complete codebase audit to generate clean, idempotent SQL source-of-truth files. |
| 02 | [`02-sql-verification.md`](./supabase/02-sql-verification.md) | Static & runtime verification of the 4 SQL files against code, multi-user isolation, and syntax. |
| 03 | [`03-clean-db-setup-test.md`](./supabase/03-clean-db-setup-test.md) | Verifies dependency order (`schema` → `functions` → `rls` → `storage`) in a blank database. |
| 04 | [`04-complete-resynchronization.md`](./supabase/04-complete-resynchronization.md) | Post-build re-synchronization across code, database schema, policies, storage, and edge functions. |

Starter templates are provided in [`supabase/templates/`](./supabase/templates/).

---

## 📋 Audit Reports Directory

When executing audit prompts, store your generated findings in [`audits/`](./audits/):

| Audit Focus | Template File | Recommended Output Path |
| :--- | :--- | :--- |
| **Architecture** | [`architecture.template.md`](./audits/architecture.template.md) | `audits/architecture.md` |
| **Code Health** | [`code-health.template.md`](./audits/code-health.template.md) | `audits/code-health.md` |
| **Feature Health** | [`features.template.md`](./audits/features.template.md) | `audits/features.md` |
| **Database & Backend** | [`database.template.md`](./audits/database.template.md) | `audits/database.md` |
| **Security & Auth** | [`security.template.md`](./audits/security.template.md) | `audits/security.md` |
| **Performance** | [`performance.template.md`](./audits/performance.template.md) | `audits/performance.md` |
| **Accessibility** | [`accessibility.template.md`](./audits/accessibility.template.md) | `audits/accessibility.md` |
| **Responsive Design** | [`responsive.template.md`](./audits/responsive.template.md) | `audits/responsive.md` |

---

## 📖 In-Depth Documentation

For advanced workflows, architectural philosophies, and execution recipes:

- [`docs/ARCHITECTURE.md`](./docs/ARCHITECTURE.md) — Core principles and system design philosophy.
- [`docs/EXECUTION_GUIDE.md`](./docs/EXECUTION_GUIDE.md) — Best practices and step-by-step execution tracks.
- [`docs/WORKFLOWS.md`](./docs/WORKFLOWS.md) — Targeted prompt recipes for specific engineering tasks.

---

## 🛡️ AI Operating Rules

To ensure coding agents operate with maximum precision and discipline on your repository, VibeMedic maintains:

- [`AI_RULES.md`](./AI_RULES.md) — Mandatory core principles and authoring standards.
- [`AGENTS.md`](./AGENTS.md) — Operating guidelines and agent directives.
- [`REPAIR_STATUS.md`](./REPAIR_STATUS.md) — Real-time health and stage completion checklist.

---

## 🤝 Contributing

Contributions from the developer community are warmly welcome! Whether you are refining an existing prompt, adding a new database engine, or expanding third-party API recipes:

1. Read [`CONTRIBUTING.md`](./CONTRIBUTING.md).
2. Check existing issues or open a new one.
3. Submit a pull request following the repository guidelines.

---

## 📄 License

VibeMedic is open-source software licensed under the [MIT License](./LICENSE).

---

<div align="center">
  <b>Built for developers who demand production-grade quality from AI-assisted coding.</b>
</div>
