local U = require('util')
local nmap = U.nmap
local exec = vim.api.nvim_exec

-- Some bindings
nmap('<leader>di', '<cmd>ToggleDitto<CR>')
nmap('<leader>=d', '<Plug>DittoNext')
nmap('<leader>-d', '<Plug>DittoPrev')
nmap('<leader>+d', '<Plug>DittoGood')
nmap('<leader>_d', '<Plug>DittoBad')
nmap('<leader>]d', '<Plug>DittoMore')
nmap('<leader>[d', '<Plug>DittoLess')

-- Turn on Ditto for filetypes
exec([[
aug ditto_on
  au FileType markdown,pandoc,text,tex DittoOn
aug END
]], true)
