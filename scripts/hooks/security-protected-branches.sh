#!/usr/bin/env bash
set -e

source .security-branches.env

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "🔍 Security checks for branch: $CURRENT_BRANCH"

if [[ "$CURRENT_BRANCH" =~ $PROTECTED_BRANCHES ]]; then
  echo "⚠️ Protected branch detected"

  echo "🔒 Running full Gitleaks scan"
  gitleaks detect --verbose

  echo "🔍 Running Semgrep"
  semgrep --config=auto --error

else
  echo "ℹ️ Not a protected branch — skipping heavy scans"
fi

