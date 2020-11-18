require('lib')

pkg.name = 'vifm'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
