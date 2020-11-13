local package = {}
package.name = 'i3'
package.dependencies = {
    '../battery-notify', '../polybar', '../wallpaper', '../fscreenshot'
}
package.templates = {
    {src = 'tree/.config/i3/config.tmpl', dest = '.config/i3/config'}
}
package.after_link = {{name = 'Reload i3', string = 'hooks/reload-i3.sh'}}

local lcl = require('local')
local profile = require('profile').i3
for k, v in pairs(lcl) do profile[k] = v end
package.variables = profile

return package
