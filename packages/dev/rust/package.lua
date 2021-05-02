local lib = require('lib')

pkg.name = 'rust'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
lib.require_opt('local')
