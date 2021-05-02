local lib = require('lib')

pkg.name = 'task'
pkg.dependencies:extend('../sh')

local profile = require('profile').task
pkg.files.extra:extend({
    src = 'tree/.config/task/themes/' .. profile.theme .. '.theme',
    dest = '.config/task/theme.theme'
})

-- Load local file if it exists
lib.require_opt('local')
