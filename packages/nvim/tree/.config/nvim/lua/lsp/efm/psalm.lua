return {
    lintCommand = './vendor/bin/psalm --output-format=emacs --no-progress --threads=8 --diff',
    lintFormats = {'%f:%l:%c:%trror - %m', '%f:%l:%c:%tarning - %m'}
}
