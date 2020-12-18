#!/bin/zsh

local HERE="$(dirname "${(%):-%N}")"
local CORE="$HERE/rc"

# Load shared components
. "$HERE/shared.zsh"

# Load zinit
declare -A ZINIT
ZINIT_HOME="$ZSH_DATA/zinit"
ZINIT[HOME_DIR]="$ZINIT_HOME"
ZINIT[BIN_DIR]="$ZINIT_HOME/bin"
ZINIT[ZCOMPDUMP_PATH]="$ZSH_CACHE/zcompdump-$ZSH_VERSION"
if [[ ! -f "$ZINIT_HOME/bin/zinit.zsh" ]]; then
  command mkdir -p "$ZINIT_HOME"
  command git clone "https://github.com/zdharma/zinit" "$ZINIT_HOME/bin"
  zcompile "$ZINIT_HOME/bin/zinit.zsh"
fi
source "$ZINIT_HOME/bin/zinit.zsh"

# Load core components
. "$CORE/theme.zsh"
. "$CORE/opts.zsh"
. "$CORE/completion.zsh"
. "$CORE/navigation.zsh"
. "$CORE/misc.zsh"
. "$CORE/keybindings.zsh"
. "$CORE/macros.zsh"

# Load manual plugins
. "$XDG_CONFIG_HOME/sh/util"
shload "env.zsh" "$XDG_CONFIG_HOME/zsh"
shload "rc.zsh" "$XDG_CONFIG_HOME/zsh"
unsetutil
