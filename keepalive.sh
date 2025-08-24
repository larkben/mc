#!/usr/bin/env bash
set -euo pipefail

# Start the vanilla entrypoint in the background
/start &
MC_PID=$!

# On exit, clean up
trap 'kill $MC_PID 2>/dev/null || true; wait $MC_PID 2>/dev/null || true' TERM INT

# Every 60s: if players online (via RCON `list`), make a tiny outbound request.
# That outbound ping keeps Railway from sleeping mid-session.
(
  while sleep 60; do
    if rcon-cli --password "${RCON_PASSWORD:-changeme}" list 2>/dev/null \
       | grep -qE 'There are [1-9]'; then
      curl -m 2 -s https://1.1.1.1 >/dev/null 2>&1 || true
    fi
  done
) &

# Wait on the MC process
wait $MC_PID
