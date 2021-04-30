if exists('did_load_filetypes')
  finish
endif

" detect markdown files
aug FtdetectMd
  au! BufNewFile,BufFilePre,BufRead *.md set filetype=pandoc
aug end

" detect handlebars files
aug FtdetectHbs
  au! BufNewFile,BufFilePre,BufRead *.hbs set filetype=handlebars
  " find a smarter way to do this:
  au! BufNewFile,BufFilePre,BufRead *.ini.hbs set filetype=dosini.handlebars
  au! BufNewFile,BufFilePre,BufRead *.i3config.hbs set filetype=i3config.handlebars
  au! BufNewFile,BufFilePre,BufRead *.yaml.hbs set filetype=yaml.handlebars
  au! BufNewFile,BufFilePre,BufRead *.yml.hbs set filetype=yaml.handlebars
aug end

" detect latexmkrc
aug FtdetectLatexmk
  au! BufNewFile,BufFilePre,BufRead latexmkrc,.latexmkrc  set filetype=perl
aug end

" detect luacheckrc
aug FtdetectLuacheckrc
  au! BufNewFile,BufFilePre,BufRead .luacheckrc set filetype=lua
aug end

" detect proselint configuration
aug FtdetectProselint
  au! BufNewFile,BufFilePre,BufRead ~/.config/proselint/config set filetype=json
aug end

" detect rust-toolchain file
aug FtdetectRustToolchain
  au! BufNewFile,BufFilePre,BufRead rust-toolchain set filetype=toml
aug end

" detect swc configuration
aug FtdetectSwcrc
  au! BufNewFile,BufFilePre,BufRead .swcrc set filetype=json
aug end

" detect i3 configuration file
aug FtdetectI3config
  au! BufNewFile,BufFilePre,BufRead ~/.config/i3/config set filetype=i3config
aug end

" detect mail filetype
aug FtdetectMail
  au! BufNewFile,BufFilePre,BufRead *mutt-* set filetype=mail
aug end
