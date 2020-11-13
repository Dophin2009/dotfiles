local package = {}
package.name = 'beets'
package.templates = {
    {
        src = 'tree/.config/beets/config.yaml.tmpl',
        dest = '.config/beets/config.yaml'
    }
}
package.after_link = {
    {name = 'Create beets data directory', string = 'hooks/mk-datadir.sh'}
}

local lcl = require('local')
package.variables = {home = os.getenv('HOME')}
for k, v in pairs(lcl) do package.variables[k] = v end

return package
