require('lib')

pkg.name = 'dunst'

pkg.files.trees:clear()
pkg.files.templates:push({
    src = 'config/dunstrc.ini.hbs',
    dest = '.config/dunst/dunstrc',
    engine = 'handlebars'
})

pkg.hooks.post:push({name = 'Restart dunst', command = 'hooks/dunst-restart.sh'})

local profile = require('profile').dunst
pkg.variables:overwrite(profile)

-- Load local config if exists
require_opt('local')
