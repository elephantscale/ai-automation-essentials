#!/usr/bin/env bash
#
# verify-setup.sh - readiness check for the AI Automation Essentials labs.
#
# Usage:
#   ./labs/verify-setup.sh
#
# Exit code 0 = ready, non-zero = one or more required checks failed.

set -u

if [ -t 1 ]; then G=$'\e[32m'; R=$'\e[31m'; Y=$'\e[33m'; B=$'\e[1m'; N=$'\e[0m'; else G=; R=; Y=; B=; N=; fi
PASS=0; FAIL=0; WARN=0
ok() { printf "  ${G}PASS${N}  %s\n" "$1"; PASS=$((PASS+1)); }
bad() { printf "  ${R}FAIL${N}  %s\n" "$1"; FAIL=$((FAIL+1)); }
warn() { printf "  ${Y}WARN${N}  %s\n" "$1"; WARN=$((WARN+1)); }
head() { printf "\n${B}%s${N}\n" "$1"; }
have() { command -v "$1" >/dev/null 2>&1; }

LABS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$LABS_DIR/.." && pwd)"

printf "${B}AI Automation Essentials - lab readiness check${N}\n"
printf "host: %s   user: %s\n" "$(hostname)" "$(id -un)"

head "1. Browser"
if have google-chrome || have chromium || have chromium-browser || have microsoft-edge || have firefox; then
  ok "modern browser command found"
else
  warn "no common browser command found; participants still need a modern browser"
fi

head "2. Network"
check_url() {
  name="$1"; url="$2"
  if have curl; then
    code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 12 "$url" 2>/dev/null)
    [ "$code" != "000" ] && ok "reach $name (HTTP $code)" || bad "cannot reach $name ($url)"
  elif have python3; then
    python3 - "$url" <<'PY' >/dev/null 2>&1
import ssl, sys, urllib.request, urllib.error
try:
    urllib.request.urlopen(sys.argv[1], timeout=12, context=ssl.create_default_context())
except urllib.error.HTTPError:
    pass
except Exception:
    sys.exit(1)
PY
    [ $? -eq 0 ] && ok "reach $name" || bad "cannot reach $name ($url)"
  else
    warn "curl/python3 unavailable; cannot test $name"
  fi
}
check_url "ChatGPT" "https://chatgpt.com/"

head "3. Course files"
for path in README.md outline.md slides labs course-materials scripts docs; do
  [ -e "$ROOT_DIR/$path" ] && ok "$path exists" || bad "$path missing"
done
for lab in "$LABS_DIR"/[0-9][0-9]-*/README.md; do
  [ -f "$lab" ] && ok "lab guide: $(basename "$(dirname "$lab")")"
done
for asset in lab01-routing-requests.csv sample-support-requests.csv sample-meeting-notes.md sample-help-center.md sample-vendor-invoices.csv sample-dashboard.png; do
  [ -f "$LABS_DIR/assets/$asset" ] && ok "sample asset: $asset" || bad "sample asset missing: $asset"
done

head "Summary"
printf "  ${G}%d passed${N}, ${Y}%d warnings${N}, ${R}%d failed${N}\n" "$PASS" "$WARN" "$FAIL"
if [ "$FAIL" -eq 0 ]; then
  printf "  ${G}${B}Machine looks ready for the AI Automation Essentials labs.${N}\n"
  exit 0
else
  printf "  ${R}${B}Not ready - resolve the FAIL items above.${N}\n"
  exit 1
fi
