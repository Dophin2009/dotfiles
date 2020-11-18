require('lib')

pkg.name = 'gnupg'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
