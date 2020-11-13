local package = {}
package.name = 'battery-notify/systemd-service'
package.dependencies = {'..'}
package.templates = {
    {
        src = 'tree/.config/systemd/user/battery-monitor.service.tmpl',
        dest = '.config/systemd/user/battery-monitor.service'
    }
}
package.variables = {home = os.getenv('HOME')}
return package
