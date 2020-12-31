local cmd, fn = vim.cmd, vim.fn

-- Load packer.nvim
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    local execute = vim.api.nvim_command
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
    execute('packadd packer.nvim')
end
cmd [[packadd packer.nvim]]

-- Load plugins
local packer = require('packer')
packer.startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    --
    -- NAVIGATION
    --

    -- tmux compatbility
    use {'tmux-plugins/vim-tmux-focus-events'}

    -- Project drawer
    -- use {'preservim/nerdtree', requires = {{'Xuyuanp/nerdtree-git-plugin'}, {'ryanoasis/vim-devicons'}}}

    -- FZF integration
    use {'junegunn/fzf.vim'}

    -- Sane buffer tabline
    use {'romgrk/barbar.nvim'}

    -- Minimap of code
    -- use {'wfxr/minimap.vim'}

    -- ctags integration
    -- use {'mjutsushi/tagbar'}

    --
    -- STATUSLINE
    --

    -- Airline statusline
    use {'vim-airline/vim-airline'}
    -- use {'vim-airiline/vim-airline-themes, requires = {{'vim-airline/vim-airline'}}}

    -- Git signs in the signcolumn
    use {'lewis6991/gitsigns.nvim', requires = {{'nvim-lua/plenary.nvim'}}}

    --
    -- LSP
    --

    -- Predefined language server configurations
    use {'mjlbach/nvim-lspconfig', branch = 'fix_rust-analyzer_nightly'}

    -- More code actions, inlay hints, etc.
    use {'nvim-lua/lsp_extensions.nvim'}

    -- Completion integration
    use {'nvim-lua/completion-nvim'}

    -- Utilities
    -- use {'RishabhRD/nvim-lsputils', requires = {{'RishabhRD/popfix'}}}

    -- Better treesitter support
    -- use {'nvim-treesitter/nvim-treesitter'}

    -- Status line integration for diagnostics
    use {'nvim-lua/lsp-status.nvim'}

    -- FZF integration
    use {'ojroques/nvim-lspfuzzy', requires = {{'junegunn/fzf.vim'}}}

    --
    -- EDITING
    --

    -- Autoclose parentheses, brackets, etc.
    use {'Raimondi/delimitMate'}

    -- Autoclose XHTML tags
    use {'alvan/vim-closetag', ft = {'html', 'xhtml', 'xml'}}

    -- Keybindings to surround words in quotes, brackets, etc.
    -- use {'tpope/vim-surround'}

    -- Preview search and replace
    use {'markonm/traces.vim'}

    -- Comment and uncomment with keybindings (<leader>c<space>)
    use {'scrooloose/nerdcommenter'}

    -- Automated text table spacing
    use {
        'godlygeek/tabular',
        ft = {'asciidoc', 'markdown', 'pandoc', 'rmarkdown', 'text', 'tex'}
    }

    --
    -- LANGUAGE SUPPORT
    --

    -- Bulk language support
    -- use {'sheerun/vim-polyglot'}

    -- Asciidoctor support
    use {'habamax/vim-asciidoctor', ft = {'asciidoc'}}

    -- Useful csv utilities and highlighting
    use {'mechatroner/rainbow_csv', ft = {'csv'}}

    -- Cxx semantic highlighting
    use {
        'jackguo380/vim-lsp-cxx-highlight',
        ft = {'c', 'cpp', 'objc', 'objcpp'}
    }

    -- EBNF syntax file
    use {'a-vrma/ebnf-vim'}

    -- editorconfig support
    use {'editorconfig/editorconfig-vim'}

    -- ELinks configuration syntax file
    use {'vim-scripts/elinks.vim'}

    -- JSONC support
    use {'kevinoid/vim-jsonc', ft = {'jsonc'}}

    -- Better lua highlighting
    use {'tbastos/vim-lua', ft = {'lua'}}

    -- Pandoc support
    use {
        'vim-pandoc/vim-pandoc',
        ft = {'pandoc', 'rmarkdown'},
        requires = {{'vim-pandoc/vim-pandoc-syntax'}}
    }

    -- PostgreSQL support
    use {'lifepillar/pgsql.vim', ft = {'pgsql'}}

    -- R Markdown support
    use {'vim-pandoc/vim-rmarkdown', ft = {'rmarkdown'}}

    -- Cargo.toml crate version hints
    use {'mhinz/vim-crates', ft = {'toml'}}

    -- Good TeX support
    use {'lervag/vimtex'}

    -- Vader support
    use {'junegunn/vader.vim'}

    --
    -- MISC
    --

    -- Distraction-free writing environment
    -- use {'junegunn/goyo.vim'}

    -- Find poorly repeated words in writing
    use {'dbmrq/vim-ditto', ft = {'markdown', 'pandoc', 'text', 'tex'}}

    -- Thesaurus utility
    use {'ron89/thesaurus_query.vim'}

    -- RGB, hex color highlighting
    use {'norcalli/nvim-colorizer.lua'}

    -- Better startup profiling
    use {'tweekmonster/startuptime.vim'}

    --
    -- THEME
    --

    -- Gruvbox material
    use {'sainnhe/gruvbox-material'}

    -- Nord
    use {'arcticicestudio/nord-vim'}

    -- Iceberg
    use {'cocopon/iceberg.vim'}

end)

require 'plugins/netrw'

require 'plugins/airline'
require 'plugins/barbar'
require 'plugins/closetag'
require 'plugins/colorizer'
require 'plugins/delimitmate'
require 'plugins/ditto'
require 'plugins/fzf'
require 'plugins/gitsigns'
-- require 'plugins/goyo'
-- require 'plugins/minimap'
require 'plugins/nerdcommenter'
require 'plugins/nerdtree'
-- require 'plugins/tagbar'
require 'plugins/thesaurus_query'
require 'plugins/treesitter'
require 'plugins/vimtex'
