local bin = 'eslint_d'

return {
    lintCommand = bin .. ' -f visualstudio --stdin --stdin-filename ${INPUT}',
    lintFormats = {"%f(%l,%c): %trror %m", "%f(%l,%c): %tarning %m"},
    lintIgnoreExitCode = true,
    lintStdin = true
}
