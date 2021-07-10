-- luacheck: globals vim
local g = vim.g

-- Set guide character
g.indentLine_char = 'ˌ'

-- Disable on dashboard
g.indentLine_fileTypeExclude = {'dashboard'}

-- Disable setting concealcursor
g.indentLine_setConceal = 0
