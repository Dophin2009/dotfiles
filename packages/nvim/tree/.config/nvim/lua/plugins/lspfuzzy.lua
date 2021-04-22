-- luacheck: globals vim
local U = require('util')
local lspfuzzy = U.require('lspfuzzy')

-- fzf selection for LSP actions
if lspfuzzy ~= nil then lspfuzzy.setup {fzf_modifier = ':~:.', fzf_trim = true} end
