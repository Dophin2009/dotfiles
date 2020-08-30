#!/bin/bash
echo "linking gtk theme"
rm -f "$XDG_DATA_HOME/themes/current-theme"
ln -sf "$XDG_DATA_HOME/themes/$1" "$XDG_DATA_HOME/themes/current-theme"
