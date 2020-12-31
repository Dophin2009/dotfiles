local colorizer = require('colorizer')
colorizer.setup {
    '*',
    css = {rgb_fn = true},
    html = {names = false},
    pandoc = {names = false}
}
