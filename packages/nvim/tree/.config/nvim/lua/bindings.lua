-- luacheck: globals vim
local bind = require('util').bind

-- Toggle between relative and absolute numbering
bind.nmap('<leader>=', '<cmd>set relativenumber!<CR>')

-- Stop hlsearch
bind.nmap('<leader>n', '<cmd>nohlsearch<CR>')

bind.imap('<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', {noremap = true})
