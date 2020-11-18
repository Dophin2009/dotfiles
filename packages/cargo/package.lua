require('lib')

pkg.name = 'cargo'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
