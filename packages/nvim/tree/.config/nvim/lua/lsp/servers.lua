-- luacheck: globals vim
local U = require('util')

local lspconfig = U.require('lspconfig')
local configs = require('lspconfig/configs')

-- override handlers
local handlers = require('lsp/handlers')
local on_attach = handlers.on_attach
local capabilities = handlers.capabilities

-- bash language server
lspconfig.bashls.setup {on_attach = on_attach, capabilities = capabilities}

-- clangd
-- local clangd_handlers = nil
lspconfig.clangd.setup {
    -- handlers = clangd_handlers,
    init_options = {clangdFileStatus = true},
    on_attach = on_attach,
    capabilities = capabilities
}

-- cmake language server
lspconfig.cmake.setup {on_attach = on_attach, capabilities = capabilities}

-- css language server
lspconfig.cssls.setup {on_attach = on_attach, capabilities = capabilities}

-- deno language server
-- lspconfig.denols.setup {
-- init_options = {lint = true},
-- on_attach = on_attach,
-- capabilities = capabilities
-- }

-- dhall language server
if not configs.dhall_lsp then
    configs.dhall_lsp = {
        default_config = {
            cmd = {'dhall-lsp-server'},
            filetypes = {'dhall'},
            root_dir = function(fname)
                return lspconfig.util.find_git_ancestor(fname) or
                           vim.loop.os_homedir()
            end,
            settings = {}
        }
    }
end
lspconfig.dhall_lsp.setup {on_attach = on_attach, capabilities = capabilities}

-- dockerfile language server
lspconfig.dockerls.setup {on_attach = on_attach, capabilities = capabilities}

-- go language server
lspconfig.gopls.setup {on_attach = on_attach, capabilities = capabilities}

-- haskell ide engine
lspconfig.hie.setup {on_attach = on_attach, capabilities = capabilities}

-- html language server
lspconfig.html.setup {on_attach = on_attach, capabilities = capabilities}

-- java language server
-- lspconfig.jdtls.setup {
-- on_attach = on_attach,
-- capabilities = capabilities,
-- root_dir = lspconfig.util.root_pattern('.project')
-- }

-- jedi language server
-- lspconfig.jedi_language_server.setup {
-- on_attach = on_attach,
-- capabilities = capabilities
-- }

-- json language server
lspconfig.jsonls.setup {on_attach = on_attach, capabilities = capabilities}

-- kotlin language server
lspconfig.kotlin_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- lua language server
lspconfig.sumneko_lua.setup {
    cmd = {'lua-language-server'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {diagnostics = {enable = false}, workspace = {maxPreload = 2000}}
    }
}

-- ocaml/reason language server
if not configs.ocaml_lsp then
    configs.ocaml_lsp = {
        default_config = {
            cmd = {'ocamllsp'},
            filetypes = {'ocaml', 'reason'},
            root_dir = function(fname)
                return lspconfig.util.root_pattern('dune')(fname) or
                           lspconfig.util.find_git_ancestor(fname);
            end
        }
    }
end
lspconfig.ocaml_lsp.setup {on_attach = on_attach, capabilities = capabilities}

-- php language server
lspconfig.intelephense.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
    end,
    capabilities = capabilities
}

-- php language server
-- lspconfig.phpactor.setup {on_attach = on_attach, capabilities = capabilities}

-- php psalm language server
-- if not configs.psalm_lsp then
-- configs.psalm_lsp = {
-- default_config = {
-- cmd = {'vendor/bin/psalm-language-server'},
-- filetypes = {'php'},
-- root_dir = function(fname)
-- -- return lspconfig.util.find_git_ancestor(fname)
-- return lspconfig.util.root_pattern('composer.json', '.git')(
-- fname) or lspconfig.util.find_git_ancestor(fname)
-- end,
-- settings = {}
-- }
-- }
-- end
-- lspconfig.psalm_lsp.setup {on_attach = on_attach, capabilities = capabilities}

-- python language server
lspconfig.pyls.setup {on_attach = on_attach, capabilities = capabilities}

-- pyright language server
lspconfig.pyright.setup {on_attach = on_attach, capabilities = capabilities}

