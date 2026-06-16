#!/usr/bin/env bash
# Fails if line coverage in coverage/lcov.info is below the threshold.
# Excludes generated files from the denominator.
set -euo pipefail

THRESHOLD="${1:-80}"
LCOV="coverage/lcov.info"

if [[ ! -f "$LCOV" ]]; then
  echo "✗ $LCOV not found. Run: flutter test --coverage"
  exit 1
fi

# Strip generated artifacts so they don't dilute the metric.
filtered=$(grep -vE 'SF:.*(\.g\.dart|\.freezed\.dart|\.config\.dart|/generated/)' "$LCOV" || true)

total=$(printf '%s\n' "$filtered" | grep -c '^DA:' || true)
hit=$(printf '%s\n' "$filtered" | grep '^DA:' | grep -vc ',0$' || true)

if [[ "$total" -eq 0 ]]; then
  echo "✗ No coverage data found."
  exit 1
fi

pct=$(awk "BEGIN { printf \"%.2f\", ($hit/$total)*100 }")
echo "Coverage: ${pct}% (${hit}/${total} lines) — threshold ${THRESHOLD}%"

below=$(awk "BEGIN { print ($pct < $THRESHOLD) ? 1 : 0 }")
if [[ "$below" -eq 1 ]]; then
  echo "✗ Coverage below threshold."
  exit 1
fi
echo "✓ Coverage meets threshold."
