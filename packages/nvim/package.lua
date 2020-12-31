require('lib')

pkg.name = 'nvim'
pkg.dependencies:extend('../sh')

local profile = require('profile').nvim
pkg.files.extra:extend({
    src = 'tree/.config/nvim/lua/themes/' .. profile.theme .. '.lua',
    dest = '.config/nvim/lua/theme.lua'
})

-- Load local file if it exists
require_opt('local')
