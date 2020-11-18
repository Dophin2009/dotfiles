require('lib')

pkg.name = 'mutt'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
