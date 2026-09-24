#!/usr/bin/env bash
# Deploy the Chico State CIM site to Vercel (review link for Blue Flamingo).
# Mirrors ~/dev/arvin-measure. Scope: syronius-projects. Project: chico-cim.
# The site is noindex (vercel.json X-Robots-Tag) until the client goes live.
set -euo pipefail
cd "$(dirname "$0")"
vercel --prod --yes
echo "--- verify ---"
URL="$(vercel ls chico-cim --scope syronius-projects 2>/dev/null | grep -o 'https://[^ ]*' | head -1 || true)"
if [ -n "$URL" ]; then
  curl -s -o /dev/null -w "$URL -> %{http_code}\n" "$URL"
fi
