local lib = require('lib')

pkg.name = 'termite'

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:extend({
    src = 'tree/.config/termite/config.tmpl',
    dest = '.config/termite/config',
    engine = 'gotmpl'
})

local profile = require('profile').termite
pkg.variables:overwrite(profile)

-- Load local file if it exists
lib.require_opt('local')
