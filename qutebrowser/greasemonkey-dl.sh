#!/bin/bash
SCRIPT_DIR="$XDG_DATA_HOME/qutebrowser/greasemonkey"

dl() {
  local script_path="$SCRIPT_DIR/$1"
  if [ ! -f "$SCRIPT_DIR/$1" ]; then
    wget -q -O "$SCRIPT_DIR/$1" "$2"
  fi

  printf -- "-- Checking $1..."
  local checksum="$(sha256sum "$SCRIPT_DIR/$1" | cut -d " " -f1)"
  if [ ! "$checksum" == "$3" ]; then
    echo "Failed!"
    rm "$SCRIPT_DIR/$1"
  else
    echo "OK"
  fi
}

dl "4chan-x.user.js" \
  "https://www.4chan-x.net/builds/4chan-X.user.js" \
  "b413372c878e174bffc3a098405c769bbfd58c4f06f0f18eca1265bf6e0d29c4"
dl "oneechan.user.js" \
  "https://raw.githubusercontent.com/KevinParnell/OneeChan/master/builds/OneeChan.user.js" \
  "9ba024493c392d978fc59e0ece8fa2d80703a1e6faca1157c98cd0e262a7d509"
dl "mouseover-image-viewer.user.js" \
  "https://greasyfork.org/scripts/404-mouseover-popup-image-viewer/code/Mouseover%20Popup%20Image%20Viewer.user.js" \
  "dd5dcd198ba84167d8e1390061df91ec4b3ea7a14828618a1caf510d4dec1a0f"
