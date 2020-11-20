require('lib')
local lfs = require('lfs')

pkg.name = 'newsboat'

if lfs.attributes('urls') then
    pkg.files.extra:extend({src = 'urls', dest = '.config/newsboat/urls'})
end

-- Load local file if exists
require_opt('local')
