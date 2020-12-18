# GPG password prompt
export GPG_TTY=$(tty)

# open tmux by default
[[ $TERM != "screen-256color" ]] && exec tmux
# enable p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source rcs
source "$HOME/.config/zsh/rc.zsh"
