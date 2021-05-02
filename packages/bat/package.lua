-- luacheck: globals pkg
local lib = require('lib')

pkg.name = 'bat'

pkg.files.trees:clear()
pkg.files.templates:push({
    src = 'config/config.hbs',
    dest = '.config/bat/config',
    engine = 'handlebars'
})

local profile = require('profile').bat
pkg.variables:overwrite(profile)

-- Load local file if it exists
lib.require_opt('local')
