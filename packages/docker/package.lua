require('lib')

pkg.name = 'docker'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
