local package = {}
package.name = 'mpdnd'
package.dependencies = {'../sh', '../mpd'}
package.templates = {
    {
        src = 'tree/.config/mpdnd/config.toml.tmpl',
        dest = '.config/mpdnd/config.toml'
    }
}
package.variables = require('local')
return package
