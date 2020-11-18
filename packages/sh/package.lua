pkg.name = 'sh'

table.insert(pkg.files.extra, {
    src = 'local',
    dest = '.config/sh/local',
    link_type = 'copy',
    replace_dirs = true
})
