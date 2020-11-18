require('lib')

pkg.name = 'bin'
pkg.dependencies:extend('../sh')

-- Load local file if exist
require_opt('local')
