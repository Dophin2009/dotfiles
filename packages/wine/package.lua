require('lib')

pkg.name = 'wine'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
