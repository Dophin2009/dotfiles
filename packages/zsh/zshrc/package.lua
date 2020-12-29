require('lib')
local lfs = require('lfs')

pkg.name = 'zshrc'
pkg.dependencies:extend('..')

-- Load local file if it exists
require_opt('local')
