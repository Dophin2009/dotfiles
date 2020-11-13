local package = {}
package.name = 'task'
package.dependencies = {'../sh'}

local profile = require('profile').task

package.files = {
    {
        src = 'tree/.config/task/themes/' .. profile.theme .. '.theme',
        dest = '.config/task/theme.theme'
    }
}
return package
