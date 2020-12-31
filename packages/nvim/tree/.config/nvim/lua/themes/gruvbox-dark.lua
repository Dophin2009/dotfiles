local g, o = vim.g, vim.o
local cmd = vim.cmd

-- Use gruvbox theme
o.background = 'dark'
g.gruvbox_material_better_performance = 1
g.gruvbox_material_background = 'medium'
g.airline_theme = 'gruvbox_material'
cmd [[colorscheme gruvbox-material]]
