local package = {}

package.name = 'sh'
package.file = {
    {
        src = 'local',
        dest = '.config/sh/local',
        link_type = 'copy',
        replace_dirs = true
    }
}

return package
