#!/usr/bin/env bash
# Sync redacted content from private harness repo to harness-public.
# Run from the harness-public repo root.

set -euo pipefail

PRIVATE_HARNESS="${PRIVATE_HARNESS:-../harness}"
REDACT_CHECK="${REDACT_CHECK:-./scripts/redact-check.sh}"

echo "=== Syncing redacted content from ${PRIVATE_HARNESS} ==="

# Sync docs/contracts (public contracts)
if [ -d "${PRIVATE_HARNESS}/docs/contracts" ]; then
  cp -r "${PRIVATE_HARNESS}/docs/contracts/" docs/contracts/
  echo "  -> docs/contracts/ synced"
fi

# Sync redacted examples
if [ -d "${PRIVATE_HARNESS}/examples/redacted" ]; then
  cp -r "${PRIVATE_HARNESS}/examples/redacted/" examples/redacted-configs/
  echo "  -> examples/redacted-configs/ synced"
fi

# Run redaction check
if [ -f "${REDACT_CHECK}" ]; then
  echo "=== Running redaction check ==="
  bash "${REDACT_CHECK}"
fi

echo "=== Sync complete ==="
