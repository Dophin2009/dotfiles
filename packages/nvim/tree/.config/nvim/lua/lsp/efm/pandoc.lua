local bin = 'pandoc'
local input_flags = {
    'markdown', '+abbreviations', '+autolink_bare_uris', '+markdown_attribute',
    '+mmd_header_identifiers', '+mmd_link_attributes',
    '+tex_math_double_backslash', '+emoji', '+task_lists'
}
local target_flags = {
    'markdown', '+raw_tex', '-native_spans', '-simple_tables',
    '-multiline_tables', '-fenced_code_attributes', '+emoji', '+task_lists'
}

local flags = '-f ' .. table.concat(input_flags, '') .. ' -t ' ..
                  table.concat(target_flags, '') ..
                  ' -s --wrap=auto --atx-headers --columns=80'
local command = bin .. ' ' .. flags

return {formatCommand = command}
