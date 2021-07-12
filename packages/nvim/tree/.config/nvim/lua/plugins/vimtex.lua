-- luacheck: globals vim
local g = vim.g
local bind = require 'util.bind'

g.vimtex_enabled = 1

-- Syntax options
g.vimtex_syntax_enabled = 1

-- View options
g.vimtex_view_method = 'zathura'

bind.nmap('gC', '<cmd>VimtexContextMenu<CR>', {noremap = true})
