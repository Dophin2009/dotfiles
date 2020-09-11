""  linters
let b:ale_linter_aliases = ['text']
let b:ale_linters = ['textlint', 'vale', 'write-good']
""  fixers
"   define pandoc formatter
function PandocFix(buffer) abort
  let l:executable = 'pandoc'
  let l:filename = ale#Escape(bufname(a:buffer))
  let l:input_flags = ['markdown',
    \ '+abbreviations',
    \ '+autolink_bare_uris',
    \ '+markdown_attribute',
    \ '+mmd_header_identifiers',
    \ '+mmd_link_attributes',
    \ '+tex_math_double_backslash',
    \ '+emoji',
    \ '+task_lists',
    \ ]
  let l:target_flags = ['markdown',
    \ '+raw_tex',
    \ '-native_spans',
    \ '-simple_tables',
    \ '-multiline_tables',
    \ '-fenced_code_attributes',
    \ '+emoji',
    \ '+task_lists',
    \ ]
  return {
  \   'command': ale#Escape(l:executable)
  \     . ' -f ' . join(l:input_flags, '')
  \     . ' -t ' . join(l:target_flags, '')
  \     . ' -s --wrap=auto --atx-headers '
  \     . l:filename
  \}
endfunction

call ale#fix#registry#Add('pandoc', 'PandocFix', ['pandoc'], "Pandoc formatter")
let b:ale_fixers = ['pandoc']
