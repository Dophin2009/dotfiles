require('lib')

pkg.name = 'rust'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
require_opt('local')
