#!/bin/bash
echo "setting wallpaper..."
ln -sf "$1" "$XDG_CONFIG_HOME/wallpapers/still.jpg"
wallpaper-ctl kill
