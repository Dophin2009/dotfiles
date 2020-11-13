local package = {}
package.name = 'git'
package.dependencies = {'../sh'}
package.files = {{src = 'config.local', dest = '.config/git/config.local'}}
return package
