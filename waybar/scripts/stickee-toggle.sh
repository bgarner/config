#!/bin/bash

set -euo pipefail

is_running() {
  pgrep -x stickee >/dev/null
}

status() {
  if is_running; then
    printf '{"text":"󰎞","class":"active","tooltip":"Stickee running"}\n'
  else
    printf '{"text":"󰎞","class":"inactive","tooltip":"Start Stickee"}\n'
  fi
}

toggle() {
  if is_running; then
    pkill -x stickee
  else
    uwsm-app -- stickee >/dev/null 2>&1 &
  fi

  pkill -RTMIN+11 waybar 2>/dev/null || true
}

case "${1:-status}" in
  status) status ;;
  toggle) toggle ;;
  *) exit 2 ;;
esac
