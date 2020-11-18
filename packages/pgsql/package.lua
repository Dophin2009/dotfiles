require('lib')

pkg.name = 'pgsql'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
