local lib = require('lib')

pkg.name = 'dotnet'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
lib.require_opt('local')
