local U = require('util')
local g = vim.g

-- More compact
g.tagbar_compact = 1
g.tagbar_indent = 1

-- Set to be wider
g.tagbar_width = 60

-- Show line numbers
g.tagbar_show_linenumbers = 1

-- Autoclose and autofocus
g.tagbar_autoclose = 1
g.tagbar_autofocus = 1

-- Toggle tagbar
U.nmap('<leader>y', '<cmd>TagbarToggle<CR>', {silent = true})
