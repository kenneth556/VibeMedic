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

**VibeMedic** replaces vague instructions with a structured, multi-stage engineering playbook. Each prompt assigns your AI coding agent a single, forensic objective—forcing it to trace data end-to-end, inspect real database schemas, eliminate fake mocks, and run tests before declaring work complete.

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            MASTER_REPAIR.md                                 │
│        (Autonomous 9-Phase Senior Engineer Rescue & Regression Check)       │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
       ┌───────────────────────────────┼───────────────────────────────┐
       ▼                               ▼                               ▼
┌──────────────┐                ┌──────────────┐                ┌──────────────┐
│   STAGE 1    │                │   STAGE 2    │                │   STAGE 3    │
│   Diagnose   │───────────────▶│    Repair    │───────────────▶│Build/Complete│
│  (01 - 10)   │                │  (11 - 15)   │                │  (16 - 21)   │
└──────────────┘                └──────────────┘                └──────────────┘
                                                                       │
                               ┌───────────────────────────────────────┴───────┐
                               ▼                                               ▼
                        ┌──────────────┐                                ┌──────────────┐
                        │   STAGE 4    │                                │   STAGE 5    │
                        │ Polish & PWA │                                │Standards/Docs│
                        │  (22 - 28)   │                                │  (29 - 30)   │
                        └──────────────┘                                └──────────────┘
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
| **API Contracts** | Request payloads, response structures, status codes, and frontend-backend mismatches. |
| **Error Resilience** | Loading, error, success, and empty states across all asynchronous operations. |
| **Dependencies** | Unused package bloat, duplicate libraries, and peer-dependency conflict resolution. |
| **Performance** | N+1 database queries, unnecessary React re-renders, bundle size, and memory leaks. |
| **Accessibility (a11y)** | Keyboard navigation, focus traps, ARIA labels, contrast, and screen-reader support. |
| **Responsive Design** | Viewport overflows, layout clipping, touch targets, and mobile breakpoints. |
| **UI/UX Consistency** | Typography scales, spacing systems, card primitives, and visual hierarchy. |
| **Visual Assets & Motion** | Lucide icon standardization, Lottie animations, and micro-interactions. |
| **PWA & Offline Mode** | Web app manifest, service worker caching, installability, and offline shell. |
| **Documentation & AI Rules**| Code-accurate documentation and permanent `AI_RULES.md` operating constraints. |

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
| [`13-performance-audit.md`](./prompts/stage-2-repair/13-performance-audit.md) | Performance & Query Audit | Resolves N+1 database queries, bundle bloat, React re-renders, and memory leaks. |
| [`14-accessibility-audit.md`](./prompts/stage-2-repair/14-accessibility-audit.md) | Accessibility (a11y) Audit | Enforces keyboard navigation, focus management, ARIA tags, and contrast standards. |
| [`15-responsive-design-audit.md`](./prompts/stage-2-repair/15-responsive-design-audit.md) | Responsive Design Audit | Fixes layout breaks, horizontal scrolling, and touch ergonomics across viewports. |

---

### 🏗️ Stage 3 — Build & Complete (Feature Execution Engine)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`16-master-feature-inventory.md`](./prompts/stage-3-build-and-complete/16-master-feature-inventory.md) | Master Feature Inventory | Discovers all intended features and categorizes status (Complete, Partial, Not Started). |
| [`17-deep-feature-verification.md`](./prompts/stage-3-build-and-complete/17-deep-feature-verification.md) | Deep Feature Verification | 17-point lifecycle trace per feature to detect hidden dummy or broken logic. |
| [`18-feature-implementation-engine.md`](./prompts/stage-3-build-and-complete/18-feature-implementation-engine.md) | Feature Implementation Engine | Systematically implements missing features end-to-end by priority order. |
| [`19-partial-feature-completion.md`](./prompts/stage-3-build-and-complete/19-partial-feature-completion.md) | Partial Feature Completion Pass | 5-tier completion pass for half-implemented features. |
| [`20-feature-discovery-pass.md`](./prompts/stage-3-build-and-complete/20-feature-discovery-pass.md) | Hidden Feature Discovery Pass | Unearths and connects orphaned schema tables, TODOs, and disabled buttons. |
| [`21-zero-defect-feature-pass.md`](./prompts/stage-3-build-and-complete/21-zero-defect-feature-pass.md) | Zero-Defect Feature Pass | Final sweep ensuring zero legitimately unfinished features remain. |

