require('lib')

pkg.name = 'pacman'
pkg.dependencies:extend('../sh', '../zsh')

-- Load local file if exists
require_opt('local')
