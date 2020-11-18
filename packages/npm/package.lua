require('lib')

pkg.name = 'npm'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
