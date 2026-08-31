# Prompt 20: Hidden & Abandoned Feature Discovery Pass

> **Stage 3 — Build & Complete**  
> **Target:** Unconnected schemas, orphaned types, disabled buttons, TODOs, abandoned endpoints  
> **Output:** Newly Discovered Feature Roster & Selective Full Implementation

---

## Prompt Text

```text
Now perform another independent feature discovery pass.

Assume that the previous feature inventory may have missed things.

Search the entire codebase for functionality that is:

- Referenced but not implemented
- Mentioned in UI text
- Present in navigation but missing
- Present in database schema but unused
- Present in types but unused
- Present in API definitions but not connected
- Present in backend but not exposed to the UI
- Present in UI but not connected to backend
- Referenced by TODO/FIXME comments
- Hidden behind feature flags
- Behind unfinished settings
- Behind disabled buttons
- Behind "coming soon" messages
- Represented by placeholder components
- Represented by empty pages
- Represented by empty handlers
- Represented by mock services
- Represented by hardcoded data
- Started but abandoned
- Implemented only on one side of the application

Also inspect the database for tables, columns, relationships, triggers, functions, or policies that indicate functionality the UI currently doesn't expose.

Create a list of newly discovered unfinished functionality.

Then determine whether each item is:
- Missing entirely
- Partially implemented
- Broken
- Intentionally unused
- Deprecated

For legitimate unfinished functionality, IMPLEMENT it using the existing architecture.

Do not implement deprecated or intentionally unused functionality.

After implementation, run all relevant checks and update the feature inventory.
```
