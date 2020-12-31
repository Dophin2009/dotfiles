local U = require('util')

local colorizer = U.require('colorizer')
if colorizer ~= nil then
    colorizer.setup {
        '*',
        css = {rgb_fn = true},
        html = {names = false},
        pandoc = {names = false}
    }
end
