local completion = require('completion')
local lsp_status = require('lsp-status')

-- Diagnostics handler
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true
    })

-- Async formatting handle
vim.lsp.handlers["textDocument/formatting"] =
    function(err, _, result, _, bufnr)
        if err ~= nil or result == nil then return end
        if not vim.api.nvim_buf_get_option(bufnr, "modified") then
            local view = vim.fn.winsaveview()
            vim.lsp.util.apply_text_edits(result, bufnr)
            vim.fn.winrestview(view)
            if bufnr == vim.api.nvim_get_current_buf() then
                vim.api.nvim_command("noautocmd :update")
            end
        end
    end

-- Goto definition handler
vim.lsp.handlers['textDocument/definition'] =
    require'lsputil.locations'.definition_handler

-- References handler
vim.lsp.handlers['textDocument/references'] =
    require'lsputil.locations'.references_handler

-- Goto declaration handler
vim.lsp.handlers['textDocument/declaration'] =
    require'lsputil.locations'.declaration_handler

-- Goto type definition handler
vim.lsp.handlers['textDocument/typeDefinition'] =
    require'lsputil.locations'.typeDefinition_handler

-- Goto implementation handler
vim.lsp.handlers['textDocument/implementation'] =
    require'lsputil.locations'.implementation_handler

-- Document symbol handler
vim.lsp.handlers['textDocument/documentSymbol'] =
    require'lsputil.symbols'.document_handler

-- Workspace symbol handler
vim.lsp.handlers['workspace/symbol'] =
    require'lsputil.symbols'.workspace_handler

-- Code action handler
vim.lsp.handlers['textDocument/codeAction'] =
    require'lsputil.codeAction'.code_action_handler

-- grouped on_attach
local on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end

    if completion then completion.on_attach(client, bufnr) end
    if lsp_status then lsp_status.on_attach(client, bufnr) end
end

local capabilities = lsp_status.capabilities

return {on_attach = on_attach, capabilities = capabilities}
