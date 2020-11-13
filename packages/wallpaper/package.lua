local package = {}
package.name = 'wallpaper'
package.dependencies = {'../sh'}
package.after_link = {
    {name = 'Reload wallpaper', string = 'hooks/reload-wallpaper.sh'}
}

local profile = require('local')
package.files = {
    {src = 'images', dest = '.config/wallpaper/images', replace_dirs = true}, {
        src = 'images/' .. profile.name .. '.jpg',
        dest = '.config/wallpaper.still.jpg'
    }
}
return package
