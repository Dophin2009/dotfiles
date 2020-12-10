return {
    lintCommand = 'htmlhint -f compact',
    lintStdin = true,
    lintFormats = {
        '%f: line %l, col %c, %trror - %m', '%f: line %l, col %c, %tarning - %m'
    }
}
