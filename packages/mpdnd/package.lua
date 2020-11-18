require('lib')

pkg.name = 'mpdnd'
pkg.dependencies:extend('../sh', '../mpd')

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:extend({
    src = 'tree/.config/mpdnd/config.toml.tmpl',
    dest = '.config/mpdnd/config.toml',
    engine = 'gotmpl'
}, {
    src = "tree/.config/systemd/user/mpdnd.service.tmpl",
    dest = ".config/systemd/user/mpdnd.service",
    engine = 'gotmpl'
})

local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
require_opt('local')
