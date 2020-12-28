# GPG password prompt
export GPG_TTY=$(tty)

# open tmux by default
[[ $TERM != "screen-256color" ]] && exec tmux

# Source rcs
source "$HOME/.config/zsh/rc.zsh"
