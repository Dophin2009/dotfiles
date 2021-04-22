-- luacheck: globals vim
local exec = vim.api.nvim_exec

-- Enable inlay hints for Rust
-- luacheck: no max_line_length
exec([[
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText" }
]], true)
