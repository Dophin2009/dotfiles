local g, o = vim.g, vim.o
local exec = vim.api.nvim_exec

-- Use sakura colorscheme
o.background = 'dark'

exec([[
try
  colorscheme sakura
  catch
endtry
]], true)
