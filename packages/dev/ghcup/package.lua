require('lib')

pkg.name = 'ghcup'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')
