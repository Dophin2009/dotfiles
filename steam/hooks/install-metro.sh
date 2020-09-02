#!/bin/bash
SKINS_DIR="$XDG_DATA_HOME/Steam/skins"
SKINS_DIR_METRO="$SKINS_DIR/metro-for-steam-4.4"
METRO_ZIP="$SKINS_DIR/metro-for-steam-4.4.zip"
METRO_PATCH="$SKINS_DIR/metro-for-steam-4.4-patch"

mkdir -p "$SKINS_DIR"
wget -O "$METRO_ZIP" "https://github.com/minischetti/metro-for-steam/archive/v4.4.zip" >/dev/null 2>&1
unzip -o "$METRO_ZIP" -d "$SKINS_DIR" >/dev/null 2>&1
rm "$METRO_ZIP"

git clone "https://github.com/redsigma/UPMetroSkin.git" "$METRO_PATCH" >/dev/null 2>&1
cp -r "$METRO_PATCH/Unofficial 4.x Patch/Main Files [Install First]"/* "$SKINS_DIR_METRO"
rm -rf "$METRO_PATCH"
