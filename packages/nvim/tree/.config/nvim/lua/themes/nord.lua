-- luacheck: globals vim
local g, o = vim.g, vim.o
local exec = vim.api.nvim_exec

-- Use nord colorscheme
o.background = 'dark'
g.airline_theme = 'nord_minimal'

exec([[
try
  colorscheme nord
  catch
endtry
]], true)
