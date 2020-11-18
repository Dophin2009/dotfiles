require('lib')

pkg.name = 'dicth'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
