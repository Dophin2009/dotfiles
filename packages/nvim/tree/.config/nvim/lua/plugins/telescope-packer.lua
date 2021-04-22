-- luacheck: globals vim
local cmd = vim.cmd

local telescope = require('telescope')
telescope.load_extension('packer')

cmd [[ command Plugins :lua require('telescope').extensions.packer.plugins() ]]
