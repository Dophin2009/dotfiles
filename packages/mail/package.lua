-- luacheck: globals pkg
local lib = require 'lib'
local lfs = require 'lfs'

pkg.name = 'mail'
pkg.dependencies:extend('../sh')

if lfs.attributes('./local') then pkg.files.trees:extend({path = './local'}) end

-- Load local file if exists
lib.require_opt('local')
