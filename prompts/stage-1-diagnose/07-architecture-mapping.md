# Prompt 07: Architecture Mapping & Analysis

> **Stage 1 — Diagnose**  
> **Target:** Architecture, modules, dependency graphs, coupling, legacy code  
> **Output:** Master Architecture Report & AI Agent Dependency Map

---

## Prompt Text

```text
Perform a complete architectural analysis of this repository.

Do not modify code yet.

Map the entire application:

- Frontend architecture
- Backend architecture
- Database architecture
- Authentication architecture
- API architecture
- State management
- Routing
- Component hierarchy
- Service layer
- Utility layer
- External integrations
- Storage
- Environment variables
- Build/deployment configuration

Identify:

- Entry points
- Core modules
- Shared modules
- Feature modules
- Dependency relationships
- Circular dependencies
- Tightly coupled modules
- Dead modules
- Duplicate functionality
- Duplicate utilities
- Inconsistent patterns
- Legacy code
- Abandoned implementations
- Multiple competing implementations of the same feature

Create a dependency map showing which major parts of the application depend on which other parts.

Also identify the safest locations to make changes for each major feature.

Do not refactor anything yet.

Produce an ARCHITECTURE REPORT that another AI coding agent can use to understand the repository before making modifications.
```
