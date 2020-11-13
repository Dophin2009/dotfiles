local package = {}
package.name = 'tmux'
package.dependencies = {'../sh'}
package.after_link = {string = 'hooks/reload-tmux.sh', name = 'Reload tmux'}

local profile = require('profile').tmux
package.files = {
    {
        src = 'tree/.config/tmux/themes/' .. profile.theme .. '.conf',
        dest = '.config/tmux/theme.conf'
    }
}

return package
