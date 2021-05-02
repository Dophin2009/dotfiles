local lib = require('lib')

pkg.name = 'wget'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
lib.require_opt('local')
