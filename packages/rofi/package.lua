require('lib')

pkg.name = 'rofi'

pkg.files.trees:front().ignore:extend('**/*.tmpl')
pkg.files.templates:extend({
    src = 'tree/.config/rofi/config.rasi.tmpl',
    dest = '.config/rofi/config.rasi',
    engine = 'gotmpl'
})

local profile = require('profile').rofi
pkg.variables:overwrite(profile)

-- Load local file if it exists
require_opt('local')
