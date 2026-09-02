# Prompt 28: Progressive Web App (PWA) Conversion

> **Stage 4 — Experience & Polish**  
> **Target:** Manifest, service workers, asset caching, installability, offline UX  
> **Output:** Production-Grade PWA Suite (Manifest, Service Worker, Offline Shell, Icons)

---

## Prompt Text

```text
Convert the application into a production-quality Progressive Web App where the project's architecture supports it.

First inspect the existing stack and determine the correct PWA implementation for this project.

Implement:

### PWA MANIFEST

Create/configure a proper web app manifest containing:

- Application name
- Short name
- Description
- Start URL
- Display mode
- Theme color
- Background color
- Icons
- Appropriate icon sizes
- App orientation where appropriate

### SERVICE WORKER

Implement a service worker using the appropriate tooling for the existing stack.

Do not manually create a fragile service worker if the project already has a reliable PWA plugin/library available.

Configure appropriate caching strategies.

At minimum, handle:

- Application shell
- Static assets
- Fonts where appropriate
- Safe cacheable resources

Do NOT blindly cache API responses containing private/user-specific data.

### INSTALLABILITY

Ensure the application meets normal PWA installability requirements where applicable.

Support:

- Desktop installation
- Android installation
- Appropriate mobile behavior

### OFFLINE EXPERIENCE

Create a useful offline experience.

When the network is unavailable:

- The application should not simply display a blank page.
- Show a clear offline state.
- Preserve safe locally available application state where appropriate.
- Queue operations only if the application architecture can safely support this.

Do not pretend that database writes succeeded while offline.

### ICONS

Provide proper:

- favicon
- PWA icons
- maskable icon where appropriate
- Apple touch icon where appropriate

### MOBILE EXPERIENCE

Audit:

- viewport configuration
- safe areas
- touch targets
- mobile navigation
- scrolling
- installation experience

### UPDATE STRATEGY

Ensure users can receive new versions of the application without becoming permanently stuck on an old cached version.

Test:

ONLINE
→ OFFLINE
→ RECONNECT
→ UPDATE
→ RELOAD

Do not compromise authentication or data integrity for offline functionality.

Document the PWA architecture and how developers should test it.
```
