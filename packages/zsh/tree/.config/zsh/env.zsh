#!/bin/zsh

local HERE="$(dirname "${(%):-%N}")"
local CORE="$HERE/core"

# Load shared components
. "$HERE/shared.zsh"

# Load manual plugins
. "$XDG_CONFIG_HOME/sh/util"
shload "env.zsh" "$XDG_CONFIG_HOME/zsh"
unsetutil
