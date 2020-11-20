require('lib')

pkg.name = 'user-dirs'

pkg.files.trees:clear()
pkg.files.templates:extend({
    src = 'config/user-dirs.dirs.hbs',
    dest = '.config/user-dirs.dirs',
    engine = 'handlebars'
})

local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
require_opt('local')
