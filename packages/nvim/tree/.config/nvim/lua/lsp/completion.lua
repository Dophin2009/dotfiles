local U = require('util')
local completion = U.require('completion')

local g = vim.g

g.completion_auto_change_source = 1
g.completion_enable_snippet = 'snippets.nvim'
