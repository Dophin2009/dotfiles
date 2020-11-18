require('lib')

pkg.name = 'dotnet'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
