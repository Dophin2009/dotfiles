require('lib')

pkg.name = 'tex'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
require_opt('local')
