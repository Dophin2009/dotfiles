require('lib')

pkg.name = 'hangups'

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/hangups/hangups.conf.tmpl',
    dest = '.config/hangups/hangups.conf',
    engine = 'gotmpl'
})

local profile = require('profile').hangups
pkg.variables:overwrite(profile)
