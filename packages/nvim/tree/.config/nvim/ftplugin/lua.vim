""  fixers
"   lua-format fixer
function! LuaFix(buffer) abort
  let l:executable = 'lua-format'

  return {
  \   'command': ale#Escape(l:executable),
  \   'read_buffer': 1
  \}
endfunction
call ale#fix#registry#Add('lua-format', 'LuaFix', ['lua'], 'Format lua code with lua-format')
let b:ale_fixers = ['lua-format']
