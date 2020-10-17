###
### PREAMBLE
###

# source environment
source "$HOME/.config/zsh/env"
# open tmux by default
[[ $TERM != "screen-256color" ]] && exec tmux
# enable p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


###
### ENVIRONMENT
###

ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
ZSH_DATA="$XDG_DATA_HOME/zsh"
ZSH_CACHE="$XDG_CACHE_HOME/zsh"

if [[ ! -d "$ZSH_DATA" ]]; then
  command mkdir -p "$ZSH_DATA"
fi
if [[ ! -d "$ZSH_CACHE" ]]; then
  command mkdir -p "$ZSH_CACHE"
fi


###
### OPTIONS
###

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

###
### PLUGINS
###

### ZINIT

# zinit variables
declare -A ZINIT
ZINIT_HOME="$ZSH_DATA/zinit"
ZINIT[HOME_DIR]="$ZINIT_HOME"
ZINIT[BIN_DIR]="$ZINIT_HOME/bin"
ZINIT[ZCOMPDUMP_PATH]="$ZSH_CACHE/zcompdump-$ZSH_VERSION"

# bootstrap zinit
if [[ ! -f "$ZINIT_HOME/bin/zinit.zsh" ]]; then
  command mkdir -p "$ZINIT_HOME"
  command git clone "https://github.com/zdharma/zinit" "$ZINIT_HOME/bin"
  zcompile "$ZINIT_HOME/bin/zinit.zsh"
fi
source "$ZINIT_HOME/bin/zinit.zsh"

### NAVIGATION

# z.lua
export _ZL_DATA="$ZSH_DATA/.zlua"
zinit light skywind3000/z.lua

### SYNTAX

# auto pairs
zinit light hlissner/zsh-autopair

### TIPS

# command not found
zinit light Tarrasch/zsh-command-not-found

# fast alias tips
zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

### MISCELLANEOUS

# auto-notify
zinit light MichaelAquilina/zsh-auto-notify

# autoswitch-virtualenv
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# autoswitch poetry
zinit light darvid/zsh-poetry


###
### COMPLETIONS
###

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

# use input as query string when completing zlua
zstyle ':fzf-tab:complete:_zlua:*' query-string input

# preview of commandline arguments when completing `kill`
local extract="
# trim input(what you select)
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# preview of directory by exa when completing cd
zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always $realpath'

# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# various completions
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:*:*:default' menu yes select search
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


###
### KEYBINDS
###

# history-substring-search
zinit light zsh-users/zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=white,bold,underline"
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

typeset -g -A key

# terminfo key binds
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# normal insert mode keybindings
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        history-substring-search-up
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      history-substring-search-down
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# visual mode keybindings
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward


###
### THEME
###

# powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# window title
precmd () {
  vcs_info
  print -Pn "\e]0; %~\a"
}
preexec () {
  print -Pn "\e]0;%~ $1\a"
}

# source p10k
if [[ -f "$ZSH_CONFIG/p10k.zsh" ]]; then
  source "$ZSH_CONFIG/p10k.zsh"
fi
