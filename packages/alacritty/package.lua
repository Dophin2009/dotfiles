-- luacheck: globals pkg
local lib = require 'lib'

pkg.name = 'alacritty'
pkg.dependencies:extend('../qt')

pkg.files.trees:clear()
pkg.files.templates:push({
    src = 'config/alacritty.yml.hbs',
    dest = '.config/alacritty/alacritty.yml',
    engine = 'handlebars',
    partials = {
        common = 'config/common.yml',
        profile = 'config/profile.yml.hbs'
    }
})

local profile = require('profile').alacritty
pkg.variables:overwrite(profile)

-- Load local file if it exists
lib.require_opt('local')
