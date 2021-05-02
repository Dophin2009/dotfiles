-- luacheck: globals pkg
local lib = require('lib')
local lfs = require('lfs')

pkg.name = 'beets'
pkg.dependencies:extend('../sh')

local partials = {
    common = 'config/common.yaml',
    profile = 'config/profile.yaml.hbs'
}
if lfs.attributes('local.yaml.hbs') then partials.lcl = 'local.yaml.hbs' end

pkg.files.templates:push({
    src = 'config/config.yaml.hbs',
    dest = '.config/beets/config.yaml',
    engine = 'handlebars',
    partials = partials
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
lib.require_opt('local')
