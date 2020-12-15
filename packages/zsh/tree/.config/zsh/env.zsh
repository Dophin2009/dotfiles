#!/bin/zsh

# Load sh config
. "$XDG_CONFIG_HOME/sh/env"

# Load utility functions
. "$XDG_CONFIG_HOME/sh/util"

# Load zsh package envs
shload "env.zsh" "$XDG_CONFIG_HOME/zsh"

# Unload utility functions
unsetutil
