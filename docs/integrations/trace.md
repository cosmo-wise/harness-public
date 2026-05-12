# Harness + Trace Integration

Harness uses the Trace CLI to capture execution evidence during runs.

## Setup

```bash
pip install trace
```

## Evidence Flow

1. Harness starts a trace run at the beginning of each harness run
2. Each phase (plan, generate, evaluate, audit) records events and artifacts
3. Harness finalizes the trace run with the overall status
4. Compass and Stirrup consume the trace summary for display and governance

## Commands Used

```bash
trace start --run-id <id> --out <dir>
trace event --run <dir> --module harness --phase <phase> --type <type>
trace artifact --run <dir> --module harness --phase <phase> --path <path>
trace finalize --run <dir> --status <status>
```
