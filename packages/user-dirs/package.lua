require('lib')

pkg.name = 'user-dirs'

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:extend({
    src = 'tree/.config/user-dirs.dirs.tmpl',
    dest = '.config/user-dirs.dirs',
    engine = 'gotmpl'
})

local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
require_opt('local')
