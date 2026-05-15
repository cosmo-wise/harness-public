#!/usr/bin/env bash
# Redaction safety check — verify no private/credential data
# leaked into harness-public content before publishing.
# Run from the harness-public repo root.

set -euo pipefail

EXIT_CODE=0
PATTERNS=(
  # Credentials & secrets
  '-----BEGIN.*PRIVATE KEY-----'
  'api[_-]?key["\s:=]+["\s]?[A-Za-z0-9_\-]{20,}'
  'token["\s:=]+["\s]?ghp_[A-Za-z0-9]{36}'
  'password["\s:=]+["\s]?["\''\w]'
  # Internal hostnames / IPs
  '\.internal\.cosmo-wise\.com'
  '192\.168\.\d{1,3}\.\d{1,3}'
  '10\.\d{1,3}\.\d{1,3}\.\d{1,3}'
  # Customer names (partial regex — extend as needed)
  '\b(customer|client|partner)[_ ]name\b'
)

echo "=== Harness-Public Redaction Check ==="
echo ""

for pattern in "${PATTERNS[@]}"; do
  matches=$(grep -rn "$pattern" docs/ examples/ configs/ --include='*.md' --include='*.json' --include='*.yaml' 2>/dev/null || true)
  if [ -n "$matches" ]; then
    echo "❌ POTENTIAL LEAK: pattern '$pattern' found:"
    echo "$matches"
    echo ""
    EXIT_CODE=1
  fi
done

if [ $EXIT_CODE -eq 0 ]; then
  echo "✅ No redaction issues detected."
else
  echo "⚠️  Review findings above before publishing."
fi
echo ""

exit $EXIT_CODE