-- r language server
lspconfig.r_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- rust analyzer
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            cargo = {loadOutDirsFromCheck = true, allFeatures = true},
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            },
            diagnostics = {
                enable = true,
                disabled = {'unresolved-proc-macro'},
                enableExperimental = true
            },
            procMacro = {enable = true}
        }
    }
}

-- texlab
-- lspconfig.texlab.setup {on_attach = on_attach, capabilities = capabilities}

-- tsserver
lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
        -- Enable incremental sync
        if client.config.flags then
            client.config.flags.allow_incremental_sync = true
        end

        -- Disable built-in formatting
        client.resolved_capabilities.document_formatting = false

        local ts_utils = require('nvim-lsp-ts-utils')
        vim.lsp.handlers['textDocument/codeAction'] =
            ts_utils.code_action_handler
        ts_utils.setup {enable_import_on_completion = true}

        vim.api.nvim_buf_set_keymap(bufnr, "n", "gS", ":TSLspOrganize<CR>",
                                    {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gQ", ":TSLspFixCurrent<CR>",
                                    {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gT", ":TSLspRenameFile<CR>",
                                    {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>",
                                    {silent = true})

        on_attach(client, bufnr)
    end,
    capabilities = capabilities
}

-- vim language server
lspconfig.vimls.setup {on_attach = on_attach, capabilities = capabilities}

-- yaml language server
-- lspconfig.yamlls.setup {on_attach = on_attach, capabilities = capabilities}

-- efm-langserver
-- local autopep8 = require('lsp/efm/autopep8')
local eslint = require('lsp/efm/eslint')
local fixjson = require('lsp/efm/fixjson')
-- local flake8 = require('lsp/efm/flake8')
local goimports = require('lsp/efm/goimports')
local golint = require('lsp/efm/golint')
local htmlhint = require('lsp/efm/htmlhint')
-- local ktlint = require('lsp/efm/ktlint')
-- local lacheck = require('lsp/efm/lacheck')
local luacheck = require('lsp/efm/luacheck')
local luafmt = require('lsp/efm/luafmt')
-- local luac = require('lsp/efm/luac')
-- local misspell = require('lsp/efm/misspell')
-- local mypy = require('lsp/efm/mypy')
local pandoc = require('lsp/efm/pandoc')
-- local psalm = require('lsp/efm/psalm')
local phpcs = require('lsp/efm/phpcs')
local phpstan = require('lsp/efm/phpstan')
local prettier = require('lsp/efm/prettier')
-- local reorder_python_imports = require('lsp/efm/reorder_python_imports')
local shfmt = require('lsp/efm/shfmt')
local stylelint = require('lsp/efm/stylelint')
local taplo = require('lsp/efm/taplo')
local tidy = require('lsp/efm/tidy')
local vale = require('lsp/efm/vale')
local vint = require('lsp/efm/vint')
-- local xmllint = require('lsp/efm/xmllint')
-- local yamllint = require('lsp/efm/yamllint')

lspconfig.efm.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {documentformatting = true},
    filetypes = {
        'bash', 'css', 'go', 'html', 'javascript', 'javascript',
        'javascriptreact', 'javascript.jsx', 'json', 'lua', 'pandoc', 'php',
        'sass', 'scss', 'sh', 'toml', 'typescript', 'typescriptreact',
        'typescript.tsx', 'vim', 'zsh'
    },
    settings = {
        cmd = {'efm-langserver'},
        rootmarkers = {'.git/'},
        languages = {
            -- ["="] = {misspell},
            bash = {shfmt},
            css = {stylelint},
            go = {golint, goimports},
            html = {htmlhint, prettier},
            javascript = {eslint, prettier},
            javascriptreact = {eslint, prettier},
            ['javascript.jsx'] = {eslint, prettier},
            json = {fixjson, prettier},
            -- kotlin = {ktlint},
            -- latex = {lacheck},
            lua = {luafmt},
            pandoc = {pandoc},
            php = {
                prettier, -- psalm,
                phpstan, phpcs
            },
            sass = {prettier, stylelint},
            scss = {prettier, stylelint},
            sh = {shfmt},
            toml = {taplo},
            typescript = {eslint, prettier},
            typescriptreact = {eslint, prettier},
            ['typescript.tsx'] = {eslint, prettier},
            xml = {
                -- xmllint,
                tidy
            },
            -- yaml = {yamllint},
            zsh = {shfmt}
        }
    }
}
