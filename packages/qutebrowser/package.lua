local lib = require('lib')
local lfs = require('lfs')

pkg.name = 'qutebrowser'
pkg.dependencies:extend('../qt')

local profile = require('profile').qutebrowser
pkg.files.extra:extend({
    src = 'tree/.config/qutebrowser/themes/' .. profile.theme .. '.py',
    dest = '.config/qutebrowser/theme.py'
})

-- Load searchengines.yaml if it it exists
if lfs.attributes('searchengines.yaml') then
    pkg.files.extra:extend({
        src = 'searchengines.yaml',
        dest = '.config/qutebrowser/searchengines.yaml'
    })
end

if lfs.attributes('bookmarks') then
    pkg.files.extra:extend({
        src = 'bookmarks',
        dest = '.config/qutebrowser/bookmarks/urls'
    })
end

-- Load config.local.py if it exists
if lfs.attributes('config.local.py') then
    pkg.files.extra:extend({
        src = 'config.local.py',
        dest = '.config/qutebrowser/config.local.py'
    })
end

pkg.hooks.post:extend({
    name = 'Download greasemonkey scripts',
    command = 'hooks/greasemonkey-dl.sh'
})

-- Load local file if it exists
lib.require_opt('local')
