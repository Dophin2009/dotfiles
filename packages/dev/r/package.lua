require('lib')

pkg.name = 'r'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')
