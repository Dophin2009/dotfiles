#!/bin/zsh

# powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# window title
precmd() {
	vcs_info
	print -Pn "\e]0; %~\a"
}
preexec() {
	print -Pn "\e]0;%~ $1\a"
}

# source p10k
if [[ -f "$ZSH_CONFIG/p10k.zsh" ]]; then
	source "$ZSH_CONFIG/p10k.zsh"
fi
