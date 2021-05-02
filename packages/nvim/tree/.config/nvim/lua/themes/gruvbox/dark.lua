-- luacheck: globals vim
local shared = require('themes/gruvbox/shared')
local U = require 'util'

local hilink = U.hi.link

-- Initialize colorscheme
shared.colorscheme('light', 'original', 'hard')

-- Treesitter highlight modifications
hilink.TSField = 'Fg'
hilink.TSNamespace = 'Orange'
hilink.TSProperty = 'Fg'
hilink.TSString = 'GreenItalic'
hilink.TSTypeBuiltin = 'Yellow'
hilink.TSVariableBuiltin = 'BlueItalic'
-- Bold on function calls
hilink.TSFunction = 'Green'
hilink.TSMethod = 'Green'
