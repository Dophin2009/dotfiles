require('lib')

pkg.name = 'beets'
pkg.dependencies:extend('../sh')

pkg.files.trees:front().ignore:push('**/*.tmpl')
pkg.files.templates:push({
    src = 'tree/.config/beets/config.yaml.tmpl',
    dest = '.config/beets/config.yaml',
    engine = 'gotmpl'
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
