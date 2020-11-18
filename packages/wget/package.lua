require('lib')

pkg.name = 'wget'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
