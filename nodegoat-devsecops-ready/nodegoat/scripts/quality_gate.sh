#!/bin/bash

echo "Checking quality gate..."

if grep -q "ERROR" semgrep-report.txt; then
  echo "Semgrep vulnerabilities found"
  exit 1
fi

echo "Quality gate passed"
