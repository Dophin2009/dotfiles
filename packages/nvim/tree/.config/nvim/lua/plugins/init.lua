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

    -- Better startup profiling
    use {'tweekmonster/startuptime.vim'}

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

    -- Snippets
    use {
        'norcalli/snippets.nvim',
        config = function() require 'plugins/snippets' end
    }

    -- Completion integration
    use {
        'nvim-lua/completion-nvim',
        after = {'snippets.nvim'},
        config = function() require 'lsp/completion' end
    }

    -- Status line integration for diagnostics
    use {
        'nvim-lua/lsp-status.nvim',
        config = function() require 'lsp/status' end
    }

    -- More code actions, inlay hints, etc.
    use {
        'nvim-lua/lsp_extensions.nvim',
        ft = {'rust'},
        config = function() require 'plugins/lsp_extensions' end
    }

    -- Utilities
    -- use {'RishabhRD/nvim-lsputils', requires = {{'RishabhRD/popfix'}}}

    -- Intelligent cursor word highlighting
    use {
        'RRethy/vim-illuminate',
        config = function() require 'plugins/illuminate' end
    }

    -- Predefined language server configurations
    use {
        'neovim/nvim-lspconfig',
        -- Requires loading of completion-nvim, lsp-status for handlers
        after = {'completion-nvim', 'lsp-status.nvim', 'vim-illuminate'},
        config = function() require 'lsp' end
    }

    use {
        'mfussenegger/nvim-jdtls',
        ft = {'java'},
        after = {'nvim-lspconfig'},
        config = function() require 'lsp/jdtls' end
    }

    -- Better treesitter support
    -- use {
    -- 'nvim-treesitter/nvim-treesitter',
    -- config = function() require 'plugins/treesitter' end
    -- }

    -- Code actions inidicator
    use {
        'kosayoda/nvim-lightbulb',
        config = function() require 'plugins/lightbulb' end
    }

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

    -- Disable hlsearch when done searching, renable when searching again
    -- use {'romainl/vim-cool'}

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

    -- RGB, hex color highlighting
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require 'plugins/colorizer' end
    }

    -- Markdown preview
    use {
        'npxbr/glow.nvim',
        ft = {'markdown', 'pandoc'},
        config = function() require 'plugins/glow' end
    }

    -- Peak registers
    use {'junegunn/vim-peekaboo'}

    --
    -- NAVIGATION
    --

    -- FZF integration
    -- use {'junegunn/fzf.vim', config = function() require 'plugins/fzf' end}

    -- Fuzzy picker, more functionality than fzf
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        after = {'nvim-lspconfig'},
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
        after = {'telescope.nvim', 'packer.nvim'},
        opt = true,
        config = function() require 'plugins/telescope-packer' end
    }

    -- Sane buffer tabline
    use {'romgrk/barbar.nvim', setup = function() require 'plugins/barbar' end}

    -- Marks in gutter
    use {'kshenoy/vim-signature'}

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

    -- Smooth page-down and page-up
    use {'psliwka/vim-smoothie'}

    -- tmux compatbility
    use {'tmux-plugins/vim-tmux-focus-events'}

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

    -- ebuild support
    use {'gentoo/gentoo-syntax'}

    -- editorconfig support
    use {'editorconfig/editorconfig-vim'}

    -- ELinks configuration syntax file
    use {'vim-scripts/elinks.vim'}

    -- JSONC support
    use {'kevinoid/vim-jsonc', ft = {'jsonc'}}

    -- LLVM IR support
    use {'rhysd/vim-llvm'}

    -- Better lua highlighting
    -- use {'tbastos/vim-lua', ft = {'lua'}}
    use {'euclidianAce/BetterLua.vim', ft = {'lua'}}

    -- Pandoc support
    use {
        'vim-pandoc/vim-pandoc',
        requires = {{'vim-pandoc/vim-pandoc-syntax'}},
        config = function() require 'plugins/pandoc' end
    }

    -- PostgreSQL support
    use {'lifepillar/pgsql.vim', ft = {'pgsql'}}

    -- Python syntax highlighting
    use {
        'vim-python/python-syntax',
        ft = {'python'},
        config = function() require 'plugins/python' end
    }

    -- R Markdown support
    use {'vim-pandoc/vim-rmarkdown', after = {'vim-pandoc'}, ft = {'rmarkdown'}}

    -- Rust syntax highlighting
    -- use {'arzg/vim-rust-syntax-ext', ft = {'rust'}}

    -- TOML support
    use {'cespare/vim-toml'}

    -- Cargo.toml crate version hints
    use {
        'mhinz/vim-crates',
        ft = {'toml'},
        after = {'vim-toml'},
        config = function() require 'plugins/vim-crates' end
    }

    -- Good TeX support
    use {'lervag/vimtex', config = function() require 'plugins/vimtex' end}

    -- Vader support
    use {'junegunn/vader.vim'}

    --
    -- WRITING
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
