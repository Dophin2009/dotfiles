-- luacheck: globals pkg
local lib = require('lib')

pkg.name = 'bitwarden'
pkg.dependencies:extend('../sh')

-- Load local file if exist
lib.require_opt('local')
