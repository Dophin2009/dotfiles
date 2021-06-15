-- luacheck: globals pkg
local lib = require('lib')
local lfs = require('lfs')

pkg.name = 'i3'
pkg.dependencies:extend('../battery-notify', '../polybar', '../wallpaper')

local partials = {
    common = 'config/common.i3config',
    profile = 'config/profile.i3config.hbs'
}
if lfs.attributes('config/local.i3config.hbs') ~= nil then
    partials.lcl = 'config/local.i3config.hbs'
end

pkg.files.templates:push({
    src = 'config/config.i3config.hbs',
    dest = '.config/i3/config',
    engine = 'handlebars',
    partials = partials
})

pkg.hooks.post.push({name = 'Reload i3', command = 'hooks/reload-i3.sh'})

local profile = require('profile').i3
pkg.variables:overwrite(profile)

local lcl = require('variables')
pkg.variables:overwrite(lcl)

-- Load local file if it exists
lib.require_opt('local')
