# Prompt 16: Master Feature Inventory

> **Stage 3 — Build & Complete**  
> **Target:** Discovery of all intended features across routes, components, database, APIs, UI copy  
> **Output:** Master Feature Inventory with Status Tags (Complete, Partial, Not Started, Blocked) & Roadmap

---

## Prompt Text

```text
Now stop making fixes for a moment.

I want you to perform a COMPLETE FEATURE INVENTORY of the entire application.

Inspect the entire codebase, routes, pages, components, services, API endpoints, database schema, migrations, configuration, and UI.

Your job is to discover EVERY feature the application is intended to have.

Do not rely only on a README or documentation. Infer features from:
- Navigation
- Routes
- Page names
- Components
- Buttons
- Forms
- Modals
- Database tables
- API endpoints
- Services
- Types/interfaces
- TODOs
- Comments
- Existing partially implemented functionality
- Settings
- Admin interfaces
- User flows
- Empty states
- Feature flags
- Configuration
- Existing UI copy

Create a MASTER FEATURE INVENTORY.

For every feature, determine its implementation status:

🟢 COMPLETE
Feature is implemented end-to-end and appears functional.

🟡 PARTIALLY IMPLEMENTED
Some functionality exists but important pieces are missing or broken.

🔴 NOT STARTED
The feature is referenced/intended but has little or no actual implementation.

⚫ BLOCKED
Implementation requires something unavailable, such as credentials, an external service, a required decision, or missing infrastructure.

For every feature record:

- Feature name
- Purpose
- User-facing location
- Relevant files
- Database tables involved
- API/backend involved
- Current status
- What is already implemented
- What is missing
- Dependencies
- Priority
- Recommended implementation order

IMPORTANT:
Do not modify the application during this step.

I want the inventory first.

At the end, produce a prioritized implementation roadmap from highest-value unfinished feature to lowest-value unfinished feature.
```
