-- luacheck: globals vim
-- Initialize colorscheme
local shared = require('themes/gruvbox/shared')
shared.colorscheme('light', 'original', 'medium')

-- Initialize lualine
local lualine = require('themes/common/lualine')
-- TODO: light theme
lualine.setup('gruvbox-material')
