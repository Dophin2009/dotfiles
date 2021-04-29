-- luacheck: globals vim
local g, o = vim.g, vim.o
local exec = vim.api.nvim_exec

-- Use gruvbox-material colorscheme
o.background = 'dark'
g.gruvbox_material_background = 'medium'
g.airline_theme = 'gruvbox_material'

-- Enable bold function name
g.gruvbox_material_enable_bold = 1

-- Enable diagnostic highlighting
g.gruvbox_material_diagnostic_text_highlight = 1
g.gruvbox_material_diagnostic_line_highlight = 1

-- Better performance setting
g.gruvbox_material_better_performance = 1

exec([[
try
  colorscheme gruvbox-material
  catch
endtry
]], true)
