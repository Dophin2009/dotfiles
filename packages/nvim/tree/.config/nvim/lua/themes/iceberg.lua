local g, o = vim.g, vim.o
local cmd = vim.cmd

o.background = 'dark'
g.airline_theme = 'icebergDark'

cmd [[ colorscheme iceberg ]]
