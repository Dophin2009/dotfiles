-- luacheck: globals vim
local o = vim.o
local exec = vim.api.nvim_exec

-- Use nord colorscheme
o.background = 'dark'
exec([[
try
  colorscheme nord
  catch
endtry
]], true)

-- Initialize lualine
local lualine = require('themes/common/lualine')
lualine.setup('nord')
