local U = require('util')

local lspconfig = U.require('lspconfig')
local completion = U.require('completion')
local lsp_status = U.require('lsp-status')
local lspfuzzy = U.require('lspfuzzy')

-- fzf selection for LSP actions
if lspfuzzy ~= nil then lspfuzzy.setup {fzf_modifier = ':~:.', fzf_trim = true} end

-- vimtex completion source
if completion ~= nil then
    local vimtex = require('lsp/vimtex')
    completion.addCompletionSource('vimtex', vimtex.complete_item)
end

-- setup lsp servers
if lspconfig ~= nil and completion ~= nil and lsp_status ~= nil then
    -- override handlers
    local handlers = require('lsp/handlers')
    local on_attach = handlers.on_attach
    local capabilities = handlers.capabilities

    -- extra language server configuations
    require('lsp/extra')

    -- bash language server
    lspconfig.bashls.setup {on_attach = on_attach, capabilities = capabilities}

    -- clangd
    lspconfig.clangd.setup {
        handlers = lsp_status.extensions.clangd.setup(),
        init_options = {clangdFileStatus = true},
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- cmake language server
    lspconfig.cmake.setup {on_attach = on_attach, capabilities = capabilities}

    -- css language server
    lspconfig.cssls.setup {on_attach = on_attach, capabilities = capabilities}

    -- dhall lsp server
    lspconfig.dhall_lsp.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- dockerfile language server
    lspconfig.dockerls.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

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
    lspconfig.jedi_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- json language server
    lspconfig.jsonls.setup {on_attach = on_attach, capabilities = capabilities}

    -- lua language server
    lspconfig.sumneko_lua.setup {
        cmd = {'lua-language-server'},
        on_attach = on_attach,
        capabilities = capabilities
        -- settings = {Lua = {diagnostics = {enable = false}}}
    }

    -- r language server
    lspconfig.r_language_server.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- rust analyzer
    lspconfig.rust_analyzer.setup {
        on_attach = on_attach,
        capabilities = capabilities
    }

    -- texlab
    lspconfig.texlab.setup {on_attach = on_attach, capabilities = capabilities}

    -- tsserver
    lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities
    }

    -- vim language server
    lspconfig.vimls.setup {on_attach = on_attach, capabilities = capabilities}

    -- yaml language server
    lspconfig.yamlls.setup {on_attach = on_attach, capabilities = capabilities}

    -- efm-langserver
    local autopep8 = require('lsp/efm/autopep8')
    local eslint = require('lsp/efm/eslint')
    local fixjson = require('lsp/efm/fixjson')
    local flake8 = require('lsp/efm/flake8')
    local goimports = require('lsp/efm/goimports')
    local golint = require('lsp/efm/golint')
    local htmlhint = require('lsp/efm/htmlhint')
    local lacheck = require('lsp/efm/lacheck')
    local luafmt = require('lsp/efm/luafmt')
    local luac = require('lsp/efm/luac')
    -- local misspell = require('lsp/efm/misspell')
    local mypy = require('lsp/efm/mypy')
    local pandoc = require('lsp/efm/pandoc')
    local prettier = require('lsp/efm/prettier')
    local reorder_python_imports = require('lsp/efm/reorder_python_imports')
    local shellcheck = require('lsp/efm/shellcheck')
    local shfmt = require('lsp/efm/shfmt')
    local stylelint = require('lsp/efm/stylelint')
    local yamllint = require('lsp/efm/yamllint')
    local vint = require('lsp/efm/vint')
    lspconfig.efm.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {documentformatting = true},
        settings = {
            rootmarkers = {'.git/'},
            languages = {
                -- ["="] = {misspell},
                bash = {shellcheck},
                css = {stylelint},
                javascript = {eslint, prettier},
                javascriptreact = {eslint, prettier},
                json = {fixjson},
                go = {golint, goimports},
                html = {htmlhint, prettier},
                latex = {lacheck},
                lua = {luafmt, luac},
                pandoc = {pandoc},
                python = {mypy, flake8, autopep8, reorder_python_imports},
                sass = {stylelint},
                scss = {stylelint},
                sh = {shellcheck, shfmt},
                typescript = {eslint, prettier},
                typescriptreact = {eslint, prettier},
                vim = {vint},
                yaml = {yamllint},
                zsh = {shellcheck, shfmt}
            }
        }
    }

end