---

### 🎨 Stage 4 — Experience & Polish (Design, Mobile & PWA)
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`22-ui-ux-design-audit.md`](./prompts/stage-4-experience-and-polish/22-ui-ux-design-audit.md) | UI/UX Design System Audit | Standardizes typography, spacing scales, card design, and component primitives. |
| [`23-icons-and-visual-assets.md`](./prompts/stage-4-experience-and-polish/23-icons-and-visual-assets.md) | Icons & Visual Assets Strategy | Implements consistent Lucide icon imports, asset tree structure, and Lottie animations. |
| [`24-animation-and-microinteractions.md`](./prompts/stage-4-experience-and-polish/24-animation-and-microinteractions.md) | Motion & Micro-Interactions | Adds purposeful UI transitions with strict `prefers-reduced-motion` compliance. |
| [`25-pwa-conversion.md`](./prompts/stage-4-experience-and-polish/25-pwa-conversion.md) | Progressive Web App Conversion | Implements Web App Manifest, Service Worker caching, and an offline shell. |
| [`26-mobile-experience-pass.md`](./prompts/stage-4-experience-and-polish/26-mobile-experience-pass.md) | Mobile-First Experience Pass | Optimizes one-handed touch ergonomics, mobile menus, drawers, and keyboards. |
| [`27-user-journey-audit.md`](./prompts/stage-4-experience-and-polish/27-user-journey-audit.md) | User Journey & UX Flow Audit | Simulates first-time visit, onboarding, edge journeys, and error recovery. |
| [`28-final-production-polish.md`](./prompts/stage-4-experience-and-polish/28-final-production-polish.md) | Final Production Polish Pass | Micro-spacing, typography alignment, and eliminating "AI-generated" roughness. |

---

### 📚 Stage 5 — Standards & Documentation
| File | Name | Purpose |
| :--- | :--- | :--- |
| [`29-project-documentation-generator.md`](./prompts/stage-5-standards-and-docs/29-project-documentation-generator.md) | Project Docs Generator | Generates code-derived `README`, `ARCHITECTURE`, `DEVELOPMENT`, and `.env.example`. |
| [`30-ai-rules-generator.md`](./prompts/stage-5-standards-and-docs/30-ai-rules-generator.md) | AI Rules Generator | Creates a tailored `AI_RULES.md` file to govern future AI coding agents. |

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

### Key Architectural Distinctions:
1. **Source-of-Truth vs. Migrations:** `schema.sql`, `rls.sql`, `functions.sql`, and `storage.sql` reflect the **current intended state** of the application, while migration files record historical database evolution.
2. **PostgreSQL Functions vs. Edge Functions:** PostgreSQL trigger functions and RPC routines belong in `functions.sql`. Supabase Edge Functions are standalone TypeScript applications and are documented separately in `edge-functions.md`.
3. **Execution Dependency Order:** When setting up a database from scratch, execute in sequence:
   $$\text{schema.sql} \longrightarrow \text{functions.sql} \longrightarrow \text{rls.sql} \longrightarrow \text{storage.sql}$$

### Supabase Workflow Prompts:
- [`supabase/01-source-of-truth-generator.md`](./supabase/01-source-of-truth-generator.md) — Inspects codebase and generates the 4 canonical SQL files.
- [`supabase/02-sql-verification.md`](./supabase/02-sql-verification.md) — Independent SQL syntax, relationship, and multi-user isolation check.
- [`supabase/03-clean-db-setup-test.md`](./supabase/03-clean-db-setup-test.md) — Dependency-order verification for empty database setup.
- [`supabase/04-complete-resynchronization.md`](./supabase/04-complete-resynchronization.md) — Re-synchronizes SQL files with application code after feature updates.

