-- luacheck: globals vim
local U = require('util')
local exec = vim.api.nvim_exec

-- Toggle between relative and absolute numbering
U.nmap('<leader>=', '<cmd>set relativenumber!<CR>')

-- Stop hlsearch
U.nmap('<leader>n', '<cmd>nohlsearch<CR>')

-- Tab completion
exec([[
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
]], true)
