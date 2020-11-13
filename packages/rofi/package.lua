local package = {}
package.name = 'rofi'
package.templates = {
    {
        src = 'tree/.config/rofi/config.rasi.tmpl',
        dest = '.config/rofi/config.rasi'
    }
}
package.variables = require('profile').rofi
return package
