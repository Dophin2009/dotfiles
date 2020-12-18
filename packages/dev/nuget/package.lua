require('lib')

pkg.name = 'nuget'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
require_opt('local')
