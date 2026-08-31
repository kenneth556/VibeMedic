# Prompt 03: Interactive UI Functionality Audit

> **Stage 1 — Diagnose**  
> **Target:** Buttons, forms, toggles, dropdowns, modals, CRUD triggers, handlers  
> **Output:** Interactive Element Inventory, Broken Handler Fixes & Verification

---

## Prompt Text

```text
Now perform a COMPLETE audit of every interactive UI element in the application.

Inspect the ENTIRE codebase and identify every:
- Button
- Icon button
- Link
- Dropdown
- Select
- Checkbox
- Toggle
- Switch
- Tab
- Modal trigger
- Form
- Submit action
- Search field
- Filter
- Pagination control
- Menu item
- Navigation item
- CRUD action
- Delete action
- Edit action
- Save action
- Cancel action
- Confirmation action
- Upload action
- Download action
- Copy action
- Notification action

For each interactive element, verify that it is actually connected to working functionality.

Look specifically for:
- Buttons with no onClick/action
- Empty event handlers
- Buttons that only show a toast but do nothing
- Toggles that visually change but don't persist their state
- Toggles whose state isn't connected to backend/database data
- Forms that don't submit
- Forms that submit but don't save data
- Delete buttons that don't actually delete
- Edit buttons that don't actually update
- Save buttons that don't persist changes
- Links pointing to nonexistent routes
- Navigation items leading nowhere
- Modals that cannot properly open/close
- Search that doesn't actually search
- Filters that don't affect the displayed data
- Pagination that doesn't change data
- Dropdowns that don't affect application state
- Checkboxes whose values aren't used
- Disabled buttons that should be functional
- Loading states that never resolve
- Success messages shown even when an operation failed
- Error states that aren't handled
- UI state that gets reset incorrectly
- Actions connected to the wrong API/database operation

Trace each important interaction all the way through:

UI → handler → service/API → backend → database → response → UI state.

Do not assume an interaction works because an event handler exists.

Fix every broken interaction you can verify from the code.

Do not create fake functionality just to make buttons appear functional.

After fixing:
- Run type checking
- Run linting
- Run tests
- Build the application

Report all interactions checked, broken interactions found, fixes made, and anything requiring manual browser testing.
```
