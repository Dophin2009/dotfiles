-- luacheck: globals pkg
local lib = require('lib')

pkg.name = 'cursedtag'

-- Load local file if it exists
lib.require_opt('local')
