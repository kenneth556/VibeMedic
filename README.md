<div align="center">

# 🩺 VibeMedic

### *Your AI-generated app is probably held together by vibes.*

**VibeMedic** is an open-source AI repair toolkit that helps developers **audit**, **complete**, **secure**, and **productionize** vibe-coded applications.

```text
AUDIT  ➔  DIAGNOSE  ➔  REPAIR  ➔  VERIFY  ➔  SHIP
```

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)
[![Zero Dependencies](https://img.shields.io/badge/dependencies-none-success.svg)](#)
[![AI Compatible](https://img.shields.io/badge/AI%20Agents-Cursor%20%7C%20Claude%20%7C%20Windsurf%20%7C%20Antigravity-orange.svg)](#)

</div>

---

## 🎯 What It Catches

AI coding assistants are great at building prototypes in minutes, but they leave behind silent landmines. **VibeMedic diagnoses and cures:**

- 🐛 **Broken functionality** — Type errors, runtime crashes, and missing imports
- 🧪 **Dummy / mock data** — Hardcoded arrays, fake stats, and simulated `setTimeout` calls
- 🖱️ **Dead buttons & toggles** — Missing `onClick` handlers and forms that don't persist
- 🗄️ **Supabase / database mismatches** — Schema discrepancies, missing migrations, and query bugs
- 🔐 **Authentication & RLS problems** — Overly permissive policies, role bypasses, and IDOR vulnerabilities
- 🔌 **Broken API contracts** — Mismatched payloads and nonexistent endpoints
- 📱 **Responsive issues** — Broken mobile layouts, viewport overflow, and touch-target friction
- ✨ **UI / UX problems** — Inconsistent design systems, random typography, and awkward spacing
- 🎬 **Missing animations & micro-interactions** — Abrupt state transitions and lack of visual feedback
- 📲 **PWA & offline issues** — Missing manifests, broken service workers, and blank offline screens
- 🧹 **Dependency & config problems** — Unused bloat packages and broken clean clone setups

---

## ⚡ Quick Start (30 Seconds)

### 1. Clone VibeMedic
```bash
git clone https://github.com/YOUR_USERNAME/VibeMedic.git
```

### 2. Run in Your AI Assistant
Open **Cursor Composer**, **Claude Code**, **Windsurf Cascade**, **Antigravity**, or **ChatGPT Projects**:

| Scenario | What to Paste |
|----------|---------------|
| 🚀 **Full End-to-End Rescue** | Copy [`prompts/MASTER_REPAIR.md`](./prompts/MASTER_REPAIR.md) into your AI agent. |
| 🗄️ **Supabase DB & RLS Sync** | Copy [`supabase/01-source-of-truth-generator.md`](./supabase/01-source-of-truth-generator.md). |
| 🧪 **Eliminate Fake / Mock Data** | Copy [`prompts/stage-1-diagnose/02-dummy-data-audit.md`](./prompts/stage-1-diagnose/02-dummy-data-audit.md). |
| 🖱️ **Fix Dead Buttons & Forms** | Copy [`prompts/stage-1-diagnose/03-ui-functionality-audit.md`](./prompts/stage-1-diagnose/03-ui-functionality-audit.md). |
| 📲 **Convert App to PWA** | Copy [`prompts/stage-4-experience-and-polish/25-pwa-conversion.md`](./prompts/stage-4-experience-and-polish/25-pwa-conversion.md). |

### 3. Verify & Ship
Every VibeMedic prompt forces the agent to run the mandatory verification pipeline:
$$\text{Typecheck} \longrightarrow \text{Lint} \longrightarrow \text{Test} \longrightarrow \text{Build} \longrightarrow \text{User Flow}$$

---

## 🗺️ The 5 Treatment Stages

```mermaid
flowchart LR
    subgraph S1["🩺 Stage 1: Diagnose"]
        D1[01 Codebase Audit]
        D2[02 Dummy Data]
        D3[03 UI Functionality]
        D4[04 DB & Backend]
        D5[05 Auth & Security]
    end

    subgraph S2["🔧 Stage 2: Repair"]
        R1[11 Error Resilience]
        R2[12 Security & IDOR]
        R3[13 Performance]
        R4[14 Accessibility]
        R5[15 Responsive]
    end

    subgraph S3["🏗️ Stage 3: Build & Complete"]
        B1[16 Feature Inventory]
        B2[17 Deep Verification]
        B3[18 Implementation Engine]
        B4[21 Zero-Defect Pass]
    end

    subgraph S4["🎨 Stage 4: Experience & Polish"]
        E1[22 UI/UX Design]
        E2[23 Assets & Icons]
        E3[24 Motion & Micro]
        E4[25 PWA & Offline]
        E5[28 Final Polish]
    end

    subgraph S5["📚 Stage 5: Standards & Docs"]
        DOC1[29 Documentation]
        DOC2[30 AI Rules]
    end

    S1 --> S2 --> S3 --> S4 --> S5
```

---

## 🗂️ Complete Prompt Index

### 🏥 Master Doctor Orchestrator
- [`MASTER_REPAIR.md`](./prompts/MASTER_REPAIR.md) — 9-Phase Senior Engineer repository rescue & regression testing.

### 🩺 Stage 1 — Diagnose
- [`01-codebase-technical-audit.md`](./prompts/stage-1-diagnose/01-codebase-technical-audit.md) — Full technical health audit (types, imports, errors).
- [`02-dummy-data-audit.md`](./prompts/stage-1-diagnose/02-dummy-data-audit.md) — Hunt down and replace mock arrays, fake counters & `setTimeout` stubs.
- [`03-ui-functionality-audit.md`](./prompts/stage-1-diagnose/03-ui-functionality-audit.md) — Dead buttons, unhooked toggles, and form submission repair.
- [`04-database-backend-audit.md`](./prompts/stage-1-diagnose/04-database-backend-audit.md) — Schemas, queries, mutations, foreign keys & RLS trace.
- [`05-auth-security-audit.md`](./prompts/stage-1-diagnose/05-auth-security-audit.md) — Authentication, role guards & user data isolation.
- [`06-comprehensive-system-audit.md`](./prompts/stage-1-diagnose/06-comprehensive-system-audit.md) — Full lifecycle system check & manual test plan.
- [`07-architecture-mapping.md`](./prompts/stage-1-diagnose/07-architecture-mapping.md) — Dependency graph and safe modification map.
- [`08-environment-setup-audit.md`](./prompts/stage-1-diagnose/08-environment-setup-audit.md) — Clean clone onboarding and environment config.
- [`09-dependency-audit.md`](./prompts/stage-1-diagnose/09-dependency-audit.md) — Package bloat removal & peer dependency conflicts.
- [`10-api-contract-audit.md`](./prompts/stage-1-diagnose/10-api-contract-audit.md) — Frontend expectations vs. backend API contract audit.

### 🔧 Stage 2 — Repair & Quality
- [`11-error-resilience-audit.md`](./prompts/stage-2-repair/11-error-resilience-audit.md) — Loading, error, success, and empty state coverage.
- [`12-security-audit.md`](./prompts/stage-2-repair/12-security-audit.md) — IDOR, XSS, SQLi, CSRF & client secret leaks.
- [`13-performance-audit.md`](./prompts/stage-2-repair/13-performance-audit.md) — N+1 queries, bundle size, re-renders & memory leaks.
- [`14-accessibility-audit.md`](./prompts/stage-2-repair/14-accessibility-audit.md) — Keyboard navigation, focus traps, aria labels & contrast.
- [`15-responsive-design-audit.md`](./prompts/stage-2-repair/15-responsive-design-audit.md) — Multi-viewport layouts across mobile, tablet, desktop.

### 🏗️ Stage 3 — Build & Complete
- [`16-master-feature-inventory.md`](./prompts/stage-3-build-and-complete/16-master-feature-inventory.md) — Full feature inventory and status categorization.
- [`17-deep-feature-verification.md`](./prompts/stage-3-build-and-complete/17-deep-feature-verification.md) — 17-point lifecycle verification of every feature.
- [`18-feature-implementation-engine.md`](./prompts/stage-3-build-and-complete/18-feature-implementation-engine.md) — Systematic implementation engine for unfinished features.
- [`19-partial-feature-completion.md`](./prompts/stage-3-build-and-complete/19-partial-feature-completion.md) — 5-tier completion pass for partial features.
- [`20-feature-discovery-pass.md`](./prompts/stage-3-build-and-complete/20-feature-discovery-pass.md) — Uncover hidden, abandoned, or disconnected features.
- [`21-zero-defect-feature-pass.md`](./prompts/stage-3-build-and-complete/21-zero-defect-feature-pass.md) — Final zero-unfinished-features completion pass.

### 🎨 Stage 4 — Experience & Polish
- [`22-ui-ux-design-audit.md`](./prompts/stage-4-experience-and-polish/22-ui-ux-design-audit.md) — Visual hierarchy, typography, spacing & design system.
- [`23-icons-and-visual-assets.md`](./prompts/stage-4-experience-and-polish/23-icons-and-visual-assets.md) — Semantic icon library (Lucide) and asset strategy.
- [`24-animation-and-microinteractions.md`](./prompts/stage-4-experience-and-polish/24-animation-and-microinteractions.md) — Motion, page transitions & micro-interactions.
- [`25-pwa-conversion.md`](./prompts/stage-4-experience-and-polish/25-pwa-conversion.md) — Progressive Web App, Service Worker & offline experience.
- [`26-mobile-experience-pass.md`](./prompts/stage-4-experience-and-polish/26-mobile-experience-pass.md) — Mobile-first touch ergonomics & safe areas.
- [`27-user-journey-audit.md`](./prompts/stage-4-experience-and-polish/27-user-journey-audit.md) — Frictionless user journeys from signup to return visit.
- [`28-final-production-polish.md`](./prompts/stage-4-experience-and-polish/28-final-production-polish.md) — Micro-spacing, polish & elimination of AI roughness.

### 📚 Stage 5 — Standards & Docs
- [`29-project-documentation-generator.md`](./prompts/stage-5-standards-and-docs/29-project-documentation-generator.md) — Code-accurate docs generation (`README`, `ARCHITECTURE`, etc.).
- [`30-ai-rules-generator.md`](./prompts/stage-5-standards-and-docs/30-ai-rules-generator.md) — Creates permanent `AI_RULES.md` operating instructions.

### 🗄️ Supabase Database Engine
- [`supabase/01-source-of-truth-generator.md`](./supabase/01-source-of-truth-generator.md) — Generates canonical `schema.sql`, `rls.sql`, `functions.sql`, `storage.sql`.
- [`supabase/02-sql-verification.md`](./supabase/02-sql-verification.md) — Independent SQL verification & multi-tenant isolation check.
- [`supabase/03-clean-db-setup-test.md`](./supabase/03-clean-db-setup-test.md) — Fresh database installation dependency test.
- [`supabase/04-complete-resynchronization.md`](./supabase/04-complete-resynchronization.md) — Codebase & Supabase schema re-synchronization.

---

## 🛠️ Assistant Compatibility

VibeMedic prompts are optimized and tested for:
- 🟢 **Cursor** (`Cmd+K`, `Composer`, Agent Mode)
- 🟢 **Claude Code CLI** / **Claude 3.7 Sonnet**
- 🟢 **Windsurf Cascade**
- 🟢 **Google Antigravity IDE**
- 🟢 **GitHub Copilot Workspace**
- 🟢 **ChatGPT Canvas / Projects**

---

## 📄 License

This project is open-source and licensed under the [MIT License](./LICENSE).
