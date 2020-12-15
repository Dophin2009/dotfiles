#!/bin/zsh

# Load sh config
. "$XDG_CONFIG_HOME/sh/rc"

# Load utility functions
. "$XDG_CONFIG_HOME/sh/util"

# Load zsh package envs
shload "env.zsh" "$XDG_CONFIG_HOME/zsh"
shload "rc.zsh" "$XDG_CONFIG_HOME/zsh"

# Unload utility functions
unsetutil

# Traverse up the filesystem n times
up() {
  LIMIT=$1
  LIMIT=${LIMIT:-1}
  P=$PWD
  for ((i = 1; i <= LIMIT; i++)); do
    P=$P/..
  done
  cd $P
}
