require('lib')

pkg.name = 'bitwarden'
pkg.dependencies:extend('../sh')

-- Load local file if exist
require_opt('local')
