require('lib')

pkg.name = 'terminfo'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
