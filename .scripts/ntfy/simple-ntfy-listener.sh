#!/usr/bin/env bash
set -o pipefail

topic="$1"

while true; do
  echo "[ntfy] connecting..." >&2

  while IFS=$'\t' read -r t msg; do
    notify-send "ntfy: $t" "$msg"
  done < <(
    websocat --ping-interval 25 --ping-timeout 40 --exit-on-eof --basic-auth-file="$HOME/.config/ntfy/credentials" \
      "wss://ntfy.shork.ch/$topic/ws" \
    | stdbuf -oL jq -r 'select(.event=="message") | "\(.topic)\t\(.message)"'
  )

  status=$?
  echo "[ntfy] disconnected (exit $status), retrying in 3s..." >&2
  sleep 40
done
