local g, o = vim.g, vim.o
local exec = vim.api.nvim_exec

-- Use iceberg theme
o.background = 'dark'
g.airline_theme = 'icebergDark'

exec([[
try
  colorscheme iceberg
  catch
endtry
]], true)
