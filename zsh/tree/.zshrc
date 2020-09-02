### environment
source "$HOME/.config/zsh/env"

# open tmux by default
[[ $TERM != "screen-256color" ]] && exec tmux

# enable p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### zsh configuration home
ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"

ZSH_DATA="$XDG_DATA_HOME/zsh"
if [[ ! -d "$ZSH_DATA" ]]; then
  command mkdir -p "$ZSH_DATA"
fi

ZSH_CACHE="$XDG_CACHE_HOME/zsh"
if [[ ! -d "$ZSH_CACHE" ]]; then
  command mkdir -p "$ZSH_CACHE"
fi

# save history in cache
export HISTSIZE=290000
export SAVEHIST=290000
export HISTFILE="$ZSH_CACHE/history"

### macros / aliases
# change directory on demand after exiting ranger
function ranger {
  local IFS=$'\t\n'
  local tempfile="$(mktemp -t tmp.XXXXXX)"
  local ranger_cmd=(
    command
    ranger
    --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
  )

  ${ranger_cmd[@]} "$@"
  if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
    cd -- "$(cat "$tempfile")" || return
  fi
  command rm -f -- "$tempfile" 2>/dev/null
}

### setopts
# comments in interactive code
setopt interactivecomments
# no c-s/c-q output freezing
setopt noflowcontrol
# save each command's beginning timestamp and the duration to the history file
setopt extendedhistory
# share new history across active zsh sessions
# setopt sharehistory
# completion within words
setopt completeinword

### autoloads
autoload -Uz colors
colors

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz vcs_info

### zstyles
# case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# various completions
zstyle ":completion:*:descriptions" format "%B%d%b"

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:*:*:default' menu yes select search
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### keybinds
typeset -g -A key

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

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
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

### window title
precmd () {
  vcs_info
  print -Pn "\e]0; %~\a"
}
preexec () {
  print -Pn "\e]0;%~ $1\a"
}

### zinit
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

# source zinit
source "$ZINIT_HOME/bin/zinit.zsh"

### theme
# OMZ git library
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
# load theme from OMZ
setopt promptsubst
# zinit snippet OMZ::themes/dieter.zsh-theme

# powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

### load plugins

# auto-notify
AUTO_NOTIFY_IGNORE+=("ranger")
zinit light MichaelAquilina/zsh-auto-notify

# autoswitch-virtualenv
zinit light MichaelAquilina/zsh-autoswitch-virtualenv

# command not found
zinit light Tarrasch/zsh-command-not-found

# fast alias tips
zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

# auto pairs
zinit light hlissner/zsh-autopair

# z jump
# export _Z_DATA="$ZSH_DATA/z/data"
# if [[ ! -f "$ZSH_DATA/z/data" ]]; then
  # command mkdir -p "$ZSH_DATA/z"
  # command touch "$ZSH_DATA/z/data"
# fi
# zinit ice pick'z.sh'
# zinit light rupa/z
# zinit light changyuheng/fz

# history-substring-search
zinit light zsh-users/zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=white,bold,underline"
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

# completions
# export ENHANCD_DIR="$XDG_DATA_HOME/zsh/enhancd"
# export ENHANCD_COMMAND="cd"
# zinit wait lucid for \
  # proto'git' pick'init.sh' atclone'rm $ZINIT_HOME/completions/_enhancd_*.fish' \
    # b4b4r07/enhancd
zinit wait lucid for \
  atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' \
    zdharma/fast-syntax-highlighting \
  atload'!_zsh_autosuggest_start' \
    zsh-users/zsh-autosuggestions \
  blockf \
    zsh-users/zsh-completions

# source p10k
if [[ -f "$ZSH_CONFIG/p10k.zsh" ]]; then
  source "$ZSH_CONFIG/p10k.zsh"
fi
