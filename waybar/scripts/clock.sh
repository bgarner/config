#!/bin/bash

state_file="$HOME/.cache/waybar-clock-mode"

if [[ -f "$state_file" ]] && [[ $(<"$state_file") == "week" ]]; then
  date '+  Week %V'
else
  date '+%-I:%M %p    %A, %B %-d'
fi
