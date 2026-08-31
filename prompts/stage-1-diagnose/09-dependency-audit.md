# Prompt 09: Dependency & Package Audit

> **Stage 1 — Diagnose**  
> **Target:** Package usage, bloat, duplicates, peer dependency conflicts, undeclared imports  
> **Output:** Clean Dependency Tree & Stability Report

---

## Prompt Text

```text
Perform a complete dependency audit.

Inspect every dependency and determine:

- Whether it is actually used
- Where it is used
- Whether it is duplicated
- Whether multiple libraries perform the same purpose
- Whether it is unnecessarily heavy
- Whether it is outdated enough to cause compatibility problems
- Whether the project contains unused packages
- Whether imports reference packages not declared in package.json
- Whether declared packages are missing from the lockfile
- Whether package versions conflict
- Whether peer dependency problems exist

Do not blindly upgrade everything.

Prioritize stability over modernization.

Remove clearly unused dependencies when safe.

Fix missing or incorrect dependency declarations.

Do not replace libraries simply because you personally prefer another library.

After changes:

- reinstall dependencies
- typecheck
- lint
- test
- build

Report all dependency changes and why they were made.
```
