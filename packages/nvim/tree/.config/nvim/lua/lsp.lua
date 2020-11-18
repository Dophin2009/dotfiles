local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local completion = require('completion')
local lsp_status = require('lsp-status')

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
    -- hack fix for bug(?)
    -- client.config = {callbacks = {}}
    completion.on_attach(client, bufnr)
    lsp_status.on_attach(client, bufnr)
end

-- bash language server
nvim_lsp.bashls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- clangd
nvim_lsp.clangd.setup {
    callbacks = lsp_status.extensions.clangd.setup(),
    init_options = {clangdFileStatus = true},
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- cmake language server
nvim_lsp.cmake.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- dhall lsp server
configs.dhall_lsp = {
    default_config = {
        cmd = {'dhall-lsp-server'},
        filetypes = {'dhall'},
        root_dir = function(fname)
            return nvim_lsp.util.find_git_ancestor(fname) or
                       vim.loop.os_homedir()
        end,
        settings = {}
    }
}
nvim_lsp.dhall_lsp.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- dockerfile language server
nvim_lsp.dockerls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- haskell ide engine
nvim_lsp.hie.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- jedi language server
nvim_lsp.jedi_language_server.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- lua language server
nvim_lsp.sumneko_lua.setup {
    cmd = {'lua-language-server'},
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    settings = {Lua = {diagnostics = {enable = false}}}
}
-- r language server
nvim_lsp.r_language_server.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- rust analyzer
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
-- vim language server
nvim_lsp.vimls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
}
