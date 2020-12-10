local lspconfig = require('lspconfig')
local completion = require('completion')
local lsp_status = require('lsp-status')

-- vimtex completion source
local vimtex = require('lsp/vimtex')
completion.addCompletionSource('vimtex', vimtex.complete_item)

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

-- cssls
lspconfig.cssls.setup {on_attach = on_attach, capabilities = capabilities}

-- dhall lsp server
lspconfig.dhall_lsp.setup {on_attach = on_attach, capabilities = capabilities}

-- dockerfile language server
lspconfig.dockerls.setup {on_attach = on_attach, capabilities = capabilities}

-- haskell ide engine
lspconfig.hie.setup {on_attach = on_attach, capabilities = capabilities}

-- jedi language server
lspconfig.jedi_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- lua language server
lspconfig.sumneko_lua.setup {
    cmd = {'lua-language-server'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {Lua = {diagnostics = {enable = false}}}
}

-- pyls
lspconfig.pyls.setup {on_attach = on_attach, capabilities = capabilities}
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

-- efm-langserver
local eslint = require('lsp/efm/eslint')
local luafmt = require('lsp/efm/luafmt')
local luacheck = require('lsp/efm/luacheck')
local prettier = require('lsp/efm/prettier')
lspconfig.efm.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            javascript = {eslint, prettier},
            javascriptreact = {eslint, prettier},
            lua = {luafmt, luacheck},
            typescript = {eslint, prettier},
            typescriptreact = {eslint, prettier}
        }
    }
}
