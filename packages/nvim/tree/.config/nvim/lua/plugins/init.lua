local g = vim.g
local cmd, fn = vim.cmd, vim.fn

-- Load netrw settings
require 'plugins/netrw'

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

    -- FZF integration
    -- use {'junegunn/fzf.vim', config = function() require 'plugins/fzf' end}

    -- Fuzzy picker, more functionality than fzf
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require 'plugins/telescope' end
    }

    -- Compiled style sorter for telescope.nvim
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        after = {'telescope.nvim'},
        config = function() require 'plugins/telescope-fzy-native' end
    }

    -- Packer.nvim integration with telescope
    use {
        'nvim-telescope/telescope-packer.nvim',
        after = {'telescope.nvim'},
        config = function() require 'plugins/telescope-packer' end
    }

    -- Sane buffer tabline
    use {'romgrk/barbar.nvim', setup = function() require 'plugins/barbar' end}

    -- Project drawer
    -- use {
    -- 'preservim/nerdtree',
    -- requires = {{'Xuyuanp/nerdtree-git-plugin'}, {'ryanoasis/vim-devicons'}},
    -- config = function() require 'plugins/nerdtree' end
    -- }

    -- Minimap of code
    -- use {'wfxr/minimap.vim', config = function() require 'plugins/minimap' end}

    -- ctags integration
    -- use {'mjutsushi/tagbar', config = function() require 'plugins/tagbar' end}

    -- tmux compatbility
    use {'tmux-plugins/vim-tmux-focus-events'}

    --
    -- STATUSLINE
    --

    -- Airline statusline
    use {
        'vim-airline/vim-airline',
        config = function() require 'plugins/airline' end
    }
    -- use {'vim-airiline/vim-airline-themes, requires = {{'vim-airline/vim-airline'}}}

    -- Git signs in the signcolumn
    use {
        'lewis6991/gitsigns.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function() require 'plugins/gitsigns' end
    }

    --
    -- LSP
    --

    -- Predefined language server configurations
    use {
        'mjlbach/nvim-lspconfig',
        branch = 'fix_rust-analyzer_nightly',
        after = {'completion-nvim', 'lsp-status.nvim'},
        config = function() require 'lsp/servers' end
    }

    -- Completion integration
    use {'nvim-lua/completion-nvim', config = function() require 'lsp/completion' end}

    -- Status line integration for diagnostics
    use {'nvim-lua/lsp-status.nvim'}

    -- More code actions, inlay hints, etc.
    use {
        'nvim-lua/lsp_extensions.nvim',
        ft = {'rust'},
        config = function() require 'plugins/lsp_extensions' end
    }

    -- Utilities
    -- use {'RishabhRD/nvim-lsputils', requires = {{'RishabhRD/popfix'}}}

    -- Better treesitter support
    -- use {
    -- 'nvim-treesitter/nvim-treesitter',
    -- config = function() require 'plugins/treesitter' end
    -- }

    -- FZF integration
    -- use {
    -- 'ojroques/nvim-lspfuzzy',
    -- requires = {{'junegunn/fzf.vim'}},
    -- config = function() require 'plugins/lspfuzzy' end
    -- }

    --
    -- EDITING
    --

    -- Autoclose parentheses, brackets, etc.
    use {
        'Raimondi/delimitMate',
        config = function() require 'plugins/delimitmate' end
    }

    -- Autoclose XHTML tags
    use {
        'alvan/vim-closetag',
        ft = {'html', 'xhtml', 'xml'},
        config = function() require 'plugins/closetag' end
    }

    -- Keybindings to surround words in quotes, brackets, etc.
    -- use {'tpope/vim-surround'}

    -- Preview search and replace
    use {'markonm/traces.vim'}

    -- Comment and uncomment with keybindings (<leader>c<space>)
    use {
        'scrooloose/nerdcommenter',
        config = function() require 'plugins/nerdcommenter' end
    }

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
    use {
        'habamax/vim-asciidoctor',
        ft = {'asciidoc'},
        config = function() require 'plugins/asciidoctor' end
    }

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
    -- use {'tbastos/vim-lua', ft = {'lua'}}
    use {'euclidianAce/BetterLua.vim', ft = {'lua'}}

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
    use {'lervag/vimtex', config = function() require 'plugins/vimtex' end}

    -- Vader support
    use {'junegunn/vader.vim'}

    --
    -- MISC
    --

    -- Distraction-free writing environment
    -- use {'junegunn/goyo.vim', config = function() require 'plugins/goyo' end}

    -- Find poorly repeated words in writing
    use {
        'dbmrq/vim-ditto',
        ft = {'markdown', 'pandoc', 'text', 'tex'},
        config = function() require 'plugins/ditto' end
    }

    -- Thesaurus utility
    use {
        'ron89/thesaurus_query.vim',
        setup = function() require 'plugins/thesaurus_query' end
    }

    -- RGB, hex color highlighting
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require 'plugins/colorizer' end
    }

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

-- Auto-compile on save this file
cmd('autocmd BufWritePost ' .. g.nvim_config ..
        '/lua/plugins/init.lua PackerCompile')
