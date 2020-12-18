require('lib')

pkg.name = 'maven'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')
