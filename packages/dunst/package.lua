require('lib')

pkg.name = 'dunst'

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/dunst/dunstrc.tmpl',
    dest = '.config/dunst/dunstrc',
    engine = 'gotmpl'
})

pkg.hooks.post:push({name = 'Restart dunst', command = 'hooks/dunst-restart.sh'})

local profile = require('profile').dunst
pkg.variables:overwrite(profile)

-- Load local config if exists
require_opt('local')
