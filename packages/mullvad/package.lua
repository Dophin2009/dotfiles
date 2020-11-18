require('lib')

pkg.name = 'mullvad'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
