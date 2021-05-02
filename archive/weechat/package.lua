local lib = require('lib')

pkg.name = 'weechat'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
lib.require_opt('local')
