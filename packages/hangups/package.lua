local package = {}
package.name = 'hangups'
package.templates = {
    {
        src = 'tree/.config/hangups/hangups.conf.tmpl',
        dest = '.config/hangups/hangups.conf'
    }
}
package.variables = require('profile').hangups
return package
