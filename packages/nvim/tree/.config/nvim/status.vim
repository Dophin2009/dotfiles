"""
""" WINDOW
"""

""" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25
"   cache location
let g:netrw_home = g:nvim_cache

""" NERDTree
augroup nerdtree_autoclose
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

""" airline
"   enable tabline status
let g:airline#extensions#tabline#enabled = 1
"   enable ALE status
let g:airline#extensions#ale#enabled = 1
"   enable powerline fonts
let g:airline_powerline_fonts = 1
"   enable wordcount for filetypes
let g:airline#extensions#wordcount#filetypes = '\vasciidoc|help|mail|markdown|pandoc|org|rst|tex|text'

""" gitgutter
let g:gitgutter_max_signs = 1000

""" tagbar
"   more compact
let g:tagbar_compact = 1
let g:tagbar_indent = 1
"   set to be wider
let g:tagbar_width = 60
"   show line numbers
let g:tagbar_show_linenumbers = 1
"   autoclose and autofocus
let g:tagbar_autoclose = 1
let g:tagbar_auofocus = 1

""" goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
