local package = {}
package.name = 'gtk'
package.dependencies = {'../sh'}
package.files = {}

local profile = require('profile').gtk
local themes = {"gruvbox-gtk", "nordic"}
local count = 0;
for k, v in pairs(themes) do
    package.files[k] = {
        src = 'tree/.local/share/themes/' .. v,
        dest = '.local/share/themes/' .. v,
        replace_dirs = true
    }
    count = k
end
package.files[count + 1] = {
    src = 'tree/.local/share/themes/' .. profile.theme,
    dest = '.local/share/themes/current-theme',
    replace_dirs = true
}

return package
