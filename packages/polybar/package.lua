local package = {}
package.name = 'polybar'
package.dependencies = {'../sh'}
package.templates = {
    {
        src = 'tree/.config/polybar/settings.ini.tmpl',
        dest = '.config/polybar/settings.ini'
    }, {
        src = 'tree/.config/polybar/modules/network.ini.tmpl',
        dest = '.config/polybar/modules/network.ini'
    }
}

local home = os.getenv('HOME')
package.after_link = {
    {name = 'Reload polybar', string = home .. '/.local/bin/launch-polybar'}
}

package.variables = require('profile').polybar

local lcl = require('local')

local network = lcl.network
if network == nil then network = {interface = '', type = ''} end
package.variables.network = network

local map_bars = function(bar)
    return {
        left = table.concat(bar.left, ' '),
        center = table.concat(bar.center, ' '),
        right = table.concat(bar.right, ' ')
    }
end
package.variables.modules = {
    top = map_bars(lcl.modules.top),
    bottom = map_bars(lcl.modules.bottom)
}

return package
