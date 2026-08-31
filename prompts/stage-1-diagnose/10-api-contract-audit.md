# Prompt 10: API Contract & Schema Alignment Audit

> **Stage 1 — Diagnose**  
> **Target:** Endpoint signatures, HTTP methods, payloads, response shapes, validation mismatches  
> **Output:** API Contract Matrix & Frontend-Backend Mismatch Fixes

---

## Prompt Text

```text
Perform a complete API contract audit.

For every API endpoint, service, RPC, server action, or backend function:

Document:

- Endpoint/function name
- HTTP method where applicable
- Authentication requirement
- Input parameters
- Validation
- Expected request structure
- Database operations
- Response structure
- Error responses
- Frontend consumers

Then compare:

FRONTEND EXPECTATION
vs
BACKEND IMPLEMENTATION

Find:

- Missing endpoints
- Wrong HTTP methods
- Wrong parameters
- Wrong field names
- Incorrect response shapes
- Missing fields
- Extra unused fields
- Incorrect status codes
- Missing validation
- Missing error handling
- Frontend calling nonexistent endpoints
- Backend endpoints with no consumers
- Inconsistent naming
- Inconsistent error formats

Fix verified contract mismatches.

Do not introduce breaking API changes unless necessary.

Afterward, run the complete test/build pipeline.
```
