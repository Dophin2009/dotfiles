require('lib')

pkg.name = 'battery-notify'
pkg.dependencies:extend('../sh')

pkg.files.trees:front().ignore:push('**/*.hbs')
pkg.files.templates:push({
    src = 'tree/.config/systemd/user/battery-monitor.service.hbs',
    dest = '.config/systemd/user/battery-monitor.service',
    engine = 'handlebars'
})

pkg.variables.home = os.getenv('HOME')

-- Load local file if it exists
require_opt('local')
