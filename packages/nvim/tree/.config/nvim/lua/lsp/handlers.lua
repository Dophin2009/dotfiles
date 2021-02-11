-- local lsp_status = require('lsp-status')

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

-- grouped on_attach
local on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api
            .nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end

    local completion = require('completion')
    local illuminate = require('illuminate')

    completion.on_attach(client, bufnr)
    -- lsp_status.on_attach(client, bufnr)
    illuminate.on_attach(client, bufnr)
end

-- local capabilities = lsp_status.capabilities
local capabilities = nil

return {on_attach = on_attach, capabilities = capabilities}
