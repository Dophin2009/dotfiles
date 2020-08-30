#!/bin/bash
# restart dunst
echo "restarting dunst..."
pkill dunst
dunst &
