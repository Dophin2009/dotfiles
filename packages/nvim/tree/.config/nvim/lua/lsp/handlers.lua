local completion = require('completion')
local lsp_status = require('lsp-status')

local map = function(mode, key, result, noremap)
    if noremap == nil then noremap = true end
    vim.api.nvim_buf_set_keymap(0, mode, key, result,
                                {noremap = noremap, silent = true})
end

-- diagnostics handle
vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        signs = true,
        update_in_insert = true
    })
-- async formatting handle
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

    if client.resolved_capabilities.goto_definition then
        map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    end

    if client.resolved_capabilities.completion then
        completion.on_attach(client, bufnr)
    end

    if client.resolved_capabilities.hover then
        map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
    end

    if client.resolved_capabilities.find_references then
        map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    end

    if client.resolved_capabilities.rename then
        map("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>")
    end

    lsp_status.on_attach(client, bufnr)
end

local capabilities = lsp_status.capabilities

return {on_attach = on_attach, capabilities = capabilities}
