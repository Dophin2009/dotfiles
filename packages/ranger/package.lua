require('lib')

pkg.name = 'ranger'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
