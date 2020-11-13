let g:nvim_config = $XDG_CONFIG_HOME . '/nvim'
let g:nvim_data = $XDG_DATA_HOME . '/nvim'
let g:nvim_cache = $XDG_CACHE_HOME . '/nvim'

""" python host path
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

""" vim-polyglot disables
let g:polyglot_disabled = ['asciidoc', 'pgsql']

""" vimtex inital config
let g:vimtex_enabled = 1
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'

execute 'source ' . g:nvim_config . '/plugins.vim'

"""
""" THEME
"""

"   enable termguicolors
set termguicolors
"   set vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

lua require('colorizer')


"""
""" GLOBAL EDITOR OPTIONS
"""

"   source local .vimrc files
set exrc
set secure

"   hidden
set hidden
"   show line numbers
set number
"   default no softwrap
set nowrap
"   use space tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"   better display for messages set cmdheight=2
"   avoid hit-enter messages
set shortmess+=c
"   always show signcolumns
set signcolumn=yes
"   maintain undo history between sessions
set undofile
let &undodir=g:nvim_cache . '/undo'
"   updatetime for CursorHold
set updatetime=800
"   current working directory
autocmd BufEnter * lcd %:p:h


"""
""" OTHER CONFIGS
"""

let g:config_files = [
  \ 'macros.vim',
  \ 'theme.vim',
  \ 'editing.vim',
  \ 'keybindings.vim',
  \ 'status.vim'
  \ ]
for f in g:config_files
  execute 'source ' . g:nvim_config . '/' . f
endfor
