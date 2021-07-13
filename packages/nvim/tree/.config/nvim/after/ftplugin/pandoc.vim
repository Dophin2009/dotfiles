"   tab size
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal conceallevel=2

" no wrapping
setlocal nowrap

" local spellfile
let b:buffer_dir = expand('%:p:h') . '/.vim'
let b:local_spellfile = findfile('spell.en.add', b:buffer_dir)
if filereadable(b:local_spellfile)
  let b:local_spellfile = fnamemodify(b:local_spellfile, ':p')
  execute 'setlocal spellfile=' . escape(b:local_spellfile, ' ')
  setlocal spell
  setlocal spelllang=en_us
else
  setlocal spellfile=
end

" tabular
" auto-align when using pipe key to make table
inoremap <silent> <Bar> <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
