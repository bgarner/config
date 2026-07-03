#!/bin/bash

state_file="$HOME/.cache/waybar-clock-mode"

if [[ -f "$state_file" ]] && [[ $(<"$state_file") == "week" ]]; then
  printf 'normal\n' >"$state_file"
else
  printf 'week\n' >"$state_file"
fi

pkill -RTMIN+6 waybar
