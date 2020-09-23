if exists("did_load_filetypes")
  finish
endif

" detect markdown files
aug markdown_ft_detection
  autocmd BufRead,BufNewFile *.md set filetype=pandoc
aug end

" detect proselint configuration
aug proselint_ft_detection
  au! BufNewFile,BufRead ~/.config/proselint/config set filetype=json
aug end

" detect i3 configuration file
aug i3config_ft_detection
  au! BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" mail filetype
augroup mail_ft_detection
  " Mail
  autocmd BufRead,BufNewFile *mutt-* set filetype=mail
augroup END
