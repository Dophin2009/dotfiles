-- luacheck: globals pkg
local lib = require('lib')
local lfs = require('lfs')

pkg.name = 'discord'

local edroot = '.local/share/EnhancedDiscord'

local profile = require('profile').discord
if profile.theme then
    pkg.files.extra:extend({
        src = 'themes/' .. profile.theme .. '.css',
        dest = edroot .. '/plugins/style.css'
    })
end

for plugin in lfs.dir('plugins') do
    if plugin ~= '.' and plugin ~= '..' then
        pkg.files.extra:extend({
            src = 'plugins/' .. plugin,
            dest = edroot .. '/plugins/' .. plugin
        })
    end

end

lib.require_opt('local')
