require('lib')

pkg.name = 'fscreenshot'
pkg.dependencies:extend('../sh')

-- Load local file if exists
require_opt('local')
