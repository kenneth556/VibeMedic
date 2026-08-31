# Prompt 24: Motion, Animations & Micro-Interactions System

> **Stage 4 — Experience & Polish**  
> **Target:** Page transitions, modal choreography, hover/active states, feedback, reduced motion  
> **Output:** Lightweight Purposeful Animation System (CSS/Motion) with a11y Protection

---

## Prompt Text

```text
Add a thoughtful animation and micro-interaction system to the application.

The goal is NOT to animate everything.

Animations should communicate:

- State changes
- Navigation
- Hierarchy
- Feedback
- Progress
- Success
- Errors
- Loading
- Relationships between UI elements

Use the application's existing animation library if one exists.

If the project uses React and no animation system exists, evaluate whether Framer Motion/Motion is appropriate before introducing it.

### ADD APPROPRIATE MOTION TO:

- Page transitions
- Modal/dialog entrance and exit
- Dropdowns
- Menus
- Tabs
- Accordions
- Toast notifications
- Button interactions
- Hover states
- Loading states
- Skeletons
- List insertion/removal
- Expand/collapse
- Success states
- Form feedback
- Navigation transitions

### MICRO-INTERACTIONS

Add subtle feedback for:

- Button press
- Hover
- Focus
- Toggle changes
- Copy actions
- Save actions
- Delete confirmation
- Successful operations
- Validation errors

Animations should generally be:

- Short
- Smooth
- Purposeful
- Consistent

Avoid:

- Excessive bouncing
- Huge zoom effects
- Long transitions
- Constant floating animations
- Distracting parallax
- Animating every card independently
- Animations that slow down interaction

### ACCESSIBILITY

Respect:

prefers-reduced-motion

Users who request reduced motion should receive significantly reduced or disabled non-essential animation.

### PERFORMANCE

Avoid animations that cause unnecessary layout recalculation.

Prefer transform/opacity-based animation where possible.

Do not introduce animation libraries simply for one tiny animation.

After implementation, verify performance and responsiveness.
```
