require 'lib'

pkg.name = 'alacritty'
pkg.dependencies:extend('../qt')

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/alacritty/alacritty.yml.tmpl',
    dest = '.config/alacritty/alacritty.yml',
    engine = "gotmpl"
})

local profile = require('profile').alacritty
pkg.variables:overwrite(profile)

-- Load local file if it exists
require_opt('local')
