#!/bin/zsh

# Load sh config
. "$HOME/.config/sh/env"

# Set base directories
ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
ZSH_DATA="$XDG_DATA_HOME/zsh"
ZSH_CACHE="$XDG_CACHE_HOME/zsh"
if [[ ! -d "$ZSH_DATA" ]]; then
	mkdir -p "$ZSH_DATA"
fi
if [[ ! -d "$ZSH_CACHE" ]]; then
	mkdir -p "$ZSH_CACHE"
fi
