require('lib')

pkg.name = 'qt'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
