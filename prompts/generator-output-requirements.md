## CRITICAL: Output Requirements
After completing your tasks, provide a summary of your work EXACTLY in this JSON format.
The "status" field is MANDATORY and must be one of the following:

- `DONE`: All assigned tasks for the sprint are completed, tested, and ready for evaluation.
- `DONE_WITH_CONCERNS`: All assigned tasks are completed, but there are minor issues or concerns (e.g., potential edge cases, minor bugs, or design compromises). You MUST also provide a "concerns" field with a detailed description.
- `NEEDS_CONTEXT`: The generator cannot proceed without additional information or clarification from the user or orchestrator. This is for when the task is ambiguous or missing crucial details.
- `BLOCKED`: The generator is completely blocked from proceeding due to external factors (e.g., missing dependencies that cannot be installed, an API that is down, or a fundamental architectural decision that needs human intervention).

The "concerns" field is OPTIONAL and should ONLY be provided if the status is `DONE_WITH_CONCERNS`.
The `verificationEvidence` field is OPTIONAL but strongly preferred whenever you ran concrete validation commands. Use it to report structured test/typecheck/build evidence instead of burying validation claims only inside free-form summary text.
When the task changes runtime or governance behavior, also include `verificationEvidence.runtimeWiring` with explicit booleans for `importVerified`, `instantiationVerified`, and `invocationVerified`. Reuse the normal test evidence for integration coverage, and optionally provide `integrationTestVerified` / `integrationTestCommand` when you ran a specific end-to-end command.
Status ledgers such as `output/plan/TODO/90-STATUS.md` are low-trust bookkeeping only. Do not use them as proof of implementation or verification success, and do not update them until real validation has passed.

For web-app i18n / locale / multilingual tasks, do not claim completion from locale JSON files, message dictionaries, or a language toggle alone. Your summary and verification evidence must make it easy for evaluation to find all of the following:
- where the default locale is declared,
- where message catalogs are registered or resolved,
- where fallback or missing-key behavior is configured,
- where the central i18n seam is wired into the running app,
- and what browser-visible locale-switch proof exists.

For Axle Go/SQLite CRUD backend tasks, `verificationEvidence.commands` MUST include concrete Axle workflow evidence when those commands were applicable: scaffold (`axle app init` or `go run <path-to-axle>/cmd/axle app init`), descriptor generation (`axle gen`), catalog generation (`axle catalog gen`), architecture check (`axle check --root .`), and the generated backend `scripts/verify.sh`. Do not claim Axle completion by hand-writing standard CRUD routers, repositories, query builders, typed ORM layers, or multi-database abstractions; those are framework-owned/generated concerns.

Example:
```json
{
  "summary": "Implemented the user authentication module and added unit tests. All tests pass.",
  "files": [
    "src/auth/auth.controller.ts",
    "src/auth/auth.service.ts",
    "tests/auth.service.test.ts"
  ],
  "status": "DONE",
  "verificationEvidence": {
    "testsSucceeded": true,
    "runtimeWiring": {
      "importVerified": true,
      "instantiationVerified": true,
      "invocationVerified": true,
      "integrationTestCommand": "npm test"
    },
    "commands": [
      {
        "command": "npm test",
        "category": "tests",
        "status": "passed",
        "summary": "12 passed"
      }
    ]
  }
}
```

Example with concerns:
```json
{
  "summary": "Implemented the user profile page. Some minor styling issues remain that require further design input.",
  "files": [
    "src/user/profile.tsx",
    "src/user/profile.css"
  ],
  "status": "DONE_WITH_CONCERNS",
  "concerns": "The profile picture upload component has a slight alignment issue on smaller screens, and the color scheme needs final approval from the UX team."
}
```
