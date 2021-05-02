local lib = require('lib')

pkg.name = 'youtube-dl'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
lib.require_opt('local')
