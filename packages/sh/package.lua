require('lib')

pkg.name = 'sh'

pkg.files.extra:push({
    src = 'local',
    dest = '.config/sh/local',
    link_type = 'copy',
    replace_dirs = true
})

-- Load local file if it exists
require_opt('local')
