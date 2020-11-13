local package = {}
package.name = 'dunst'
package.templates = {
    {src = 'tree/.config/dunst/dunstrc.tmpl', dest = '.config/dunst/dunstrc'}
}
package.after_link = {
    {name = 'Restart dunst', string = 'hooks/dunst-restart.sh'}
}
package.variables = require('profile').dunst
return package
