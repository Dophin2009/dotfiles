-- luacheck: globals vim
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

-- Initialize lualine
local lualine = require('themes/common/lualine')
lualine.setup('iceberg_dark')
