require('lib')

pkg.name = 'android'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
require_opt('local')
