#!/bin/bash
SCRIPT_DIR="$HOME/.local/share/qutebrowser/greasemonkey"

dl() {
  local script_path="$SCRIPT_DIR/$1"
  if [ ! -f "$script_path" ]; then
    wget -q -O "$script_path" "$2"
  fi

  printf -- "-- Checking $1..."
  local checksum
  checksum="$(sha256sum "$SCRIPT_DIR/$1" | cut -d " " -f1)"
  if [ ! "$checksum" == "$3" ]; then
    echo "Failed!"
    rm "$script_path"
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
dl "github-code-colors.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-code-colors.user.js" \
  "98f8a6167d19480a3c001da7008f46f9fa17570068f6099308be0e5859b82508"
dl "github-copy-code-snippet.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-copy-code-snippet.user.js" \
  "44fd76d7ee8d9126344b1eafb4a6aace7df4d5b5abc0e6e340d47a0e1563a652"
dl "github-issue-counts.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-issue-counts.user.js" \
  "0826b1c993eaf6d87021d8f32c33c3061d673610c6ee18bc202e33faa5ba055f"
dl "github-issue-comments.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-issue-comments.user.js" \
  "94ed2c9c87caf11ad80fd2f95f8f5803d7d96b384599850693c773f7f071be93"
dl "github-mentioned-links.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-mentioned-links.user.js" \
  "ed9e97a86c49e8e25062ac0cf09ed9be103b3b0579e082a92683b0e2c8abada3"
dl "github-label-color-picker.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-label-color-picker.user.js" \
  "ec964e519d24ea3e4f52fe188bf1b1ce34639c7e3e067a40440ab52969a76468"
dl "github-sort-content.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/github-sort-content.user.js" \
  "1b099a3bb6f989aa2de9d16df27f025b5f9a027d5d52da6b4764352f1b537ec6"
dl "gist-raw-links.user.js" \
  "https://raw.githubusercontent.com/Mottie/GitHub-userscripts/master/gist-raw-links.user.js" \
  "34684058884f4563291210f2a2d8a7ed2ebb7912b9ec84c724683d4185f3260c"
dl "github-json-dependencies-linker.user.js" \
  "https://raw.githubusercontent.com/jerone/UserScripts/master/Github_JSON_Dependencies_Linker/Github_JSON_Dependencies_Linker.user.js" \
  "13ad2096156d9780ef092eeecab77eb4515cf1fd0e42de01f564cb92f6bc4a5a"
dl "github-image-viewer.user.js" \
  "https://raw.githubusercontent.com/jerone/UserScripts/master/Github_Image_Viewer/Github_Image_Viewer.user.js" \
  "a830d077c4bc84f1153f77c8078f6ac868ffdb40b8467aeee0a7cc799c9ce4cf"
dl "general-url-cleaner.user.js" \
  "https://greasyfork.org/scripts/395298-general-url-cleaner/code/General%20URL%20Cleaner.user.js" \
  "a6b8f6cb147f84afab179508e16ecb4bea485857564af8238f4c4df9dc18b8d8"
dl "google-hit-hider.user.js" \
  "https://greasyfork.org/scripts/1682-google-hit-hider-by-domain-search-filter-block-sites/code/Google%20Hit%20Hider%20by%20Domain%20(Search%20Filter%20%20Block%20Sites).user.js" \
  "42144cee9ba6a4476a458e13b3f9b56fafdfe5588324cba5ca4ab7046120e286"
dl "wikichan.user.js" \
  "https://github.com/Dophin2009/wikichan/releases/download/v3.0.1/wikichan.user.js" \
  "aecc6e36347048c5a0adceca94dd40b5c69c4e3cb80e05958b910bd0049ddca3"
