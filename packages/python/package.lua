require('lib')

pkg.name = 'python'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
