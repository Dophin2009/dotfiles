local package = {}
package.name = 'mpdnd/systemd-service'
package.dependencies = {'..'}
package.templates = {
    {
        src = "tree/.config/systemd/user/mpdnd.service.tmpl",
        dest = ".config/systemd/user/mpdnd.service"
    }
}
package.variables = require('local')
return package
