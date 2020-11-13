local package = {}
package.name = 'qutebrowser'
package.dependencies = {'../qt'}

local profile = require('profile').qutebrowser
package.files = {
    {
        src = 'tree/.config/qutebrowser/themes/' .. profile.theme .. '.py',
        dest = '.config/qutebrowser/theme.py'
    }
}
local next_idx = 1

-- Load searchengines.yaml if it it exists
if not io.open('searchengines.yaml') == nil then
    package.files[next_idx] = {
        src = 'searchengines.yaml',
        dest = '.config/qutebrowser/searchengines.yaml'
    }
    next_idx = next_idx + 1
end

-- Load config.local.py if it exists
if not io.open('config.local.py') == nil then
    package.files[next_idx] = {
        src = 'config.local.py',
        dest = '.config/qutebrowser/config.local.py'
    }
    next_idx = next_idx + 1
end

package.after_link = {
    {
        name = 'Download greasemonkey scripts',
        string = 'hooks/greasemonkey-dl.sh'
    }
}

return package
