require('lib')

pkg.name = 'hangups'

pkg.files.trees:clear()
pkg.files.templates:push({
    src = 'config/hangups.conf.hbs',
    dest = '.config/hangups/hangups.conf',
    engine = 'handlebars'
})

local profile = require('profile').hangups
pkg.variables:overwrite(profile)
