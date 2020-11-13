local package = {}
package.name = 'user-dirs'
package.templates = {{src = 'tree/.config/user-dirs.dirs.tmpl', dest = '.config/user-dirs.dirs'}}
package.variables = require('local')
return package
