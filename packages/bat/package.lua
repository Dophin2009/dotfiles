require('lib')

pkg.name = 'bat'

pkg.files.trees:front().ignore:push('**/*.hbs')
pkg.files.templates:push({
    src = 'tree/.config/bat/config.hbs',
    dest = '.config/bat/config',
    engine = 'handlebars'
})

local profile = require('profile').bat
pkg.variables:overwrite(profile)

-- Load local file if it exists
require_opt('local')
