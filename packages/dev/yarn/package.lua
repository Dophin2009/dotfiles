require('lib')

pkg.name = 'yarn'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
require_opt('local')
