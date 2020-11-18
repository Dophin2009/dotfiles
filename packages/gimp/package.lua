require('lib')

pkg.name = 'gimp'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
