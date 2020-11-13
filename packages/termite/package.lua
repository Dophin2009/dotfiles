local package = {}
package.name = 'termite'
package.templates = {{src = 'tree/.config/termite/config.tmpl', dest = '.config/termite/config'}}
package.variables = require('profile').termite
return package
