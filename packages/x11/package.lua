local package = {}
package.name = 'x11'
package.dependencies = {'../sh'}
package.files = {{src = 'xinitrc.local', dest = '.config/X11/xinitrc.local'}}
package.variables = require('profile').x11

local xresources_theme = 'xresources.theme'
package.templates = {
    {
        src = 'tree/.config/X11/xresources.theme.tmpl',
        dest = '.config/X11/' .. xresources_theme
    }
}

local home = os.getenv('HOME')
package.after_link = {
    {
        string = 'hooks/xrdb-merge.sh "' .. home .. '/.config/X11/' ..
            xresources_theme .. '"',
        name = 'Load ' .. xresources_theme
    }
}

return package
