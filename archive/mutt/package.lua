local lib = require('lib')

pkg.name = 'mutt'
pkg.dependencies:extend('../sh')

-- Load local file if exists
lib.require_opt('local')
