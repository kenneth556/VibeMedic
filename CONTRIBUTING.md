# Contributing to Vibe Code Rescue

We welcome contributions to improve prompt reliability, expand test cases, and enhance audit coverage for AI-generated codebases.

---

## How to Contribute

1. **Fork & Branch:** Create a feature branch (e.g. `feature/new-audit-prompt` or `fix/supabase-rls-policy`).
2. **Follow Prompt Standards:**
   - Adhere to the structure in [`AI_RULES.md`](./AI_RULES.md).
   - Ensure the prompt is tested on at least one real-world codebase with an AI agent.
   - Include metadata (Stage, Target Focus, Primary Output).
3. **Update Indexes:**
   - Add your prompt to [`prompts/README.md`](./prompts/README.md).
   - Update the table in [`README.md`](./README.md).
   - Update [`REPAIR_STATUS.md`](./REPAIR_STATUS.md).
4. **Submit a Pull Request:** Provide a clear description of the issue the prompt solves and examples of issues it uncovered.

---

## Code of Conduct
Be helpful, collaborative, and respectful to all contributors.
