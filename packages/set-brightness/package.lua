require('lib')

pkg.name = 'set-brightness'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
