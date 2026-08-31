# Prompt 23: Visual Assets, Icons & Lottie Animation Strategy

> **Stage 4 — Experience & Polish**  
> **Target:** Icon libraries (Lucide/Heroicons/Icons8), asset tree, Lottie animations, licensing  
> **Output:** Cohesive Icon & Asset Architecture (`src/assets/`) and Dynamic Feedback

---

## Prompt Text

```text
Establish a consistent visual asset strategy for the application.

Before adding assets, inspect the existing project for an icon library or asset system.

Prefer reusable icon libraries over manually drawn SVGs when appropriate.

### ICON SOURCES

When suitable, use established libraries/services such as:

- Lucide Icons
- Icons8
- Font Awesome
- Heroicons
- Tabler Icons
- Phosphor Icons

Use the project's existing icon library if one is already established.

If using Lucide in a React application, install/use the appropriate Lucide React package and import icons directly from it rather than manually copying SVG markup.

Example pattern:

import { Search, Settings, Bell } from "lucide-react";

Use icons semantically and consistently.

### ICON RULES

Do:

- Use icons that clearly represent their action.
- Keep icon sizes consistent.
- Align icons with text properly.
- Use the same icon for the same action throughout the application.
- Provide accessible labels for icon-only buttons.
- Use tooltips when an icon's meaning isn't obvious.

Do NOT:

- Mix five unrelated icon styles.
- Use random Unicode symbols as UI icons.
- Use emoji as a replacement for product icons.
- Copy random SVGs from search results.
- Use huge decorative icons where they add no value.
- Add icons to every piece of text unnecessarily.

### ICON8 / EXTERNAL ASSETS

If Icons8 or another external asset provider is used, follow its current licensing and attribution requirements.

Do not hotlink assets unnecessarily.

Prefer downloading/embedding assets appropriately when the project requires reliable production behavior.

### LOTTIE

Use Lottie animations for:

- Empty states
- Success states
- Onboarding
- Loading experiences
- Celebratory moments
- Illustrative product states

Do not use Lottie for every animation.

Prefer lightweight CSS or Framer Motion animations for normal UI interactions.

When adding Lottie:

- Use the appropriate maintained Lottie package.
- Keep animations lightweight.
- Avoid blocking initial page load.
- Lazy-load large animations when appropriate.
- Respect reduced-motion preferences.

### ASSET ORGANIZATION

Create a clear asset structure if one does not already exist.

For example:

src/assets/
  icons/
  images/
  illustrations/
  animations/

Keep asset naming consistent.

Do not introduce external assets without checking licensing and production reliability.
```
