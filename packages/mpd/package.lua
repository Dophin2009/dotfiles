require('lib')

pkg.name = 'mpd'
pkg.dependencies:extend('../sh')

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/mpd/mpd.conf.tmpl',
    dest = '.config/mpd/mpd.conf',
    engine = 'gotmpl'
})

pkg.variables.home = os.getenv('HOME')
local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
require_opt('local')
