require('lib')

pkg.name = 'stack'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
require_opt('local')
