local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local completion = require('completion')
local lsp_status = require('lsp-status')

completion.addCompletionSource('vimtex', require('vimtex').complete_item)

-- diagnostics handle
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true
    })

-- grouped on_attach
local on_attach = function(client, bufnr)
    completion.on_attach(client, bufnr)
    lsp_status.on_attach(client, bufnr)
end

-- bash language server
lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- clangd
lspconfig.clangd.setup {
    handlers = lsp_status.extensions.clangd.setup(),
    init_options = {clangdFileStatus = true},
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- cmake language server
lspconfig.cmake.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- cssls
lspconfig.cssls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- diagnosticls
lspconfig.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    filetypes = {
        'javascript', 'typescript', 'javascriptreact', 'typescriptreact'
    },
    init_options = {
        linters = {
            eslint = {
                command = './node_modules/.bin/eslint',
                rootPatterns = {'.git', 'package.json'},
                debounce = 100,
                args = {
                    '--stdin', '--stdin-filename', '%filepath', '--format',
                    'json'
                },
                sourceName = 'eslint',
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {[2] = 'error', [1] = 'warning'}
            }
        },
        filetypes = {
            javascript = 'eslint',
            typescript = 'eslint',
            javascriptreact = 'eslint',
            typescriptreact = 'eslint'
        }
    }
}
-- dhall lsp server
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
lspconfig.dhall_lsp.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- dockerfile language server
lspconfig.dockerls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- haskell ide engine
lspconfig.hie.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- jedi language server
lspconfig.jedi_language_server.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- lua language server
lspconfig.sumneko_lua.setup {
    cmd = {'lua-language-server'},
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    settings = {Lua = {diagnostics = {enable = false}}}
}
-- r language server
lspconfig.r_language_server.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- rust analyzer
lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- texlab
lspconfig.texlab.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- tsserver
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- vim language server
lspconfig.vimls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
