setlocal conceallevel=2
setlocal spell
setlocal spelllang=en_gb

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
