" conceal settings
let g:asciidoctor_syntax_conceal = 1
set conceallevel=0

" soft 90 char limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.\+/
