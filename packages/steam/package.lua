local package = {}
package.name = 'steam'
package.dependencies = {'../sh'}
package.after_link = {
    {string = 'hooks/install-metro.sh', name = 'Install metro-for-steam'}
}
return package
