require('lib')

pkg.name = 'java'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')