#!/bin/bash
THEMES="$HOME/.local/share/themes"
rm -f "$THEMES/current-theme"
ln -sf "$THEMES/$1" "$THEMES/current-theme"
