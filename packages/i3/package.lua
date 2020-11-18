require('lib')

pkg.name = 'i3'
pkg.dependencies:extend('../battery-notify', '../polybar', '../wallpaper',
                        '../fscreenshot')

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/i3/config.tmpl',
    dest = '.config/i3/config',
    engine = 'gotmpl'
})

pkg.hooks.post.push({name = 'Reload i3', command = 'hooks/reload-i3.sh'})

local profile = require('profile').i3
pkg.variables:overwrite(profile)

local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
require_opt('local')
