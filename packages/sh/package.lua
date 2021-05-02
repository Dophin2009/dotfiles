-- luacheck: globals pkg
local lib = require('lib')
local lfs = require('lfs')

pkg.name = 'sh'

if lfs.attributes('local.sh') then
    pkg.files.extra:extend({
        src = 'local.sh',
        dest = '.config/sh/load/local',
        replace_dirs = true
    })
end

-- Load local file if it exists
lib.require_opt('local')
