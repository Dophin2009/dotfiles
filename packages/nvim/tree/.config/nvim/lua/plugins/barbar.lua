-- luacheck: globals vim
local U = require('util')
local nmap = U.bind.nmap

local g = vim.g

-- Tabline options
g.bufferline = {
    -- Enable animations
    animation = true,
    -- Enable close button
    closable = true,
    -- Disable icons
    icons = false,
    -- Lettters to assign buffer in order
    letters = 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP',
    -- Maximum padding width surrounding each tab
    maximum_padding = 4,
    -- Set buffer letters first in terms of their name
    semantic_letters = true
}

-- Select tab
nmap('<C-s>', '<cmd>BufferPick<CR>', {silent = true})
-- Move to previous/next tab
nmap('t,', '<cmd>BufferPrevious<CR>', {silent = true})
nmap('t.', '<cmd>BufferNext<CR>', {silent = true})
-- Re-order to previous/next
nmap('t<', '<cmd>BufferMovePrevious<CR>', {silent = true})
nmap('t>', '<cmd>BufferMoveNext<CR>', {silent = true})
-- Goto buffer in position
nmap('t1', '<cmd>BufferGoto 1<CR>', {silent = true})
nmap('t2', '<cmd>BufferGoto 2<CR>', {silent = true})
nmap('t3', '<cmd>BufferGoto 3<CR>', {silent = true})
nmap('t4', '<cmd>BufferGoto 4<CR>', {silent = true})
nmap('t5', '<cmd>BufferGoto 5<CR>', {silent = true})
nmap('t6', '<cmd>BufferGoto 6<CR>', {silent = true})
nmap('t7', '<cmd>BufferGoto 7<CR>', {silent = true})
nmap('t8', '<cmd>BufferGoto 8<CR>', {silent = true})
nmap('t9', '<cmd>BufferLast<CR>', {silent = true})
-- Close buffer
nmap('tc', ' <cmd>BufferClose<CR>', {silent = true})
