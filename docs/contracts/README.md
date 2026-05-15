# Chariot Public Contracts

This directory documents the stable public contracts that downstream
tools and integrations can depend on. These contracts are versioned
and maintained across releases.

## Contract Index

| Contract | Source | Version | Description |
|----------|--------|---------|-------------|
| Harness Planning Context | `course/schemas` | v1 | Full planning artifact consumed by Harness |
| Trace Evidence Summary | `trace/schemas` | v1 | Evidence protocol summary for downstream display |
| Trial Audit Report | `trial/schemas` | v1 | Browser acceptance audit results |
| Compass Run Summary | `compass/schemas` | v1 | Run results for customer portal display |
| Stirrup Repair Order | `stirrup/schemas` | v1 | Cross-module repair and governance |

## Stability Guarantees

- **v1 contracts**: Stable. New fields may be added but existing
  fields will not be removed or change type.
- **Breaking changes**: Will be released as a new major version
  (v2, v3) with migration guides.
- **Deprecation**: Fields marked deprecated will be removed after
  at least one major version transition period.

## Using Contracts

### TypeScript
```typescript
import type { HarnessPlanningContext } from "course/schemas";
```

### JSON Schema
```json
{
  "$ref": "https://chariot.cosmo-wise.com/schemas/course/harness-planning-context-v1.json"
}
```
