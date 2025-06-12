#!/usr/bin/env bash
set -euo pipefail

BASE_URL="http://172.188.80.68/mcp1"
LOGFILE="./logs/quote_mcp_timeline.log"
STEP_DELAY=5

timestamp(){ date '+%Y-%m-%d %H:%M:%S'; }

run_and_wait(){
  local METHOD=$1 ENDPOINT=$2
  echo "[$(timestamp)] → $METHOD ${BASE_URL}${ENDPOINT}" | tee -a "$LOGFILE"
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" \
    -X "$METHOD" "${BASE_URL}${ENDPOINT}" \
    -H "Content-Type: application/json")
  echo "    ↳ HTTP $HTTP_CODE" | tee -a "$LOGFILE"
  echo "    ↳ sleeping ${STEP_DELAY}s…" | tee -a "$LOGFILE"
  sleep "$STEP_DELAY"
}

echo "=== Pipeline start: $(timestamp) ===" >> "$LOGFILE"

run_and_wait POST /quotes/scrape-from-db
run_and_wait POST /generate/structure
run_and_wait POST /images/batch-author-images
run_and_wait POST /azure/submit-batch
run_and_wait POST /merge_text/merge-textual-data
run_and_wait POST /match/match-alt-text
run_and_wait POST /resizer/generate-resized-urls
run_and_wait POST /distribute/distribute-urls
run_and_wait POST /videometa/video-meta
run_and_wait POST /metadata/generate-metadata
run_and_wait POST /rotate/rotate-metadata
run_and_wait POST /reorder/reorder

echo "=== Pipeline end:   $(timestamp) ===" >> "$LOGFILE"
echo "" >> "$LOGFILE"
