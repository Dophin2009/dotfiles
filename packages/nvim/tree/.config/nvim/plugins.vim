let g:nvim_data = $XDG_DATA_HOME . '/nvim'

"   begin plugin check/installation
call plug#begin(nvim_data . '/plugged')

"""
""" NAVIGATION
"""

""" tmux-focus-events
Plug 'tmux-plugins/vim-tmux-focus-events'
""" fzf
Plug 'junegunn/fzf.vim'
""" ranger
" Plug 'rafaqz/ranger.vim'
""" vifm
" Plug 'vifm/vifm.vim'
""" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
""" dev icons
Plug 'ryanoasis/vim-devicons'
""" minimap
Plug 'wfxr/minimap.vim'


"""
""" WINDOW
"""

""" tagbar
Plug 'majutsushi/tagbar'

""" lsp-status
Plug 'nvim-lua/lsp-status.nvim'

""" airline
Plug 'vim-airline/vim-airline'
"   airline themes
Plug 'vim-airline/vim-airline-themes'
""" gitgutter
Plug 'airblade/vim-gitgutter'

""" barbar tabline
Plug 'romgrk/barbar.nvim'


"""
""" LINTING / COMPLETION
"""

""" nvim-lsp
Plug 'neovim/nvim-lsp'
""" nvim-lsp extensions
Plug 'nvim-lua/lsp_extensions.nvim'
""" diagnostic-nvim
Plug 'nvim-lua/diagnostic-nvim'
""" completion-nvim
Plug 'nvim-lua/completion-nvim'
""" nvim-lsputils
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'

""" treesitter
Plug 'nvim-treesitter/nvim-treesitter'

""" Asynchronous Lint Engine (ALE)
"   hover settings
Plug 'dense-analysis/ale'

""" deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"   context filetype functionality
" Plug 'Shougo/context_filetype.vim'
"   prints documentation in completion menu
" Plug 'Shougo/echodoc.vim'
"   nvim-lsp source
" Plug 'Shougo/deoplete-lsp'
"   syntax sources
" Plug 'Shougo/neco-syntax'
"   file includes sources
" Plug 'Shougo/neoinclude.vim'
"   clang source
" Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp', 'objc', 'objcpp']}
"   java source
" Plug 'artur-shaik/vim-javacomplete2', { 'tag': 'v2.4.0' }
"   python source
" Plug 'deoplete-plugins/deoplete-jedi'
"   typescript source
"   yarn install -g neovim
"   yarn install -g typescript
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
"   tmux panes source
" Plug 'wellle/tmux-complete.vim'

""" delimitMate (autoclose parentheses, etc.)
Plug 'Raimondi/delimitMate'
""" vim-closetag (autoclose XHTML tags)
Plug 'alvan/vim-closetag'
""" surround.vim
Plug 'tpope/vim-surround'
""" import-js (import js dependencies)
Plug 'galooshi/vim-import-js', { 'for': 'javascript' }

"""
""" FORMATTING
"""

""" nerdcommenter
"   comment/uncomment with keybindings (\ + c + <space>)
Plug 'scrooloose/nerdcommenter'
""" tabularize
Plug 'godlygeek/tabular'


"""
""" LANGUAGE
"""

""" polyglot (covers most languages)
Plug 'sheerun/vim-polyglot'
""" asciidoc
Plug 'habamax/vim-asciidoctor', { 'for': 'asciidoc' }
""" csv
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
""" cxx semantic highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight', { 'for': ['c', 'cpp', 'objc', 'objcpp'] }
""" ebnf
Plug 'a-vrma/ebnf-vim'
""" editorconfig
Plug 'editorconfig/editorconfig-vim'
""" elinks.conf
Plug 'vim-scripts/elinks.vim'
""" golang
Plug 'fatih/vim-go', { 'for': 'go' }
""" jsonc
Plug 'kevinoid/vim-jsonc', { 'for': 'jsonc' }
""" pandoc
Plug 'vim-pandoc/vim-pandoc', { 'for': ['pandoc', 'rmarkdown'] }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['pandoc', 'rmarkdown'] }
Plug 'junegunn/goyo.vim'
""" postgresql
Plug 'lifepillar/pgsql.vim', { 'for': 'pgsql' }
""" rmarkdown
Plug 'vim-pandoc/vim-rmarkdown', { 'for': 'rmarkdown' }
""" rust crates
Plug 'mhinz/vim-crates'
""" tex
Plug 'lervag/vimtex'
""" vader
Plug 'junegunn/vader.vim'

""" colorizer
Plug 'norcalli/nvim-colorizer.lua'
""" thesaurus
Plug 'ron89/thesaurus_query.vim'
""" fugitive
Plug 'tpope/vim-fugitive'

"""
""" THEME
"""

"   gruvbox-material
Plug 'sainnhe/gruvbox-material'
"   nord
Plug 'arcticicestudio/nord-vim'
"   iceberg
Plug 'cocopon/iceberg.vim'
" Plug 'gkeep/iceberg-dark'
"   terminal colors
" Plug 'dylanaraps/wal.vim'

"   end plugin check/installation
call plug#end()
