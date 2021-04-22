-- luacheck: globals vim
local U = require('util')
local nmap = U.nmap

-- Some bindings
nmap('<leader>di', '<cmd>ToggleDitto<CR>')
nmap('<leader>=d', '<Plug>DittoNext')
nmap('<leader>-d', '<Plug>DittoPrev')
nmap('<leader>+d', '<Plug>DittoGood')
nmap('<leader>_d', '<Plug>DittoBad')
nmap('<leader>]d', '<Plug>DittoMore')
nmap('<leader>[d', '<Plug>DittoLess')
