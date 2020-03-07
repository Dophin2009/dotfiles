##
##  BASE OH-MY-ZSH SETTINGS
##

##  Path to oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"
#   Define custom $ZSH/custom folder.
#   ZSH_CUSTOM=/path/to/new-custom-folder

##  ZSH theme settings
#   zsh theme, see https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#   for themes. "random" will choose from candidates.
ZSH_THEME="dieter"
ZSH_THEME_RANDOM_CANDIDATES=( "dieter" )

##  Auto-update settings
#   Enable biweekly auto-updates.
DISABLE_AUTO_UPDATE="false"
#   No automatic updates without prompting.
DISABLE_UPDATE_PROMPT="false"
#   Define auto-update interval
export UPDATE_ZSH_DAYS=13

##  Completion settings
#   Case-insensitive completion.
CASE_SENSITIVE="false"
#   Hyphen-sensitive completion; case-sensitive completion must be off.
#   _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"
#   Enable magic functions for pasting urls and other things.
DISABLE_MAGIC_FUNCTIONS="false"
#   Enable command auto-correction.
ENABLE_CORRECTION="true"

##  Appearance settings
#   Enable colors in ls.
DISABLE_LS_COLORS="false"

#   Auto-set terminal title to process.
DISABLE_AUTO_TITLE="false"

#   Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
zstyle ':completion:*:functions' ignored-patterns '_*'

#   Mark untracked files under VCS as dirty. Disable to make repository
#   status checks for large repositories much faster.
DISABLE_UNTRACKED_FILES_DIRTY="false"

#   Define the command execution time stamp shown in the history
#   command output. Optional three formats:
#   "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#   See 'man strftime' for details on custom formats.
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  command-not-found
  git
  pip
  yarn
  zsh-autosuggestions
)

##  Enable oh-my-zsh.
source $ZSH/oh-my-zsh.sh

##
##  ENVIRONMENT VARIABLES
##

##  Define aliases from shared aliases file.
source $XDG_CONFIG_HOME/sh/aliases
##  Define path from shared path file.
source $XDG_CONFIG_HOME/sh/path

##  Default terminal is termite.
export TERM=xterm-termite

##  Use neovim as preferred editor for local and remote
##  sessions.
export EDITOR='nvim'

##
##  CUSTOM FUNCTIONS / ALIASES
##

# Change directory on demand after exiting ranger
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

