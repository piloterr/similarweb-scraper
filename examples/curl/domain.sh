#!/usr/bin/env bash
# SimilarWeb Domain API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./domain.sh
set -euo pipefail

curl -sS --fail-with-body -G "https://api.piloterr.com/v2/similarweb/domain" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=google.com
