require('lib')

pkg.name = 'go'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
