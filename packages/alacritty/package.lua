local package = {}

package.name = 'alacritty'
package.dependencies = {'../qt'}
package.templates = {
    {
        src = 'tree/.config/alacritty/alacritty.yml.tmpl',
        dest = '.config/alacritty/alacritty.yml'
    }
}

local profile = require('profile').alacritty
local lcl = require('local')
for k, v in pairs(lcl) do profile[k] = v end

package.variables = profile

return package
