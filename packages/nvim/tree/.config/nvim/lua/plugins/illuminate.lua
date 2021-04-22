-- luacheck: globals vim
local U = require('util')

U.nmap('<C-n>',
       [[ <cmd>lua require('illuminate').next_reference{wrap=true}<CR> ]])
U.nmap('<C-p>',
       [[ <cmd>lua require('illuminate').next_reference{reverse=true, wrap=true}<CR> ]])
