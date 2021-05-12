-- luacheck: globals vim
local g = vim.g
local U = require 'util'

-- Disable default mappings
g.splitjoin_split_mapping = ''
g.splitjoin_join_mapping = ''

-- Use custom mappings
U.bind.nmap('<leader>j', '<cmd>SplitjoinJoin<CR>')
U.bind.nmap('<leader>s', '<cmd>SplitjoinSplit<CR>')
