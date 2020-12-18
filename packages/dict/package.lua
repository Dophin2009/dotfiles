require('lib')

pkg.name = 'dict'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
