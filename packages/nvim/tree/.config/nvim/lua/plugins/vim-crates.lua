-- luacheck: globals vim
local exec = vim.api.nvim_exec

-- detect Cargo.toml
exec([[
aug ftdetect_cargotoml
  autocmd BufRead Cargo.toml call crates#toggle()
aug end
]], true)
