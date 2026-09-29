#!/usr/bin/env bash
# Double-click this file (or run it) to open a Claude Code session in the
# Megamarket Printshop project. Opens in whatever Terminal app launches it.
cd "$(dirname "$0")" || exit 1

# Prefer claude on PATH; fall back to the known install location.
if command -v claude >/dev/null 2>&1; then
  CLAUDE=claude
else
  CLAUDE="$HOME/.local/bin/claude"
fi

echo "Megamarket Printshop  —  $(pwd)"
echo "Starting Claude Code..."
exec "$CLAUDE"
