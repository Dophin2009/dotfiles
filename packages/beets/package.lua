require('lib')

pkg.name = 'beets'
pkg.dependencies:extend('../sh')

pkg.files.templates:push({
    src = 'config/config.yaml.hbs',
    dest = '.config/beets/config.yaml',
    engine = 'handlebars',
    partials = {
        common = 'config/common.yaml',
        profile = 'config/profile.yaml.hbs'
    }
})

pkg.hooks.post:push({
    name = 'Create beets data directory',
    command = 'hooks/mk-datadir.sh'
})

-- Local config required
local lcl = require('variables')
pkg.variables.home = os.getenv('HOME')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
require_opt('local')
