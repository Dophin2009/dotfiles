#!/usr/bin/bash
engine=$(ibus engine)
case "$engine" in
  "xkb:us::eng")
    echo "EN"
    ;;
  "mozc-jp")
    echo "JP"
    ;;
esac