---

## ⚖️ Core Engineering Philosophy

The VibeMedic methodology is built on foundational principles:

- 🔍 **Don't Trust Appearances:** A UI component rendering without console errors does not mean the feature works.
- 🚫 **Zero Fake Data Policy:** Never leave simulated delays, hardcoded stats, or mock arrays in production code.
- 🛡️ **Never Weaken Security for Convenience:** Never solve authorization bugs by making tables public or using `USING (true)`.
- 🔄 **Trace Data End-to-End:** An interaction is only functional when traced through:
  $$\text{User Action} \longrightarrow \text{Component} \longrightarrow \text{Handler} \longrightarrow \text{API} \longrightarrow \text{Database} \longrightarrow \text{Response} \longrightarrow \text{State Update} \longrightarrow \text{Persistence}$$
- 🧩 **Preserve Working Architecture:** Do not rewrite working subsystems or replace libraries merely for personal preference.
- 🧪 **Verification Is Mandatory:** A task is never complete until type checks, linters, tests, and production builds pass.
- 🧑‍✈️ **Keep Humans in Control:** The developer reviews and approves all AI agent modifications.

---

## 📖 Real-World Scenario

Here is an illustrative example of how a developer might use VibeMedic on an AI-generated SaaS application:

```text
1. Developer builds a React + Supabase dashboard using an AI coding assistant.
   The app looks visually complete, but feels brittle.

2. Developer copies "prompts/stage-1-diagnose/02-dummy-data-audit.md" into Cursor Composer.
   ➔ AI Agent discovers that monthly revenue numbers are hardcoded mock arrays and 
     replaces them with real Supabase RPC database queries.

3. Developer runs "prompts/stage-1-diagnose/03-ui-functionality-audit.md".
   ➔ AI Agent discovers that the "Delete Project" modal button has an empty onClick 
     handler and wires it to the real backend mutation with confirmation dialogs.

4. Developer runs "supabase/01-source-of-truth-generator.md".
   ➔ AI Agent scans all database interactions, creates canonical "schema.sql" and 
     "rls.sql", and catches a missing RLS policy on the team memberships table.

5. Developer runs "prompts/stage-4-experience-and-polish/25-pwa-conversion.md".
   ➔ AI Agent generates a valid web app manifest, installs a Service Worker shell, 
     and handles offline error recovery.

6. Developer runs project build and ships with confidence.
```

---

## 💖 Support VibeMedic

If **VibeMedic** saved you hours of debugging, caught a critical security vulnerability, or helped you ship your AI-built product with confidence, consider supporting the continued development and open-source maintenance of this project:

<div align="center">

[![Support VibeMedic via Flutterwave](https://img.shields.io/badge/Support%20VibeMedic-Donate%20via%20Flutterwave%20💳-0070BA?style=for-the-badge&logoColor=white)](https://flutterwave.com/donate/b6p187tamegm)

👉 **[Click here to Support VibeMedic via Flutterwave](https://flutterwave.com/donate/b6p187tamegm)**

</div>

---

## 👥 Authors & Company

**VibeMedic** is created and maintained by **[Amararu Kenneth](https://github.com/kenneth556)** under **Blakkaverse**.

- GitHub: [@kenneth556](https://github.com/kenneth556)
- Organization: **Blakkaverse**

---

## 🤝 Contributing

Contributions to improve prompt clarity, expand edge-case coverage, and refine audit workflows are welcome! Please review [`CONTRIBUTING.md`](./CONTRIBUTING.md) and [`AI_RULES.md`](./AI_RULES.md) before submitting pull requests.

---

## 📄 License

This project is open-source under the [MIT License](./LICENSE).
