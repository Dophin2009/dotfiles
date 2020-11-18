require('lib')

pkg.name = 'notmuch'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
