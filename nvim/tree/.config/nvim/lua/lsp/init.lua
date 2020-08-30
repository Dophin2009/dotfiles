local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')
local diagnostic = require('diagnostic')
local lsp_status = require('lsp-status')

local indicators = {errors = 'E', warnings = 'W'}

-- lsp-status configuration
lsp_status.register_progress()

lsp_status.config({
    status_symbol = '',
    indicator_errors = 'E',
    indicator_warnings = 'W',
    indicator_info = 'I',
    indicator_hint = 'H',
    indicator_ok = '✔️',
    spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'}
})

-- grouped on_attach
local on_attach = function(client, bufnr)
    diagnostic.on_attach(client, bufnr)
    lsp_status.on_attach(client, bufnr)

    vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gD",
                           "<cmd>lua vim.lsp.buf.implementation()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "<c-k>",
                           "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "1gD",
                           "<cmd>lua vim.lsp.buf.type_definition()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "g0",
                           "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
                           {noremap = true, silent = true})
    vim.fn.nvim_set_keymap("n", "gW",
                           "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
                           {noremap = true, silent = true})
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
    cmd = {"lua-language-server"},
    on_attach = on_attach,
    capabilities = lsp_status.capabilities
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

local warning_status = function()
    local indicator = indicators.warnings;
    local warning_count = lsp_status.diagnostics().warning
    if warning_count == nil or warning_count == '' then return '' end

    if warning_count == 0 then return '' end
    return indicator .. ':' .. warning_count
end

local error_status = function()
    local indicator = indicators.errors;
    local error_count = lsp_status.diagnostics().errors
    if error_count == nil or error_count == '' then return indicator .. ':0' end
    if error_count == 0 then return '' end
    return indicator .. ':' .. error_count
end

return {warning_status = warning_status, error_status = error_status}
