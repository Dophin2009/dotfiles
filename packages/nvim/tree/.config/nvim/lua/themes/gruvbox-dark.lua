-- luacheck: globals vim
local g, o = vim.g, vim.o
local exec = vim.api.nvim_exec
local U = require 'util'

local hilink = U.hilink

-- Use gruvbox-material colorscheme
o.background = 'dark'
g.gruvbox_material_background = 'medium'

-- Enable bold function name
g.gruvbox_material_enable_bold = 1

-- Enable diagnostic highlighting
g.gruvbox_material_diagnostic_text_highlight = 1
g.gruvbox_material_diagnostic_line_highlight = 1

-- Better performance setting
g.gruvbox_material_better_performance = 1

-- Initialize colorscheme
exec([[
try
  colorscheme gruvbox-material
  catch
endtry
]], true)

--
-- Treesitter highlight modifications
--
hilink.TSField = 'Fg'
hilink.TSProperty = 'Fg'
hilink.TSString = 'GreenItalic'
hilink.TSTypeBuiltin = 'Yellow'
hilink.TSVariableBuiltin = 'BlueItalic'

-- Bold on function calls
hilink.TSFunction = 'Green'
hilink.TSMethod = 'Green'
