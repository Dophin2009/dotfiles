local lib = require('lib')

pkg.name = 'python'
pkg.dependencies:extend('../../sh')

-- Load local file if exists
lib.require_opt('local')
