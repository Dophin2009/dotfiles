-- luacheck: globals vim
local g, o = vim.g, vim.o
local exec = vim.api.nvim_exec

-- Use gruvbox-material colorscheme
o.background = 'dark'
g.gruvbox_material_better_performance = 1
g.gruvbox_material_background = 'medium'
g.airline_theme = 'gruvbox_material'

exec([[
try
  colorscheme gruvbox-material
  catch
endtry
]], true)
