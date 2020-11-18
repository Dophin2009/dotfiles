require('lib')

pkg.name = 'gradle'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
