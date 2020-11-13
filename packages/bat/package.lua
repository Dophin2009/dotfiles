local package = {}
package.name = 'bat'
package.templates = {
    {src = 'tree/.config/bat/config.tmpl', dest = '.config/bat/config'}
}
package.variables = require('profile').bat
return package
