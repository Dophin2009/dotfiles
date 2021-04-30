-- luacheck: globals vim
local bind = require('util').bind

-- Toggle between relative and absolute numbering
bind.nmap('<leader>=', '<cmd>set relativenumber!<CR>')

-- Stop hlsearch
bind.nmap('<leader>n', '<cmd>nohlsearch<CR>')
