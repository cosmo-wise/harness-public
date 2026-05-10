# Boundaries

`harness-public` is a public surface repo, not the private Harness core repository.

## Public Surface

This repo is expected to carry:

- examples
- issue intake
- public configuration guidance
- public roadmap and support policy

## Private Surface

The private `harness` repo continues to own:

- core CLI/runtime implementation
- private agent wiring
- internal evaluator strategy
- private prompt assets and internal governance logic

## Why The Split Exists

The split lets external users:

- file issues in a stable public place
- reference documented configs and examples
- track roadmap and release-facing notes

without forcing the private core runtime to be open before the product boundary is ready.
