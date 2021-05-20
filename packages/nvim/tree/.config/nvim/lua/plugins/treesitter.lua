-- luacheck: globals vim
local U = require('util')

local treesitter = U.require('nvim-treesitter.configs')
if treesitter ~= nil then
    treesitter.setup {
        ensure_installed = 'maintained',
        highlight = {
            enable = true,
            disable = {'latex', 'r', 'rust', 'scss', 'tex', 'yaml', 'zsh'}
        },
        indent = {enable = true, disable = {'lua', 'rust'}},
        -- External modules
        autotag = {enable = true},
        context_commentstring = {enable = true}
    }
end

