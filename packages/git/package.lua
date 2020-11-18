require('lib')

pkg.name = 'git'
pkg.dependencies:extend('../sh')

pkg.files.extra:push({src = 'config.local', dest = '.config/git/config.local'})

-- Load local file if exists
require_opt('local')
