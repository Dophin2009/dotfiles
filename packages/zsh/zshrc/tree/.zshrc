# GPG password prompt
export GPG_TTY=$(tty)

# open tmux by default
[[ $TERM != "tmux-256color" ]] && exec tmux

# Source rcs
source "$HOME/.config/zsh/rc.zsh"
