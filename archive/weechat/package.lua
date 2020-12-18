require('lib')

pkg.name = 'weechat'
pkg.dependencies:extend('../sh')

-- Load local file if it exists
require_opt('local')
