# Prompt 24: Dependency & Supply Chain Audit

> **Stage 3 — Build & Complete**  
> **Target:** Vulnerable packages, abandoned packages, suspicious dependencies, outdated critical dependencies, duplicate dependencies, unnecessary packages, lockfile consistency  
> **Primary Output:** Hardened Dependency Manifest, Supply-Chain Risk Report & Lockfile Reconciliation

---

## Prompt Text

```text
# DEPENDENCY & SUPPLY CHAIN AUDIT

You are performing a complete dependency and supply-chain audit of the
application. The goal is to ensure every direct and transitive
dependency is necessary, actively maintained, free of known
vulnerabilities, and consistent across lockfiles and environments.

Do not blindly upgrade dependencies.
Do not remove packages without confirming they are unimported.
Do not introduce new dependencies without justification.

---

# STEP 1 — INVENTORY

Capture the current state of every dependency in:

- `package.json` / `pnpm-workspace.yaml` / `yarn.lock`
- `pyproject.toml` / `requirements.txt` / `Pipfile` / `poetry.lock`
- `Cargo.toml` / `Cargo.lock`
- `go.mod` / `go.sum`
- `Gemfile` / `Gemfile.lock`
- Any other manifests

For each direct dependency, record:

- Name
- Pinned version / range
- License
- Publisher / maintainer
- Last release date
- Open vulnerabilities
- Actual usage in source

---

# STEP 2 — USAGE VERIFICATION

For every direct dependency, verify it is actually imported or used.

Tools:

- `depcheck`
- `npx knip`
- `npm ls <pkg>` / `pnpm why <pkg>` / `yarn why <pkg>`
- `pydeps`, `pip-check-reqs`, `deptry`
- Language-server "find references"

Classify each dependency:

- 🟢 IN USE — imported by source
- 🟡 DEV ONLY — used only by tests, lint, build, typecheck
- 🔴 UNUSED — nothing imports it (candidate for removal)
- ⚫ DYNAMIC — referenced only via string (CDN, plugin loader,
  dynamic import) — keep but document

---

# STEP 3 — VULNERABILITY SCAN

Run all available vulnerability scanners:

- `npm audit --omit=dev`
- `pnpm audit`
- `yarn audit`
- `pip-audit` / `safety`
- `cargo audit`
- `govulncheck`
- GitHub Dependabot alerts
- Snyk / Socket / Aikido (if configured)
- OSV (https://osv.dev) for direct lookups

Record each finding:

- Severity (Critical, High, Medium, Low)
- Affected package
- Vulnerable version range
- Fixed version (if any)
- Reachable from application code (yes / no / unclear)

Fix priorities:

- 🔴 Critical / High with reachable exploit code → fix immediately
- 🟧 Medium → fix in the current sprint
- 🟨 Low → track, fix opportunistically

Fix strategies:

1. Upgrade to the fixed version
2. Pin the version range to exclude the vulnerable range
3. Replace with a maintained alternative
4. Patch via `overrides` / `resolutions` (npm) / `pnpm.overrides`
5. Document as accepted risk if no fix is available (with rationale)

---

# STEP 4 — ABANDONED PACKAGES

For every direct dependency, check:

- Last release date (npm: `npm view <pkg> time`; PyPI: release history)
- Open issues / PRs
- Maintainer activity
- Archived repo

A package is considered abandoned if:

- No release in > 1 year AND
- Open critical issues unresolved AND
- Maintainer unresponsive

For each abandoned package:

- Look for an active fork or successor
- Evaluate migration cost
- Either migrate, replace, or document as accepted risk

---

# STEP 5 — SUSPICIOUS DEPENDENCIES

Detect:

- Typosquats (e.g. `react-dom` vs `reactt-dom`)
- Packages with very low download counts but present in a real app
- Packages with a sudden ownership change
- Packages that run install scripts (`postinstall`) without
  justification
- Packages that pull in unusual binaries or native code
- Packages whose maintainer email domain changed recently

Use:

- `socket.dev` / `snyk advisor`
- npm registry "maintainers" history
- GitHub repo activity
- Package metadata diffs over time

For each suspicious finding:

- Investigate before merging
- Replace if needed
- Pin to a known-good version

For each `postinstall` / `preinstall` script:

- Read the script
- Understand what it does
- Block installs that run obfuscated code
- Prefer tools that don't run install scripts (`pnpm` default in many
  configs)

---

# STEP 6 — OUTDATED CRITICAL DEPENDENCIES

Critical packages that must stay current:

- Framework runtime (Next.js, React, Vue, Svelte, Angular, Express,
  Fastify, Hono, Django, Flask, Rails, etc.)
- Authentication library
- Database driver / ORM
- Payment SDK
- Validation library
- HTTP client
- Crypto library
- Anything handling secrets, auth, payments, or session

For each:

- Find the latest stable version
- Read the changelog for breaking changes
- Plan / execute an upgrade
- Run TYPECHECK → LINT → TEST → BUILD after each upgrade
- Pin to a safe minor range after upgrade

---

# STEP 7 — DUPLICATE DEPENDENCIES

Find:

- Multiple packages solving the same problem (e.g. two date libraries,
  two HTTP clients, two validation libraries)
- Multiple forks of the same package
- Packages that overlap with built-in platform features

For each:

1. Pick the canonical
2. Migrate call sites
3. Remove the duplicates
4. Document why the canonical was chosen

---

# STEP 8 — UNNECESSARY PACKAGES

Find:

- Packages that wrap a one-liner (e.g. `is-number`, `left-pad`)
- Packages that duplicate a built-in (e.g. `array-uniq` vs `Set`)
- Packages installed "just in case" but never imported
- Heavyweight packages used for trivial functionality (e.g. `lodash`
  used for `_.get`)

Remove where the savings outweigh the migration cost.

---

# STEP 9 — LOCKFILE CONSISTENCY

Audit:

- `package-lock.json` / `pnpm-lock.yaml` / `yarn.lock` / `poetry.lock`
  exists and is committed
- `npm ci` (or equivalent) runs cleanly from a fresh clone
- Lockfile reflects the manifest exactly
- No manually-edited entries that don't resolve
- No `peerDependencies` warnings blocking install
- No `optionalDependencies` failures breaking CI

Fix:

- Regenerate lockfile cleanly
- Commit it
- Add `npm ci` (or equivalent) to CI
- Fix any peer-dependency conflicts

---

# STEP 10 — ENVIRONMENT PINNING

Audit:

- Node / Python / Ruby / Go / Rust / etc. versions are pinned
  (`.nvmrc`, `.python-version`, `.ruby-version`, `go.mod` `go` line)
- CI uses the same pinned version
- Docker images use the same pinned version
- No "latest" tags in production Dockerfiles

Fix:

- Pin versions everywhere
- Document the support window

---

# STEP 11 — LICENSE & COMPLIANCE

Audit:

- Every direct dependency's license
- No unexpected licenses (GPL where the project is proprietary, etc.)
- No "UNKNOWN" license
- License notes documented in `THIRD_PARTY_NOTICES.md` (or equivalent)

Fix:

- Replace GPL-tainted dependencies where the project is proprietary
- Document the dependency graph for legal review
- Add a CI check on license changes (e.g. `license-checker`)

---

# STEP 12 — REPAIR

For each verified issue:

1. Apply the minimal, safe change
2. Update the lockfile cleanly
3. Run TYPECHECK → LINT → TEST → BUILD
4. Add a CI check that fails the build on regressions:
   - `npm audit` with `--audit-level=high`
   - License check
   - Depcheck / knip in CI

For each accepted risk (abandoned, no-fix vulnerability):

- Document in `docs/DEPENDENCY_RISKS.md`
- Add a review date
- Track it

---

# STEP 13 — VERIFY

After changes:

- `npm ci` from a fresh clone works
- TYPECHECK → LINT → TEST → BUILD all pass
- App starts cleanly with the new dependencies
- No new console warnings on install
- No runtime warnings about deprecated APIs

---

# FINAL REPORT

## Supply-Chain Status

Overall: `HEALTHY / NEEDS ATTENTION / AT RISK`

## Vulnerabilities Found & Fixed

| Severity | Package | Fixed Version | Fix |
| --- | --- | --- | --- |
| ... | ... | ... | ... |

## Abandoned Packages

| Package | Replacement | Migration Status |
| --- | --- | --- |
| ... | ... | ... |

## Suspicious Packages Investigated

List every suspicious finding and the resolution.

## Outdated Critical Dependencies Upgraded

List every upgrade with before / after.

## Duplicates Removed

List duplicates and the canonical chosen.

## Unnecessary Packages Removed

List every removed package.

## Lockfile Reconciliation

Status: yes / no. If no, what was wrong?

## License Compliance

Status: compliant / non-compliant. Notes.

## CI Guards Added

List any CI checks added.

## Remaining Manual Actions

List anything requiring vendor review, legal review, or platform
upgrade.

Do not claim a vulnerability was fixed unless it was actually fixed
and the build passes.

---

# CORE SUPPLY-CHAIN RULES

- Never install a package you cannot justify.
- Never run an install script you cannot read.
- Never trust a package's name alone — verify the publisher.
- Never ignore a Critical or High vulnerability you can fix.
- Never ship an unmaintained package without documenting the risk.
- Never upgrade blindly across majors — read the changelog.
- Never commit a regenerated lockfile without verifying the diff.
- Never claim a fix is verified unless the app builds and tests pass.
```