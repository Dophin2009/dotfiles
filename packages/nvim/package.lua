local package = {}

package.name = 'nvim'
package.requirements = {'neovim-nightly'}
package.dependencies = {'../sh'}

local profile = require('profile').nvim
package.files = {
    {
        src = 'tree/.config/nvim/themes/' .. profile.theme .. '.vim',
        dest = '.config/nvim/theme.vim'
    }
}

return package
