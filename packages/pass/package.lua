require('lib')

pkg.name = 'pass'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
