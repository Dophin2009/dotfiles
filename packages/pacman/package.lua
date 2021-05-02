local lib = require('lib')

pkg.name = 'pacman'
pkg.dependencies:extend('../sh', '../zsh')

-- Load local file if exists
lib.require_opt('local')
