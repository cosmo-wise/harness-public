# harness-public

`harness-public` is the public-facing surface for Harness.

This repo exists so external users have one stable place for:

- issues and feature requests
- public examples and sample task configs
- public-facing docs, roadmap, and support policy
- redacted or stabilized configuration guidance

It intentionally does **not** contain the private Harness core runtime, internal evaluator strategy, or private prompt assets.

## Layout

```text
harness-public/
├── .github/ISSUE_TEMPLATE/   # public issue intake
├── configs/                  # public config guidance
├── docs/                     # boundaries, roadmap, support-facing docs
└── examples/                 # public sample configs and tasks
```

## What Belongs Here

- reproducible public examples
- example task configs that help users report issues
- public compatibility notes
- roadmap and change communication
- support and contributing guidance

## What Does Not Belong Here

- private Harness runtime implementation
- sensitive internal prompt fragments
- customer-specific artifacts
- internal-only operations and evaluation logic

## Publishing Note

This local workspace repo is the intended source for a future public GitHub repository. The remote is intentionally not configured yet inside `repos.yaml`; wire it up when the public repository is actually created.
