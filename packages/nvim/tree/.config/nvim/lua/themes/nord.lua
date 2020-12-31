local g, o = vim.g, vim.o
local cmd = vim.cmd

o.background = 'dark'
g.airline_theme = 'nord_minimal'

cmd [[ colorscheme nord ]]
