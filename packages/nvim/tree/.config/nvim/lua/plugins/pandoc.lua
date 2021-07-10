-- luacheck: globals vim
local g = vim.g

-- Disable pandoc modules
g['pandoc#modules#disabled'] = {'folding', 'spell'}
