local lib = require('lib')

pkg.name = 'mpdnd'
pkg.dependencies:extend('../sh', '../mpd')

pkg.files.trees:clear()
pkg.files.templates:extend({
    src = 'config/config.toml.hbs',
    dest = '.config/mpdnd/config.toml',
    engine = 'handlebars'
}, {
    src = "config/mpdnd.service.hbs",
    dest = ".config/systemd/user/mpdnd.service",
    engine = 'handlebars'
})

local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
lib.require_opt('local')
