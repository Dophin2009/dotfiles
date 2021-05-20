-- luacheck: globals vim
local U = require 'util'

-- Initialize colorscheme
local shared = require('themes/gruvbox/shared')
shared.colorscheme('dark', 'material', 'medium')

-- Initialize lualine
local lualine = require('themes/common/lualine')
lualine.setup('gruvbox_material')

-- Treesitter highlight modifications
local hilink = U.hi.link
hilink.TSField = 'Fg'
-- hilink.TSKeyword = 'RedItalic'
hilink.TSKeywordOperator = 'Orange'
hilink.TSNamespace = 'Orange'
hilink.TSProperty = 'Fg'
hilink.TSString = 'GreenItalic'
hilink.TSType = 'Fg'
hilink.TSTypeBuiltin = 'Yellow'
hilink.TSVariableBuiltin = 'BlueItalic'
-- Bold on function calls
hilink.TSFunction = 'GreenBold'
hilink.TSMethod = 'GreenBold'
