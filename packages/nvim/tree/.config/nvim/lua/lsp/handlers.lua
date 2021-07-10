-- luacheck: globals vim
local U = require 'util'

-- Diagnostics handler
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true
    })

-- Async formatting handle
vim.g.format = true
vim.cmd [[command! FormatOn :lua vim.g.format = true ]]
vim.cmd [[command! FormatOff :lua vim.g.format = false ]]
vim.cmd [[command! FormatToggle :lua vim.g.format = not vim.g.format ]]

vim.lsp.handlers['textDocument/formatting'] =
    function(err, _, result, _, bufnr)
        if not vim.g.format then return end
        if err ~= nil or result == nil then return end
        if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
            local view = vim.fn.winsaveview()
            vim.lsp.util.apply_text_edits(result, bufnr)
            vim.fn.winrestview(view)
            if bufnr == vim.api.nvim_get_current_buf() then
                vim.api.nvim_command('noautocmd :update')
            end
        end
    end

-- Grouped on_attach
local on_attach = function(client, bufnr)
    -- Set omnifunc
    local buf_opt = function(name, value) U.buf_opt(bufnr, name, value) end
    buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Bind lsp functionality for this buffer
    local bufmap = function(mode, lhs, rhs)
        U.bind.buf.map(bufnr, mode, lhs, rhs, {noremap = false})
    end

    -- Goto definition
    bufmap('n', 'gd', '<cmd>LSPGotoDefinition<CR>')
    -- Goto declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    -- Goto implementation
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    -- Goto type definition
    bufmap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- Show hover information
    bufmap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
    -- Show signature help
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    -- List references
    -- bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    bufmap('n', 'gr', '<cmd>LSPReferences<CR>')
    -- Rename the hovered symbol
    bufmap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
    -- Select a code action
    -- bufmap('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    bufmap('n', 'gc', '<cmd>LSPActions<CR>')
    -- Show diagnostics for the current line
    bufmap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    -- Go to previous diagnostic
    bufmap('n', 'gN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    -- Go to next diagnostic
    bufmap('n', 'gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    -- Show document diagnostics list
    -- bufmap('n', 'gQ', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
    bufmap('n', 'gQ', '<cmd>LSPDiagnostics<CR>')
    -- Show workspace diagnostics list
    bufmap('n', 'gwQ', '<cmd>LSPWDiagnostics<CR>')
    -- Workspace functionality
    bufmap('n', 'gwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
    bufmap('n', 'gwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
    bufmap('n', 'gwl',
           '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

    -- If server supports formatting, format on save.
    -- TODO: Toggle for formatting
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end

    -- If range formatting is supported, add a keybind
    if client.resolved_capabilities.document_range_formatting then
        bufmap('v', '<space>f', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
    end

    -- Attach signature help
    local signature = require('lsp_signature')
    signature.on_attach()

    -- Attach word highlighting
    -- local illuminate = require('illuminate')
    -- illuminate.on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable snippets
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

return {on_attach = on_attach, capabilities = capabilities}
