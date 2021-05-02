local lib = require('lib')

pkg.name = 'mpd'
pkg.dependencies:extend('../sh')

pkg.files.templates:push({
    src = 'config/mpd.conf.hbs',
    dest = '.config/mpd/mpd.conf',
    engine = 'handlebars'
})

pkg.variables.home = os.getenv('HOME')
local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
lib.require_opt('local')
