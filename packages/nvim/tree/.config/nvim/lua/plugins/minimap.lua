-- luacheck: globals vim
local U = require('util')

-- Toggle minimap
U.nmap('<leader>m', '<cmd>MinimapToggle<CR>', {silent = true})
