local lib = require('lib')

pkg.name = 'pass'
pkg.dependencies:extend('../sh')

-- Load local file if exists
lib.require_opt('local')
