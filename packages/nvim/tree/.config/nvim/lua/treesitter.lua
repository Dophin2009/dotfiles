local U = require('util')

local treesitter = U.require('nvim-treesitter.configs')
local colorizer = U.require('colorizer')

if treesitter ~= nil then
    treesitter.setup {
        ensure_installed = 'maintained',
        highlight = {enable = false, disable = {'rust', 'python', 'zsh'}}
    }
end

if colorizer ~= nil then
    colorizer.setup {
        '*',
        css = {rgb_fn = true},
        html = {names = false},
        pandoc = {names = false}
    }
end
