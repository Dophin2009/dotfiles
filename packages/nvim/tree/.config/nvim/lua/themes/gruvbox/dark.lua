-- luacheck: globals vim
local U = require 'util'

-- Initialize colorscheme
local shared = require('themes/gruvbox/shared')
shared.colorscheme('light', 'original', 'hard')

-- Initialize lualine
local lualine = require('themes/common/lualine')
lualine.setup('gruvbox-material')

-- Treesitter highlight modifications
local hilink = U.hi.link
hilink.TSField = 'Fg'
hilink.TSNamespace = 'Orange'
hilink.TSProperty = 'Fg'
hilink.TSString = 'GreenItalic'
hilink.TSTypeBuiltin = 'Yellow'
hilink.TSVariableBuiltin = 'BlueItalic'
-- Bold on function calls
hilink.TSFunction = 'Green'
hilink.TSMethod = 'Green'
