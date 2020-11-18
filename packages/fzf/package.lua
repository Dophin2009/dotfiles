require('lib')

pkg.name = 'fzf'
pkg.dependencies:extend('../sh')

local profile = require('profile').fzf
pkg.files.extra:push({
    src = 'themes/' .. profile.name,
    dest = '.config/sh/envc/fzf'
})

