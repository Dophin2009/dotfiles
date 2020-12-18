require('lib')

pkg.name = 'node'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')
