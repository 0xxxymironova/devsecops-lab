#!/bin/bash

mkdir -p reports

docker run --rm         --network host         -v $(pwd)/reports:/zap/wrk/:rw         zaproxy/zap-stable zap-baseline.py         -t http://nodegoat:4000         -r zap-report.html

EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
  echo "ZAP FOUND VULNERABILITIES"
  exit 1
fi
