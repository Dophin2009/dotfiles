local treesitter = require('nvim-treesitter.configs')
local colorizer = require('colorizer')

if not (treesitter == nil) then
    treesitter.setup {
        ensure_installed = 'maintained',
        highlight = {enable = true, disable = {'rust', 'zsh'}}
    }
end

if not (colorizer == nil) then
    colorizer.setup {
        '*',
        css = {rgb_fn = true},
        html = {names = false},
        pandoc = {names = false}
    }
end
