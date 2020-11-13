local package = {}
package.name = 'mpd'
package.dependencies = {'../sh'}
package.templates = {
    {src = 'tree/.config/mpd/mpd.conf.tmpl', dest = '.config/mpd/mpd.conf'}
}

local home = os.getenv('HOME')
local lcl = require('local')
package.variables = {home = home}
for k, v in ipairs(lcl) do package.variables[k] = v end

return package
