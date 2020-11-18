require('lib')

pkg.name = 'nvim'
pkg.dependencies:extend('../sh')

local profile = require('profile').nvim
pkg.files.extra:extend({
    src = 'tree/.config/nvim/themes/' .. profile.theme .. '.vim',
    dest = '.config/nvim/theme.vim'
})

-- Load local file if it exists
require_opt('local')
