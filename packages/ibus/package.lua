require('lib')

pkg.name = 'ibus'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
