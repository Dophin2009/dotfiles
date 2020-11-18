require('lib')

pkg.name = 'nvm'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
