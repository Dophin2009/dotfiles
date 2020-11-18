require('lib')

pkg.name = 'ruby'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
