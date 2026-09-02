# Prompt 38: Environment Variables & Secrets Audit

> **Stage 6 — API Integrations**  
> **Target:** `.env`, `.env.local`, `.env.example`, frontend exposure (public prefixes), server variables, hardcoded credentials, mismatched variable names, missing docs, secret rotation gaps  
> **Primary Output:** Clean, Documented, Audited Environment Configuration with `.env.example` Sync

---

## Prompt Text

```text
Perform a complete environment variables & secrets audit of this
repository.

GOAL
Ensure every environment variable used by the application is correctly
defined, scoped (server vs. client), documented in `.env.example`,
matches the code that consumes it, and contains no leaked, hardcoded,
default, or stale credentials.

DISCOVERY — find every variable referenced in code:

- Search source files for any identifier matching `process.env.*`,
  `import.meta.env.*`, `Deno.env.get`, `os.environ`, etc.
- Record:
  - Variable name
  - First-seen location
  - Where it should be defined (server-only, edge, frontend-public)
  - Whether it has a public equivalent (`NEXT_PUBLIC_*`, `VITE_*`,
    `REACT_APP_*`, `EXPO_PUBLIC_*`, etc.) and whether that is correct
  - Default value (if any) and whether the default is safe
  - Whether it is referenced anywhere undocumented

LEAKS — find and report any of the following:

1. Real credentials, tokens, or keys committed to the repo
   (search tracked files AND history if accessible).
2. Provider secrets present in any client-side bundle:
   - Anything prefixed `NEXT_PUBLIC_*`, `VITE_*`, `REACT_APP_*`,
     `EXPO_PUBLIC_*`, `PUBLIC_*` that contains a secret.
   - Anything imported from a non-server-only file that returns a
     secret.
3. Test / sandbox keys accidentally used in production env files.
4. Default / placeholder / `xxxxx` values left behind.
5. `.env`, `.env.local`, `.env.production` files NOT in `.gitignore`.
6. Secrets logged at runtime (in `console.log`, log sinks, error
   reporters).
7. Secrets sent to the client via SSR payload leaks.

SCOPING — verify the right placement:

- Server-only secrets (DB URL, service-role key, Stripe secret, OpenAI
  key, Termii key, Mono secret, etc.) must NEVER be reachable from the
  browser bundle.
- Public variables must use the framework's public-prefix convention.
- Variables that are needed in both client and server must be
  intentionally duplicated with the correct prefix.

NAMING CONSISTENCY — verify:

1. Names in `.env`, `.env.example`, and code are identical
   (case-sensitive).
2. No accidental typos (`STRIPE_SECRET` vs `STRIP_SECRET`,
   `OPEN_API_KEY` vs `OPENAI_API_KEY`).
3. No whitespace, quotes, or stray characters around values.
4. Variable names match the provider's documentation.

DOCUMENTATION — verify `.env.example`:

1. Every variable required to build, run, or deploy is listed.
2. Each variable has a one-line description.
3. Public-vs-private prefix is clearly indicated.
4. Example values are non-sensitive (URLs, names, public keys).
5. Required vs optional is indicated.
6. Grouped logically (Auth, Payments, Email, AI, Storage, etc.).
7. Listed alongside the provider that consumes it.

ROTATION & HYGIENE — verify:

1. Secret rotation procedure is documented
   (how to rotate a key, who owns it, what depends on it).
2. Old / disabled credentials are removed.
3. CI does not print secrets in logs.
4. CI fails fast if a required secret is missing.
5. Local development has a safe `.env.local.example` (no real secrets).

FIX PROTOCOL:

For every finding:

1. Remove the leaked credential and rotate it at the provider.
2. Move secret-bearing calls behind server-only modules
   (server actions, route handlers, edge functions, jobs).
3. Rename any variable to its canonical name and update every reference.
4. Update `.env.example` to reflect the canonical, documented variable
   set.
5. Add a runtime check on the server: fail fast if a required secret is
   missing (with a safe message that does NOT print the secret).
6. Add `.env`, `.env.local`, `.env.*.local` to `.gitignore`.
7. Add a `CONTRIBUTING.md` note explaining the secrets policy.
8. Add a small `docs/ENVIRONMENT.md` if helpful, mapping provider →
   required vars → docs link.

DO NOT:
- Commit `.env` files to Git.
- Move a secret to a public prefix to "fix" a build.
- Replace a real key with a placeholder and call it done.
- Leave stale variables referenced in code.

AFTER REPAIRS:

TYPECHECK → LINT → TEST → BUILD

Confirm the app boots successfully with a fresh clone using ONLY
`.env.example` (renamed locally) and any non-secret defaults.

Produce an Environment & Secrets Report:
- Full variable inventory (name, scope, provider, required vs optional)
- Leak findings with severity and remediation status
- Variable-name mismatches fixed
- Updated `.env.example` diff
- Rotation checklist per provider
- Verification evidence (commands run, what passed)
```