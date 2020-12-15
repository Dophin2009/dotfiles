require('lib')
local lfs = require('lfs')

pkg.name = 'zsh'
pkg.dependencies:extend('../sh')

if lfs.attributes('local.zsh') then
    pkg.files.extra:extend({src = 'local.zsh', dest = '.config/zsh/load/local'})
end

-- Load local file if it exists
require_opt('local')
