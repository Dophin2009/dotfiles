-- luacheck: globals vim
local U = require 'util'

-- Setup sniprun
local sniprun = require 'sniprun'
sniprun.setup{}

-- Set mappings
U.bind.vmap('<leader>ff', '<Plug>SnipRun')
U.bind.nmap('<leader>f', '<Plug>SnipRunOperator')
U.bind.nmap('<leader>ff', '<Plug>SnipRun')
