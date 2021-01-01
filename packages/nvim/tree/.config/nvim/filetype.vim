if exists('did_load_filetypes')
  finish
endif

" detect markdown files
aug ftdetectmd
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=pandoc
aug end

" detect handlebars files
aug ftdetecthbs
  au! BufNewFile,BufFilePre,BufRead *.hbs set filetype=handlebars
  " find a smarter way to do this:
  au! BufNewFile,BufFilePre,BufRead *.ini.hbs set filetype=dosini.handlebars
  au! BufNewFile,BufFilePre,BufRead *.i3config.hbs set filetype=i3config.handlebars
  au! BufNewFile,BufFilePre,BufRead *.yaml.hbs set filetype=yaml.handlebars
  au! BufNewFile,BufFilePre,BufRead *.yml.hbs set filetype=yaml.handlebars
aug end

" detect luacheckrc
aug ftdetectluacheckrc
  au! BufNewFile,BufRead .luacheckrc set filetype=lua
aug end

" detect proselint configuration
aug ftdetectproselint
  au! BufNewFile,BufRead ~/.config/proselint/config set filetype=json
aug end

" detect swc configuration
aug ftdetectswcrc
  au! BufNewFile,BufRead .swcrc set filetype=json
aug end

" detect i3 configuration file
aug ftdetecti3config
  au! BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" detect mail filetype
aug ftdetectmail
  au! BufNewFile,BufRead *mutt-* set filetype=mail
aug end

" detect Cargo.toml
if has('nvim')
  aug ftdetect_cargotoml
    autocmd BufRead Cargo.toml call crates#toggle()
  aug end
endif
