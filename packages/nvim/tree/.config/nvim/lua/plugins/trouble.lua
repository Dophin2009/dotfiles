-- luacheck: globals vim
local U = require 'util'
local trouble = require 'trouble'
trouble.setup {}

U.bind.nmap('gL', '<cmd>LspTroubleDocumentOpen<CR>')
U.bind.nmap('gwL', '<cmd>LspTroubleWorkspaceOpen<CR>')
