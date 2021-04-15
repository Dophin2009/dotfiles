local bin = 'eslint_d'

return {
    lintCommand = bin .. ' -f visualstudio --stdin',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f(%l,%c): %trror %m", "%f(%l,%c): %tarning %m"}
}
