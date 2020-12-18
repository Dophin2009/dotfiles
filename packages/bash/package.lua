require('lib')

pkg.name = 'bat'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
