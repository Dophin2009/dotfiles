require('lib')

pkg.name = 'bat'

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/bat/config.tmpl',
    dest = '.config/bat/config',
    engine = 'gotmpl'
})

local profile = require('profile').bat
pkg.variables:overwrite(profile)

-- Load local file if it exists
require_opt('local')
