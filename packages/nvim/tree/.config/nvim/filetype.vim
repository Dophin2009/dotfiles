if exists("did_load_filetypes")
  finish
endif

" detect markdown files
aug markdown_ft_detection
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=pandoc
aug end

" detect proselint configuration
aug proselint_ft_detection
  au! BufNewFile,BufRead ~/.config/proselint/config set filetype=json
aug end

" detect i3 configuration file
aug i3config_ft_detection
  au! BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" detect mail filetype
aug mail_ft_detection
  au! BufNewFile,BufRead *mutt-* set filetype=mail
aug end
