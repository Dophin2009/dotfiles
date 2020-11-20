require('lib')

pkg.name = 'x11'
pkg.dependencies:extend('../sh')

pkg.files.extra:extend({
    src = 'xinitrc.local',
    dest = '.config/X11/xinitrc.local'
})

local profile = require('profile').x11
pkg.variables:overwrite(profile)

local xresources_theme = 'xresources.theme'
pkg.files.trees:front().ignore:extend('**/*.hbs')
pkg.files.templates:extend({
    src = 'tree/.config/X11/xresources.theme.hbs',
    dest = '.config/X11/' .. xresources_theme,
    engine = 'handlebars'
})

local home = os.getenv('HOME')
pkg.hooks.post:extend({
    name = 'Load ' .. xresources_theme,
    command = 'hooks/xrdb-merge.sh "' .. home .. '/.config/X11/' ..
        xresources_theme .. '"'
})

-- Load local file if it exists
require_opt('local')
