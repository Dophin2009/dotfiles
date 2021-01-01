" No conceal
setlocal conceallevel=0

" Soft 90 char limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/
