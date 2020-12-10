local bin = './node_modules/.bin/stylelint'
return {
    lintCommand = bin .. ' -f compact',
    lintFormats = {
        '%f: line %l, col %c, %trror - %m', '%f: line %l, col %c, %tarning - %m'
    },
    formatCommand = bin .. ' --fix'
}
