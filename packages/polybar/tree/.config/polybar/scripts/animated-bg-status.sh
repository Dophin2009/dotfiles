#!/bin/bash

cache_dir="$XDG_CACHE_HOME/wallpaper"
pid_file="$cache_dir/animated_pid"
toggle_file="$cache_dir/toggled"

if [[ -f "$toggle_file" ]]; then
  read -d $'\0x4' toggle <"$toggle_file"
  if [[ $toggle == 1 ]]; then
    echo ""
  else
    echo ""
  fi
else
  echo ""
fi
