#!/usr/bin/env bash
set -e

echo "🔒 Gitleaks (changed files only)"

# Scan staged changes
gitleaks protect --staged --verbose

