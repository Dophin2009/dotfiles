globals = {
    pkg = {
        other_fields = false,
        fields = {
            name,
            dependencies,
            files = {
                other_fields = false,
                fields = {
                    trees, extra, templates, link_type, replace_files,
                    replace_dirs
                }
            },
            hooks = {other_fields = false, fields = {pre, install, post}},
            variables
        }
    }
}
