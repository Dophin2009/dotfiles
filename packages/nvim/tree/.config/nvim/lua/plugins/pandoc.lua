-- luacheck: globals vim
local g = vim.g

-- Disable pandoc modules
g['pandoc#modules#disabled'] = {'folding', 'spell'}

-- Disble conceal
g['pandoc#syntax#conceal#use'] = 0
