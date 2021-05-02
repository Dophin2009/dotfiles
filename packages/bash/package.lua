-- luacheck: globals pkg
local lib = require('lib')

pkg.name = 'bat'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
lib.require_opt('local')
