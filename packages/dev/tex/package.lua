-- luacheck: globals pkg
local lib = require('lib')

pkg.name = 'tex'
pkg.dependencies:extend('../../sh')

-- Load local file if it exists
lib.require_opt('local')
