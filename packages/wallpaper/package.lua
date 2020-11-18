require('lib')

pkg.name = 'wallpaper'
pkg.dependencies:extend('../sh')

pkg.hooks.post:extend({
    name = 'Reload wallpaper',
    command = 'hooks/reload-wallpaper.sh'
})

local profile = require('profile').wallpaper
pkg.files.extra:extend({
    src = 'images',
    dest = '.config/wallpaper/images',
    replace_dirs = true
}, {
    src = 'images/' .. profile.name .. '.jpg',
    dest = '.config/wallpaper/still.jpg'
})

-- Load local file if it exists
require_opt('local')
