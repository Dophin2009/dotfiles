"""
""" WINDOW
"""

""" lsp-status.nvim
function! LspWarnStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval('require("lsp").warning_status()')
  endif
  return ''
endfunction

function! LspErrorStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval('require("lsp").error_status()')
  endif
  return ''
endfunction

""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
""  append lsp-status
function! AirlineInit()
  call airline#parts#define_function('lsp-warn-status', 'LspWarnStatus')
  call airline#parts#define_function('lsp-error-status', 'LspErrorStatus')
  let g:airline_section_warning = airline#section#create_right(['lsp-warn-status'])
  let g:airline_section_error = airline#section#create_right(['lsp-error-status'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

""" gitgutter
let g:gitgutter_max_signs = 1000
