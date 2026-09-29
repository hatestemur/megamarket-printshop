#!/usr/bin/env bash
# Launch the Megamarket Printshop app: serve it locally and open it in the browser.
set -euo pipefail

PORT="${1:-8753}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
URL="http://localhost:${PORT}/index.html"

# If something is already serving on this port, just open the browser.
if curl -s -o /dev/null "http://localhost:${PORT}/index.html"; then
  echo "Server already running on port ${PORT}."
else
  echo "Starting server on port ${PORT}..."
  (cd "$DIR" && python3 -m http.server "$PORT" >/tmp/megamarket-printshop-server.log 2>&1 &)
  # Wait for the server to come up (up to ~5s).
  for _ in $(seq 1 25); do
    if curl -s -o /dev/null "$URL"; then break; fi
    sleep 0.2
  done
fi

echo "Opening ${URL}"
open "$URL"
