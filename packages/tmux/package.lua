require('lib')

pkg.name = 'tmux'
pkg.dependencies:extend('../sh')

local profile = require('profile').tmux
pkg.files.extra:push({
    src = 'tree/.config/tmux/themes/' .. profile.theme .. '.conf',
    dest = '.config/tmux/theme.conf'
})

pkg.hooks.post:push({name = 'Reload tmux', command = 'hooks/reload-tmux.sh'})

-- Load local file if it exists
require_opt('local')
