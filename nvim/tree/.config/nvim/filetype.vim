if exists("did_load_filetypes")
  finish
endif

" detect i3 configuration file
aug i3config_ft_detection
  au! BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" mail filetype
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-* set filetype=mail
augroup END
