-- Load language server configurations
require('lsp/servers')

-- Load keybindings
require('lsp/bindings')

-- Show diagnostics on hover
vim.api.nvim_exec([[ 
aug lsp_autocmds
  autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
aug END
]], true)
