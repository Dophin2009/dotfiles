local lib = require('lib')

pkg.name = 'elinks'
pkg.dependencies:extend('../sh')

-- Load local file if exists
lib.require_opt('local')
