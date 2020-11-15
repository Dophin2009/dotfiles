local package = {}
package.name = 'fzf'
package.dependencies = {'../sh'}

local profile = require('profile').fzf
package.files = {
    {src = 'themes/' .. profile.name, dest = '.config/sh/envc/fzf'}
}

return package
