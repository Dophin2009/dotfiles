#!/bin/zsh

# z.lua
# export _ZL_DATA="$ZSH_DATA/.zlua"
# zinit light skywind3000/z.lua

# zoxide
export _ZO_DATA_DIR="$ZSH_DATA/zoxide"
zinit light ajeetdsouza/zoxide

# autoswitch-virtualenv
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# autoswitch poetry
zinit light darvid/zsh-poetry

# auto source env files
zinit light Tarrasch/zsh-autoenv
export AUTOENV_FILE_ENTER=".autoenv.zsh"
export AUTOENV_FILE_LEAVE=".autoenv.exit.zsh"
