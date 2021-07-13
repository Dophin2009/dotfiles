#!/bin/zsh

# save history in cache
export HISTSIZE=290000
export SAVEHIST=290000
export HISTFILE="$ZSH_CACHE/history"

# comments in interactive code
setopt INTERACTIVE_COMMENTS
# expand parameters, commands, etc.
setopt PROMPT_SUBST
# no c-s/c-q output freezing
setopt NO_FLOW_CONTROL
# do not write duplicates to history
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
# save each command's beginning timestamp and the duration to the history file
setopt EXTENDED_HISTORY
# completion within words
setopt COMPLETE_IN_WORD
# autocontinue suspended process on disown
setopt AUTO_CONTINUE
# match hidden files without specify dot
setopt GLOBDOTS
# share new history across active zsh sessions
# setopt sharehistory

# enable colors
autoload -Uz colors
colors

# enable url magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# enable version control info
autoload -Uz vcs_info

# faster visual mode switching
export KEYTIMEOUT=1
