# VibeMedic: Execution Guide

This guide details how to execute VibeMedic prompts with AI coding agents (Cursor, Windsurf, Claude Code, Antigravity, ChatGPT, Copilot, etc.) to achieve maximum reliability and zero regressions.

---

## The Golden Rules of Execution

1. **One Focus at a Time**: Never paste multiple audit prompts simultaneously into the same conversation turn unless running the dedicated `MASTER_REPAIR.md` orchestrator.
2. **Review Before Execution**: When running an audit prompt, let the agent diagnose and present the report first before asking for heavy structural refactors.
3. **Always Run the Verification Pipeline**: Every prompt instructs the agent to run type checking, linting, tests, and builds before concluding. Ensure the agent actually executes terminal commands.
4. **Treat the Codebase as Ground Truth**: Do not let the agent invent features, mock APIs, or use hardcoded arrays.

---

## Workflow Tracks

```mermaid
graph TD
    A[Start Target Repository] --> B{Choose Goal}
    B -->|Rapid Triage| C[Track A: Fast-Track Triage]
    B -->|Full Renovation| D[Track B: Complete Repository Rescue]
    B -->|Feature Finishing| E[Track C: Feature Completion Engine]
    B -->|Supabase Database| F[Track D: Supabase Synchronization]
    B -->|Design & PWA| G[Track E: Experience Polish & PWA]

    C --> C1[01 Codebase Audit] --> C2[02 Dummy Data] --> C3[03 UI Functionality]
    D --> D1[MASTER_REPAIR.md]
    E --> E1[16 Feature Inventory] --> E2[17 Feature Verification] --> E3[18 Implementation Engine] --> E4[21 Zero-Defect Pass]
    F --> F1[Supabase 01 Source-of-Truth] --> F2[Supabase 02 SQL Verification] --> F3[Supabase 04 Re-Sync]
    G --> G1[22 UI/UX Design] --> G2[25 PWA Conversion] --> G3[28 Final Polish]
```

---

## Track A: Fast-Track Triage (15-30 Minutes)
*Best for: Quick diagnostic check on an AI-generated MVP before presenting.*

1. **`prompts/stage-1-diagnose/01-codebase-technical-audit.md`** — Catches broken imports, syntax errors, and missing files.
2. **`prompts/stage-1-diagnose/02-dummy-data-audit.md`** — Identifies hardcoded arrays, mock counters, and fake setTimeout calls.
3. **`prompts/stage-1-diagnose/03-ui-functionality-audit.md`** — Fixes dead buttons, unhooked toggles, and empty handlers.

---

## Track B: Complete Senior Engineer Rescue (1-2 Hours)
*Best for: Inherited codebases, chaotic multi-agent repos, or pre-production readiness.*

1. **`prompts/MASTER_REPAIR.md`** — Runs all 9 phases autonomously:
   - Understand → Inventory → Diagnose → Prioritize → Repair → Complete Features → Verify → Regression Check → Final Report.

---

## Track C: Feature Discovery & Completion Engine
*Best for: Applications where half the features were started but left incomplete.*

1. **`prompts/stage-3-build-and-complete/16-master-feature-inventory.md`** — Discovers all intended features.
2. **`prompts/stage-3-build-and-complete/17-deep-feature-verification.md`** — Traces full 17-point lifecycle for each feature.
3. **`prompts/stage-3-build-and-complete/18-feature-implementation-engine.md`** — Implements unfinished features end-to-end.
4. **`prompts/stage-3-build-and-complete/19-partial-feature-completion.md`** — Closes all partial feature gaps.
5. **`prompts/stage-3-build-and-complete/21-zero-defect-feature-pass.md`** — Final verification pass.

---

## Track D: Supabase Database Synchronization
*Best for: Ensuring your PostgreSQL / Supabase schema, RLS, and storage match the frontend code 100%.*

1. **`supabase/01-source-of-truth-generator.md`** — Scans frontend and generates `schema.sql`, `rls.sql`, `functions.sql`, `storage.sql`.
2. **`supabase/02-sql-verification.md`** — Verifies multi-user tenant isolation and PostgreSQL syntax.
3. **`supabase/03-clean-db-setup-test.md`** — Validates clean dependency-order execution for new environments.
4. **`supabase/04-complete-resynchronization.md`** — Re-syncs after any major feature additions.

---

## Track E: Design System, Mobile & PWA Polish
*Best for: Transforming a clunky AI app into a slick, responsive, installable product.*

1. **`prompts/stage-4-experience-and-polish/22-ui-ux-design-audit.md`** — Standardizes spacing, typography, and card primitives.
2. **`prompts/stage-4-experience-and-polish/23-icons-and-visual-assets.md`** — Implements Lucide icons and clean asset paths.
3. **`prompts/stage-4-experience-and-polish/24-animation-and-microinteractions.md`** — Adds micro-interactions and smooth transitions.
4. **`prompts/stage-4-experience-and-polish/25-pwa-conversion.md`** — Creates web app manifest, service worker, and offline mode.
5. **`prompts/stage-4-experience-and-polish/26-mobile-experience-pass.md`** — Ergonomic mobile layout and touch target audit.
6. **`prompts/stage-4-experience-and-polish/28-final-production-polish.md`** — Eliminates all remaining visual rough edges.
