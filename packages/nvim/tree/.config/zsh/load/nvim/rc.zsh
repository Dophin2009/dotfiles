#!/bin/zsh
# selection preview
zstyle ':fzf-tab:complete:nvim:*' fzf-preview \
	'([[ -f $realpath ]] && (bat --style=numbers --color=always $realpath || cat $realpath)) || ([[ -d $realpath ]] && (tree -C $realpath | less)) || echo $realpath 2> /dev/null | head -200'
zstyle ':fzf-tab:complete:nvim:*' fzf-flags --preview-window=right:70%
