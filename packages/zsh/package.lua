require('lib')

pkg.name = 'zsh'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
