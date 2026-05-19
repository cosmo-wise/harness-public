## DEPOT ASSET CONSTRAINTS

The project uses the Chariot Depot asset registry. These constraints are MANDATORY:

1. **PREFER DEPOT COMPONENTS**: Prioritize using Depot-provided components (Button, TextField, Dialog, Sheet, Tabs, Card, AppShell, Select, Toast) over re-implementing basic UI primitives.

2. **DO NOT INVENT BASE COMPONENTS**: Do not create new base-level UI components (buttons, modals, tabs, etc.) unless no Depot equivalent exists.

3. **TOKEN DISCIPLINE**: Do NOT write raw color hex values, border-radius, or shadow values directly in code. Use the CSS variables provided by Depot tokens: `var(--color-primary-500)`, `var(--spacing-4)`, `var(--radius-md)`, `var(--shadow-sm)`, etc.

4. **PROFILE AWARENESS**: 
   - If the profile is `web-radix`, do NOT output native-only component patterns.
   - If the profile is `universal-nativewind`, do NOT output web-only DOM dependencies.

5. **BLOCK COMPOSITION**: When Depot blocks are available for this project, compose pages from blocks rather than building every page from scratch.

6. **COMPATIBILITY**: Do not combine components from incompatible profiles. Check the compatibility matrix before mixing patterns.

7. **CARRIAGE APP FLOW**: When Harness is invoked by Carriage, treat Carriage's product contract, Depot profile, build-output requirement, and Trial render-audit evidence as runtime gates. Do not downgrade `frontend_app` or `fullstack_axle_app` targets into a package-less static page.
