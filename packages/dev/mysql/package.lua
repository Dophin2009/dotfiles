require('lib')

pkg.name = 'mysql'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')
