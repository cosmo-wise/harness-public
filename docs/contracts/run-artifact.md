# Harness Run Artifact Contract

This document describes the public contract for harness run artifacts.
See `schemas/run-manifest-1.0.json` in the harness repo for the JSON Schema.

## Run Directory Layout

```
.harness/
  run.json              # Run manifest (status, phases, timestamps)
  phases/
    plan/
    generate/
    evaluate/
    audit/
  trace/                # Trace evidence directory
```

## Status Values

- `pending` — Run created but not started
- `running` — Run in progress
- `suspended` — Run paused (awaiting approval)
- `approved` — Run approved by human
- `rejected` — Run rejected by human
- `passed` — Run completed successfully
- `failed` — Run completed with failures
- `error` — Run encountered an unrecoverable error
