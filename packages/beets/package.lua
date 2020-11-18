require('lib')

pkg.name = 'beets'
pkg.dependencies:extend('../sh')

pkg.files.trees:front().ignore:push('**/*.hbs')
pkg.files.templates:push({
    src = 'tree/.config/beets/config.yaml.hbs',
    dest = '.config/beets/config.yaml',
    engine = 'handlebars'
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
