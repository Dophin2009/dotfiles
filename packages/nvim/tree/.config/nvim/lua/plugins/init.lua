-- luacheck: globals vim use
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

    -- CurserHold performance fix
    use {'antoinemadec/FixCursorHold.nvim'}

    --
    -- STATUSLINE
    --

    -- Lualine statusline
    use {'hoob3rt/lualine.nvim', requires = {{'kyazdani42/nvim-web-devicons'}}}

    -- Git signs in the signcolumn
    use {
        'lewis6991/gitsigns.nvim',
        requires = {{'nvim-lua/plenary.nvim'}},
        config = function() require 'plugins/gitsigns' end
    }

    --
    -- LSP
    --

    -- More code actions, inlay hints, etc.
    use {
        'nvim-lua/lsp_extensions.nvim',
        ft = {'rust'},
        config = function() require 'lsp/lsp_extensions' end
    }

    -- Support for tsserver extensions
    use {'jose-elias-alvarez/nvim-lsp-ts-utils'}

    -- Intelligent cursor word highlighting
    use {
        'RRethy/vim-illuminate',
        config = function() require 'plugins/illuminate' end
    }

    -- Snippets
    -- use {
    -- 'norcalli/snippets.nvim',
    -- config = function() require 'plugins/snippets' end
    -- }

    -- Completion integration
    use {
        'windwp/nvim-autopairs',
        config = function() require 'plugins/autopairs' end
    }
    use {
        'hrsh7th/nvim-compe',
        requires = {{'andersevenrud/compe-tmux'}, {'ray-x/lsp_signature.nvim'}},
        after = {'nvim-autopairs'},
        config = function() require 'lsp/completion' end
    }

    -- Predefined language server configurations
    use {
        'neovim/nvim-lspconfig',
        after = {
            'nvim-compe', 'telescope.nvim', 'vim-illuminate',
            'nvim-lsp-ts-utils'
        },
        config = function() require 'lsp' end
    }

    -- Jdtls for Java
    use {
        'mfussenegger/nvim-jdtls',
        ft = {'java'},
        after = {'nvim-lspconfig'},
        config = function() require 'lsp/jdtls' end
    }

    -- Scala support with metals
    use {
        'scalameta/nvim-metals',
        ft = {'scala', 'sbt'},
        config = function() require 'lsp/metals' end
    }

    -- Code actions inidicator
    use {
        'kosayoda/nvim-lightbulb',
        config = function() require 'plugins/lightbulb' end
    }

    -- Pretty diagnostics view list
    use {
        'folke/lsp-trouble.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function() require 'plugins/trouble' end
    }

    --
    -- EDITING
    --

    -- Better treesitter support
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'windwp/nvim-ts-autotag',
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        config = function() require 'plugins/treesitter' end
    }
    use {'romgrk/nvim-treesitter-context', after = {'nvim-treesitter'}}
    use {'haringsrob/nvim_context_vt', after = {'nvim-treesitter'}}

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

    -- Indent guides
    use {
        'Yggdroot/indentLine', {
            'lukas-reineke/indent-blankline.nvim',
            config = function() require 'plugins/indentguide' end
        }
    }

    --
    -- NAVIGATION
    --

    -- Fuzzy picker
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        after = {'nvim-treesitter'},
        config = function() require 'plugins/telescope' end
    }

    -- Compiled style sorter for telescope.nvim
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        after = {'telescope.nvim'},
        config = function() require 'plugins/telescope-fzy-native' end
    }

    -- Dim inactive buffers
    use {'sunjon/Shade.nvim', config = function() require 'plugins/shade' end}

    -- Keep eye on jump location
    use {'edluffy/specs.nvim', config = function() require 'plugins/specs' end}

    -- Sane buffer tabline
    use {'romgrk/barbar.nvim', setup = function() require 'plugins/barbar' end}

    -- Smooth page-down and page-up
    use {'psliwka/vim-smoothie'}

    -- tmux compatbility
    use {'tmux-plugins/vim-tmux-focus-events'}

    -- Lazygit
    use {
        'kdheepak/lazygit.nvim',
        config = function() require 'plugins/lazygit' end
    }

    --
    -- LANGUAGE SUPPORT
    --

    -- Asciidoctor support
    use {
        'habamax/vim-asciidoctor',
        ft = {'asciidoc'},
        config = function() require 'plugins/asciidoctor' end
    }

    -- Useful csv utilities and highlighting
    use {'mechatroner/rainbow_csv', ft = {'csv'}}

    -- EBNF syntax file
    use {'a-vrma/ebnf-vim'}

    -- ebuild support
    use {'gentoo/gentoo-syntax'}

    -- editorconfig support
    use {'editorconfig/editorconfig-vim'}

    -- ELinks configuration syntax file
    use {'vim-scripts/elinks.vim'}

    -- i3 configuration file syntax
    use {'mboughaba/i3config.vim'}

    -- LLVM IR support
    use {'rhysd/vim-llvm'}

    -- Better lua highlighting
    use {'euclidianAce/BetterLua.vim', ft = {'lua'}}

    -- Nginx configuration highlighting
    use {'chr4/nginx.vim'}

    -- Pandoc support
    use {
        'vim-pandoc/vim-pandoc',
        requires = {{'vim-pandoc/vim-pandoc-syntax'}},
        config = function() require 'plugins/pandoc' end
    }

    -- PostgreSQL support
    use {'lifepillar/pgsql.vim', ft = {'pgsql'}}

    -- R Markdown support
    use {'vim-pandoc/vim-rmarkdown', after = {'vim-pandoc'}, ft = {'rmarkdown'}}

    -- Cargo.toml crate version hints
    use {
        'mhinz/vim-crates',
        ft = {'toml'},
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
    -- use {
    -- 'dbmrq/vim-ditto',
    -- ft = {'markdown', 'pandoc', 'text', 'tex'},
    -- config = function() require 'plugins/ditto' end
    -- }

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

    --
    -- MISC
    --

    -- Unix command use
    use {'tpope/vim-eunuch'}

    -- Popup with keybind suggestions
    use {
        'folke/which-key.nvim',
        config = function() require 'plugins/which-key' end
    }

end)

-- Auto-compile on save this file
cmd('autocmd BufWritePost ' .. g.nvim_config ..
        '/lua/plugins/init.lua PackerCompile')
