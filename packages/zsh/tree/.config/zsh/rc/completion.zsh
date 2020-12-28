#!/bin/zsh

# auto pairs
zinit light hlissner/zsh-autopair

# fzf tab
zinit light Aloxaf/fzf-tab

# OMZ git plugin
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh

# syntax highlighting, autosuggestions, completions plugins
zinit wait silent for \
  atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' \
    zdharma/fast-syntax-highlighting \
  atload'!_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
  blockf \
    zsh-users/zsh-completions

# disable sort when completing options of any command
zstyle ':completion:complete:*:options' sort false

# pass default opts to fzf-tab
zstyle ':fzf-tab:complete:*' fzf-flags ${=FZF_DEFAULT_OPTS}

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input

# preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
  'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# preview of directory by exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -a -1 --color=always $realpath'

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

zstyle ':completion:*:*:*:default' menu yes select search
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
