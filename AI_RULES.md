# AI Operating Rules & Guidelines for VibeMedic

This file defines the mandatory operating guidelines for any AI coding agent modifying, extending, or maintaining this repository.

---

## 1. Core Principles

- **Preserve Prompt Intent & Depth:** Never summarize, trim, or dilute prompt instructions to make them shorter. The rigor and specificity of the audit instructions are the core value of this framework.
- **Maintain Zero Dependencies:** This repository is intentionally pure Markdown, SQL, and documentation templates. Do not introduce npm packages, build tools, or heavy frameworks unless explicitly requested by the user.
- **Strict Numbering & Categorization:** All prompts in `prompts/` must adhere to their stage prefixes and numbered naming convention (`01-`, `02-`, etc.).
- **Self-Documenting:** Any addition or change to a prompt must be reflected immediately in `prompts/README.md`, `README.md`, and `REPAIR_STATUS.md`.

---

## 2. Prompt Authoring Standards

When creating or refining a prompt:
1. **Header Metadata:** Include Stage, Target Focus, and Primary Output at the top of the file.
2. **Copyable Prompt Block:** Enclose the exact prompt text inside a fenced code block (` ```text `) so humans and agents can easily extract it cleanly.
3. **5-Tier Flow Enforcement:** Prompts that inspect or fix features must explicitly enforce the end-to-end user flow:
   $$\text{UI} \longrightarrow \text{State} \longrightarrow \text{API} \longrightarrow \text{DB} \longrightarrow \text{Persistence}$$
4. **Mandatory Verification Requirement:** Every execution prompt must instruct the agent to run type checking, linting, tests, and production build.

---

## 3. Safe Modifications

- Do not alter existing prompt numbering without updating all cross-references across `docs/`, `prompts/README.md`, and `README.md`.
- Keep templates in `supabase/templates/` idempotent (e.g. `CREATE TABLE IF NOT EXISTS`, `CREATE OR REPLACE FUNCTION`, `IF NOT EXISTS` DO blocks).
- Ensure all GitHub links in markdown files are valid and relative.
