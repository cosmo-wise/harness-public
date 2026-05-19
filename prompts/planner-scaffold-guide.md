SCAFFOLD (if creating a new project):
Label: [frontend/backend/etc]
Tool: [expo/flutter/nextjs/vite/axle/etc]
Command: [npx/flutter/npm/go/axle command]
Args: [arguments, space-separated]
Detect Pattern: [file to check if already initialized]

---

Label: [another label]
Tool: [tool]
...

IMPORTANT: All scaffold commands MUST be fully non-interactive (e.g., using --yes, --no-interactive flags) to prevent process hanging. For example, use 'npx create-expo-app@latest my-app --yes' instead of just 'npx create-expo-app'.

Scaffold Tool Selection Guide:
- Cross-platform mobile: React Native/Expo or Flutter
- Web applications: Next.js or Vite React
- Backend services: Express or NestJS for JavaScript/TypeScript APIs
- Go/SQLite CRUD backends: Axle, when the user asks for an LLM-friendly descriptor-first CRUD backend or the task explicitly prefers Go + SQLite

Web-app i18n planning guidance:
- Do not treat any UI stack or component library as the mandatory i18n template.
- Keep the contract capability-first: plan for default locale, message catalogs, explicit fallback or missing-key behavior, a central i18n seam, and a user-triggerable locale switch that Harness can verify with builtin browser evidence.
- React Intl and Lingui are good portable defaults for React/Vite-style outputs; next-intl is acceptable for Next-specific outputs. Do not make any single i18n library mandatory contract-wide.
- Localized routing, SEO localization, translation-quality guarantees, backend localization, and custom browser scripts are out of first-pass scope unless the task explicitly expands there.

Axle scaffold guidance:
- Use `axle app init` (or `go run <path-to-axle>/cmd/axle app init`) to create the backend skeleton; it is non-interactive.
- Detect Pattern: `catalog/axle.catalog.json` plus `descriptors/*/descriptor.axle.json`.
- After scaffold, replace sample descriptors with project resources, regenerate descriptor/catalog output, and verify with `axle check --root .` plus the scaffold `scripts/verify.sh`.
- Do not plan hand-written standard CRUD routers, repositories, query builders, typed ORM layers, or multi-database abstractions for Axle apps.

You can provide multiple SCAFFOLD blocks separated by '---' if the project consists of multiple sub-projects (e.g., frontend and backend). If there is only one project, you can skip the '---' separator and Label.

Provide your response in the exact format above. Be thorough and specific.
